namespace CandidateManagmentsystem.CandidateManagmentsystem;
using CMSInternshipProject.CMSInternshipProject;
using Microsoft.Foundation.Attachment;

page 53500 "CMS Vacancy List"
{
    ApplicationArea = All;
    Caption = 'Vacancy List';
    PageType = List;
    AdditionalSearchTerms = 'Vac';
    SourceTable = "CMS Vacancy";
    SourceTableView = where(Status = const(Open));
    UsageCategory = Lists;
    CardPageId = "CMS Vacancy Card";
    AccessByPermission = page "CMS Vacancy List" = X;


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unique identifier for the vacancy.';
                    Style = StrongAccent;
                }
                field("Opening Date"; Rec."Opening Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The date when the vacancy was opened.';
                }
                field(Designation; Rec."Designation ")
                {
                    ApplicationArea = All;
                    ToolTip = 'The designation of the vacancy.';
                }
                field("No. of Vacancy"; Rec."No. of Vacancy")
                {
                    ApplicationArea = All;
                    ToolTip = 'The number of vacancies available.';
                    Style = Strong;

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'The status of the vacancy.';
                    Style = Favorable;

                }
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
                ToolTip = 'Close Vacancy';

                trigger OnAction()
                var
                    VacancyMgt: Codeunit "CMS Vacancy Management Codeuni";
                begin
                    VacancyMgt.CloseVacancy(Rec);
                end;
            }
        }
    }

}