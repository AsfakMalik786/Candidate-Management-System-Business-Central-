namespace CMSInternshipProject.CMSInternshipProject;
using CandidateManagmentsystem.CandidateManagmentsystem;
using Microsoft.Foundation.NoSeries;
using Microsoft.HumanResources.Employee;

codeunit 53101 "CMS Candidate Management Codeu"
{
    procedure ScheduleInterview(var CandidateApp: Record "CMS Candidate Application")
    var
        InterviewCommittee: Record "CMS Interview Committee";
    begin
        if CandidateApp.Status = CandidateApp.Status::Rejected then
            Error('Rejected candidate %1 cannot schedule interview.', CandidateApp."No.");
        if CandidateApp.Status = CandidateApp.Status::Selected then
            Error('Candidate %1 is Selected, Candidate Can Not Requiered For The Interview', CandidateApp."No.");


        CandidateApp.TestField(Status, CandidateApp.Status::Open);
        CandidateApp.TestField("First Responsible Interviewer");
        CandidateApp.TestField("First Interview Committee");
        CandidateApp.TestField("First Interview Location");
        CandidateApp.TestField("First Best Day to Reach");
        CandidateApp.TestField("First Best Time to Reach");

        InterviewCommittee.Get(CandidateApp."First Interview Committee");
        if (InterviewCommittee."Interviewer 1 Code" = '') and
           (InterviewCommittee."Interviewer 2 Code" = '') and
           (InterviewCommittee."Interviewer 3 Code" = '') then
            Error('Interview Committee %1 has no interviewers defined.', InterviewCommittee.Code);

        CandidateApp.Status := CandidateApp.Status::"Interview Rounds";
        CandidateApp.Modify(true);
        Message('First interview scheduled for candidate %1.', CandidateApp."No.");
    end;

    procedure MoveToNextRound(var CandidateApp: Record "CMS Candidate Application")
    var
        CandidateMgtSetup: Record "CMS Candidate Mgt Setup";
        CurrentRound: Integer;
    // NumRounds: Integer;
    // Choice: Integer;
    // options: Label 'Confirm,Rejected';
    // Confirmed: Boolean;
    // Canapp: Record "CMS Candidate Application";
    begin
        CandidateApp.TestField(Status, CandidateApp.Status::"Interview Rounds");
        CandidateMgtSetup.Get();
        CurrentRound := GetCurrentInterviewRound(CandidateApp);

        if CurrentRound >= CandidateMgtSetup."Interview Rounds".AsInteger() then
            Error('Candidate %1 is already on the last interview round.', CandidateApp."No.");

        CandidateApp.TestField(Status, CandidateApp.Status::"Interview Rounds");

        ValidateNextRoundFields(CandidateApp, CurrentRound + 1);
        Message('Candidate %1 moved to interview round %2.', CandidateApp."No.", CurrentRound + 1);

        if CandidateApp.Status = CandidateApp.Status::Selected then
            Error('There is no more interview because %1 candidate is selected', CandidateApp."No.");
        if CandidateApp.Status = CandidateApp.Status::Rejected then
            Error('Rejected candidate %1 cannot schedule interview.', CandidateApp."No.");

        if CandidateApp.Status = CandidateApp.Status::Open then
            Error('Candidate %1 is Open, Change The Status For The Interview', CandidateApp."No.");
        case CurrentRound of
            1:
                begin
                    if CandidateApp."First Interview Round" = false then
                        CandidateApp.TestField("First Best Day to Reach");
                    CandidateApp.TestField("First Best Time to Reach");
                    CandidateApp.TestField("First Interview Committee");
                    CandidateApp.TestField("First Priority");
                    CandidateApp.TestField("First Remarks");
                    CandidateApp."First Interview Round" := true;

                    CandidateApp.Modify(true);

                end;

        end;

    end;

    procedure ConfirmCandidate(var CandidateApp: Record "CMS Candidate Application")
    var
        Employee: Record Employee;
        CandidateMgtSetup: Record "CMS Candidate Mgt Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        CandidateApp.TestField(Status);

        if CandidateApp.Status = CandidateApp.Status::Rejected then
            Error('Cannot confirm a rejected candidate application %1.', CandidateApp."No.");

        if CandidateApp.Status = CandidateApp.Status::Selected then
            Error('Candidate %1 is already confirmed as an employee.', CandidateApp."No.");

        // Check if employee already exists for this candidate
        if Employee.Get(CandidateApp."No.") then
            Error('An employee record already exists for candidate application %1.', CandidateApp."No.")
        else begin
            // Make sure setup is valid
            CandidateMgtSetup.Get();
            CandidateMgtSetup.TestField("Employee Nos.");

            // Create employee record
            Employee.Init();
            Employee."No." := NoSeriesMgt.GetNextNo(CandidateMgtSetup."Employee Nos.", WorkDate(), true);
            Employee."Candidate Application No." := CandidateApp."No.";
            Employee."First Name" := CandidateApp."First Name";
            Employee."Middle Name" := CandidateApp."Middle Name";
            Employee."Last Name" := CandidateApp."Last Name";
            Employee.Designation := CandidateApp."Applied Designation";
            Employee."E-mail" := CandidateApp."E-mail ";
            Employee."Phone No." := CandidateApp."Contact No.";
            Employee.Insert(true);

            // Update candidate status
            CandidateApp.Status := CandidateApp.Status::Selected;
            CandidateApp.Modify(true);

            Message('Candidate %1 confirmed as employee %2.', CandidateApp."No.", Employee."No.");
        end;
    end;

    procedure RejectCandidate(var CandidateApp: Record "CMS Candidate Application")
    begin
        CandidateApp.TestField(Status);
        if CandidateApp.Status = CandidateApp.Status::Selected then
            Error('Cannot reject a confirmed candidate application %1.', CandidateApp."No.");
        if CandidateApp.Status = CandidateApp.Status::Open then
            Error('Cannot reject an open candidate application %1.', CandidateApp."No.");
        if CandidateApp.Status = CandidateApp.Status::"Interview Rounds" then
            Error('Cannot reject a candidate application in interview rounds %1.', CandidateApp."No.");

        CandidateApp.Status := CandidateApp.Status::Rejected;
        CandidateApp.Modify(true);
        Message('Candidate application %1 rejected.', CandidateApp."No.");
    end;

    local procedure GetCurrentInterviewRound(CandidateApp: Record "CMS Candidate Application"): Integer
    begin
        if CandidateApp."First Priority" <> CandidateApp."First Priority"::" " then
            exit(1);
        if CandidateApp."Second Priority" <> CandidateApp."Second Priority"::" " then
            exit(2);
        if CandidateApp."Third Priority" <> CandidateApp."Third Priority"::" " then
            exit(3);
        if CandidateApp."Fourth Priority" <> CandidateApp."Fourth Priority"::" " then
            exit(4);
        if CandidateApp."Fifth Priority" <> CandidateApp."Fifth Priority"::" " then
            exit(5)
        else
            exit(0);
    end;

    local procedure ValidateNextRoundFields(CandidateApp: Record "CMS Candidate Application"; Round: Integer)
    var
        InterviewCommittee: Record "CMS Interview Committee";
    begin
        case Round of
            2:
                begin
                    CandidateApp.TestField("Second Responsible Interviewer");
                    CandidateApp.TestField("Second Interview Committee");
                    CandidateApp.TestField("Second Interview Location");
                    CandidateApp.TestField("Second Best Day to Reach");
                    CandidateApp.TestField("Second Best Time to Reach");
                    InterviewCommittee.Get(CandidateApp."Second Interview Committee");
                    if (InterviewCommittee."Interviewer 1 Code" = '') and
                       (InterviewCommittee."Interviewer 2 Code" = '') and
                       (InterviewCommittee."Interviewer 3 Code" = '') then
                        Error('Interview Committee %1 has no interviewers defined.', InterviewCommittee.Code);
                end;
            3:
                begin
                    CandidateApp.TestField("Third Responsible Interviewer");
                    CandidateApp.TestField("Third Interview Committee");
                    CandidateApp.TestField("Third Interview Location");
                    CandidateApp.TestField("Third Best Day to Reach");
                    CandidateApp.TestField("Third Best Time to Reach");
                    InterviewCommittee.Get(CandidateApp."Third Interview Committee");
                    if (InterviewCommittee."Interviewer 1 Code" = '') and
                    (InterviewCommittee."Interviewer 2 Code" = '') and
                    (InterviewCommittee."Interviewer 3 Code" = '') then
                        Error('Interview Committee %1 has no interviewers defined.', InterviewCommittee.Code);
                end;

        end;
    end;

}
