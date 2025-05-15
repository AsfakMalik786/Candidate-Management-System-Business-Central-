namespace CMSInternshipProject.CMSInternshipProject;
using Microsoft.Foundation.Attachment;

page 53101 "CMS Candidate Management Setup"

{
    Caption = 'Candidate Management Setup';
    PageType = Card;
    SourceTable = "CMS Candidate Mgt Setup";
    UsageCategory = Administration;
    ApplicationArea = All;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = All;
                    ToolTip = 'Primary Key';
                }
                field("Candidate Application Nos."; Rec."Candidate Application Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Candidate Application Nos.';
                }
                field("Vacancy Nos."; Rec."Vacancy Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Vacancy Nos.';
                }
                field("Training Application Nos."; Rec."Training Application Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Training Application Nos.';
                }
                field("Employee Nos."; Rec."Employee Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Employee Nos.';
                }
                field("Interview Rounds"; Rec."Interview Rounds")
                {
                    ApplicationArea = All;
                    ToolTip = 'Interview Rounds';
                    Style = Strong;
                }
            }
        }
        area(FactBoxes)
        {
            part(Documents; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Documents';
                SubPageLink = "Table ID" = const(53501), "No." = field("Primary Key");
            }
            systempart(Links; Links)
            {
                ApplicationArea = All;
                Caption = 'Links';

            }
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
                Caption = 'Notes';
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
