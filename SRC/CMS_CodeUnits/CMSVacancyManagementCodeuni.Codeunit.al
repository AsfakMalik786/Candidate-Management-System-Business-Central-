namespace CMSInternshipProject.CMSInternshipProject;
using Microsoft.Foundation.NoSeries;

codeunit 53100 "CMS Vacancy Management Codeuni"
{
    procedure GenerateVacancy(Designation: Record "CMS Designation")
    var
        Vacancy: Record "CMS Vacancy";
        CandidateMgtSetup: Record "CMS Candidate Mgt Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        Designation.TestField("No. of Vacancy");
        CandidateMgtSetup.Get();
        CandidateMgtSetup.TestField("Vacancy Nos.");

        Vacancy.Init();
        Vacancy."No." := NoSeriesMgt.GetNextNo(CandidateMgtSetup."Vacancy Nos.", WorkDate(), true);
        Vacancy."Designation " := Designation.Code;
        Vacancy."No. of Vacancy" := Designation."No. of Vacancy";
        Vacancy."Opening Date" := WorkDate();
        Vacancy.Status := Vacancy.Status::Open;
        Vacancy.Insert(true);
        Message('Vacancy %1 created for designation %2.', Vacancy."No.", Designation.Code);
    end;

    procedure CloseVacancy(var Vacancy: Record "CMS Vacancy")
    begin
        Vacancy.TestField(Status, Vacancy.Status::Open);
        Vacancy.Status := Vacancy.Status::Closed;
        Vacancy.Modify(true);
        Message('Vacancy %1 closed.', Vacancy."No.");
    end;

    procedure ReopenVacancy(OldVacancyNo: Code[20])
    var
        OldVacancy: Record "CMS Vacancy";
        NewVacancy: Record "CMS Vacancy";
        NoSeriesMgt: Codeunit "No. Series";
        NewVacancyNo: Code[20];
    begin

        if not OldVacancy.Get(OldVacancyNo) then
            Error('Vacancy %1 not found.', OldVacancyNo);


        NewVacancyNo := NoSeriesMgt.GetNextNo(OldVacancy."No. Series", WorkDate(), true);

        NewVacancy.Init();
        NewVacancy.TransferFields(OldVacancy, true);
        NewVacancy."No." := NewVacancyNo;
        NewVacancy.Status := NewVacancy.Status::Open;
        NewVacancy.Insert();

        Message('Vacancy %1 Re-Opened as %2.', OldVacancy."No.", NewVacancy."No.");
    end;

    // procedure GetComitee(CanApp: Record "CMS Candidate Application")
    // Comitee: Record "CMS Interview Committee";
    // begin
    //     if CanApp."First Interview Committee" = '' then begin
    //         CanApp."First Interview Committee" := Comitee."Committee Name";
    //         CanApp."First Res. Interviewer Name" := Comitee."Interviewer 1 Code";
    //         if CanApp."Second Interview Committee" = '' then
    //             CanApp."Second Interview Committee" := Comitee."Committee Name";
    //         CanApp."Second Respo. Interviewer Name" := Comitee."Interviewer 2 Code";
    //     end;

    // end;


}