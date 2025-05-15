namespace CandidateManagmentsystem.CandidateManagmentsystem;
using CMSInternshipProject.CMSInternshipProject;
using Microsoft.Foundation.Attachment;

page 53501 "CMS Vacancy Card"
{
    Caption = 'Vacancy Card';
    PageType = Card;
    SourceTable = "CMS Vacancy";
    UsageCategory = Documents;
    ApplicationArea = all;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    ApplicationArea = All;
                    Style = StrongAccent;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEditVac(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Opening Date"; Rec."Opening Date")
                {
                    ToolTip = 'Specifies the value of the Opening Date field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Designation "; Rec."Designation ")
                {
                    ToolTip = 'Specifies the value of the Designation field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("No. of Vacancy"; Rec."No. of Vacancy")
                {
                    ToolTip = 'Specifies the value of the No. of Vacancy field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Description "; Rec."Description ")
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ToolTip = 'Specifies the value of the Department Code field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Budgeted CTC"; Rec."Budgeted CTC")
                {
                    ToolTip = 'Specifies the value of the Budgeted CTC field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Expected Onboard Date"; Rec."Expected Onboard Date")
                {
                    ToolTip = 'Specifies the value of the Expected Onboard Date field.', Comment = '%';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                    ApplicationArea = All;
                }
            }
            group("Experience")
            {
                Caption = 'Experience';

                field("Required Skill"; Rec."Required Skill")
                {
                    ToolTip = 'Specifies the value of the Required Skill field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Required Experienced "; Rec."Required Experienced ")
                {
                    ToolTip = 'Specifies the value of the Required Experienced field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Experience (No. of yrs) "; Rec."Experience (No. of yrs) ")
                {
                    ToolTip = 'Specifies the value of the Experience (No. of yrs) field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Responsible Person "; Rec."Responsible Person ")
                {
                    ToolTip = 'Specifies the value of the Responsible Person field.', Comment = '%';
                    ApplicationArea = All;
                }
            }
            part(CandidateApplications; "CMS Candidate Application Subf")
            {
                ApplicationArea = All;
                SubPageLink = "Vacancy No." = field("No.");

            }

        }
        area(FactBoxes)
        {
            part(Documents; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Documents';
                SubPageLink = "Table ID" = const(53502), "No." = field("No.");
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
    actions
    {
        area(Processing)
        {
            action(CloseVacancy)
            {
                Caption = 'Close Vacancy';
                ApplicationArea = All;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Close the selected vacancy.';

                trigger OnAction()
                var
                    VacancyMgt: Codeunit "CMS Vacancy Management Codeuni";
                begin
                    VacancyMgt.CloseVacancy(Rec);
                end;
            }
            action(ReopenVacancy)
            {
                Caption = 'Re-open Vacancy';
                ApplicationArea = All;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Re-open the selected vacancy.';

                trigger OnAction()
                var
                    VacancyMgt: Codeunit "CMS Vacancy Management Codeuni";
                begin
                    VacancyMgt.ReopenVacancy(Rec."No.");
                end;
            }
        }
    }
}
