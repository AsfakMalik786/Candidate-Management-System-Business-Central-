namespace CMSInternshipProject.CMSInternshipProject;

page 53102 "CMS Closed Vacancy List"
{
    Caption = 'Closed Vacancy List';
    PageType = List;
    SourceTable = "CMS Vacancy";
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageId = "CMS Closed Vacancy Card";
    SourceTableView = where(Status = const(Closed));
    Editable = false;
    DeleteAllowed = true;

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
                    Style = Unfavorable;
                }
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action("Re-open Vacancy")
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
