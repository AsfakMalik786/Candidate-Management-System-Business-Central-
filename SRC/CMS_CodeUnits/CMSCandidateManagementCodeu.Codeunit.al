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

    local procedure IsEmptyCommittee(Committee: Record "CMS Interview Committee"): Boolean
    begin
        exit(
            (Committee."Interviewer 1 Code" = '') and
            (Committee."Interviewer 2 Code" = '') and
            (Committee."Interviewer 3 Code" = '')
        );
    end;


    procedure MoveToNextRound(var CandidateApp: Record "CMS Candidate Application")
    var
        CandidateMgtSetup: Record "CMS Candidate Mgt Setup";
        InterviewCommittee: Record "CMS Interview Committee";
        CurrentRound: Integer;
        TotalRounds: Integer;
        RoundClearedMessage: Text;
        Choice: Integer;
        OptionTxt: Label 'Confirm,Reject';
        Message_Lbl: Label 'Round %1 is cleared for candidate %2. Preparing for next round...';
    begin
        CandidateApp.TestField(Status, CandidateApp.Status::"Interview Rounds");

        CandidateMgtSetup.Get();
        TotalRounds := CandidateMgtSetup."Interview Rounds".AsInteger();

        if not CandidateApp."First Interview Round" then
            CurrentRound := 1
        else
            if not CandidateApp."Second Interview Round" then
                CurrentRound := 2
            else
                if not CandidateApp."Third Interview Round" then
                    CurrentRound := 3
                else
                    if not CandidateApp."Fourth Interview Round" then
                        CurrentRound := 4
                    else
                        if not CandidateApp."Fifth Interview Round" then
                            CurrentRound := 5
                        else
                            CurrentRound := 0;




        case CurrentRound of
            1:
                begin
                    CandidateApp.TestField("First Responsible Interviewer");
                    CandidateApp.TestField("First Interview Committee");
                    CandidateApp.TestField("First Interview Location");
                    CandidateApp.TestField("First Best Day to Reach");
                    CandidateApp.TestField("First Best Time to Reach");
                    CandidateApp.TestField("First Priority");
                    CandidateApp.TestField("First Remarks");

                    InterviewCommittee.Get(CandidateApp."First Interview Committee");
                    if IsEmptyCommittee(InterviewCommittee) then
                        Error('Interview Committee %1 has no interviewers defined.', InterviewCommittee.Code);

                    CandidateApp."First Interview Round" := true;
                end;
            2:
                begin
                    CandidateApp.TestField("Second Responsible Interviewer");
                    CandidateApp.TestField("Second Interview Committee");
                    CandidateApp.TestField("Second Interview Location");
                    CandidateApp.TestField("Second Best Day to Reach");
                    CandidateApp.TestField("Second Best Time to Reach");
                    CandidateApp.TestField("Second Priority");
                    CandidateApp.TestField("Second Remarks ");

                    InterviewCommittee.Get(CandidateApp."Second Interview Committee");
                    if IsEmptyCommittee(InterviewCommittee) then
                        Error('Interview Committee %1 has no interviewers defined.', InterviewCommittee.Code);

                    CandidateApp."Second Interview Round" := true;
                end;
            3:
                begin
                    CandidateApp.TestField("Third Responsible Interviewer");
                    CandidateApp.TestField("Third Interview Committee");
                    CandidateApp.TestField("Third Interview Location");
                    CandidateApp.TestField("Third Best Day to Reach");
                    CandidateApp.TestField("Third Best Time to Reach");
                    CandidateApp.TestField("Third Priority");
                    CandidateApp.TestField("Third Remarks ");

                    InterviewCommittee.Get(CandidateApp."Third Interview Committee");
                    if IsEmptyCommittee(InterviewCommittee) then
                        Error('Interview Committee %1 has no interviewers defined.', InterviewCommittee.Code);

                    CandidateApp."Third Interview Round" := true;
                end;
            4:
                begin
                    CandidateApp.TestField("Fourth Responsible Interviewer");
                    CandidateApp.TestField("Fourth Interview Committee");
                    CandidateApp.TestField("Fourth Interview Location");
                    CandidateApp.TestField("Fourth Best Day to Reach");
                    CandidateApp.TestField("Fourth Best Time to Reach");
                    CandidateApp.TestField("Fourth Priority");
                    CandidateApp.TestField("Fourth Remarks");

                    InterviewCommittee.Get(CandidateApp."Fourth Interview Committee");
                    if IsEmptyCommittee(InterviewCommittee) then
                        Error('Interview Committee %1 has no interviewers defined.', InterviewCommittee.Code);

                    CandidateApp."Fourth Interview Round" := true;
                end;
            5:
                begin
                    CandidateApp.TestField("Fifth Responsible Interviewer");
                    CandidateApp.TestField("Fifth Interview Committee");
                    CandidateApp.TestField("Fifth Interview Location");
                    CandidateApp.TestField("Fifth Best Day to Reach");
                    CandidateApp.TestField("Fifth Best Time to Reach");
                    CandidateApp.TestField("Fifth Priority");
                    CandidateApp.TestField("Fifth Remarks");

                    InterviewCommittee.Get(CandidateApp."Fifth Interview Committee");
                    if IsEmptyCommittee(InterviewCommittee) then
                        Error('Interview Committee %1 has no interviewers defined.', InterviewCommittee.Code);

                    CandidateApp."Fifth Interview Round" := true;
                end;
        end;
        CandidateApp.Modify(true);
        RoundClearedMessage := StrSubstNo(Message_Lbl, CurrentRound, CandidateApp."No.");
        Message(RoundClearedMessage);
        if (CurrentRound = 0) or (CurrentRound >= TotalRounds) then begin
            Choice := Dialog.StrMenu(OptionTxt, 1, 'All interview rounds completed. What would you like to do?');

            case Choice of
                1:
                    ConfirmCandidate(CandidateApp);
                2:
                    RejectCandidate(CandidateApp);
            end;

            exit;
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


        if Employee.Get(CandidateApp."No.") then
            Error('An employee record already exists for candidate application %1.', CandidateApp."No.")
        else begin

            CandidateMgtSetup.Get();
            CandidateMgtSetup.TestField("Employee Nos.");

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

        if CandidateApp.Status = CandidateApp.Status::Selected then
            Error('Cannot reject a confirmed candidate application %1.', CandidateApp."No.");
        if CandidateApp.Status = CandidateApp.Status::Open then
            Error('Cannot reject an open candidate application %1.', CandidateApp."No.");

        CandidateApp.Status := CandidateApp.Status::Rejected;
        CandidateApp.Modify(true);
        Message('Candidate application %1 rejected.', CandidateApp."No.");
    end;

}
