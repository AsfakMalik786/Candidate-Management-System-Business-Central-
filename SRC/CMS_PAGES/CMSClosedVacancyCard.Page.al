namespace CMSInternshipProject.CMSInternshipProject;

page 53103 "CMS Closed Vacancy Card"
{
    Caption = 'Closed Vacancy Card';
    PageType = Document;
    SourceTable = "CMS Vacancy";
    UsageCategory = Documents;
    ApplicationArea = All;
    Editable = false;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            group(General)
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
                field(Description; Rec."Description ")
                {
                    ApplicationArea = All;
                    ToolTip = 'The description of the vacancy.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'The department code associated with the vacancy.';
                    Style = StrongAccent;
                }
                field("Budgeted CTC"; Rec."Budgeted CTC")
                {
                    ApplicationArea = All;
                    ToolTip = 'The budgeted cost to company for the vacancy.';
                }
                field("Expected Onboard Date"; Rec."Expected Onboard Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The expected date for onboarding the candidate.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'The status of the vacancy.';
                }
                field("Required Skill"; Rec."Required Skill")
                {
                    ApplicationArea = All;
                    ToolTip = 'The required skills for the vacancy.';
                }
                field("Required Experienced"; Rec."Required Experienced ")
                {
                    ApplicationArea = All;
                    ToolTip = 'The required experience for the vacancy.';
                }
                field("Experience (No. of yrs)"; Rec."Experience (No. of yrs) ")
                {
                    ApplicationArea = All;
                    ToolTip = 'The required years of experience for the vacancy.';
                }
                field("Responsible Person"; Rec."Responsible Person ")
                {
                    ApplicationArea = All;
                    ToolTip = 'The person responsible for the vacancy.';
                }
            }
            part(CandidateApplications; "CMS Candidate Application Subf")
            {
                ApplicationArea = All;
                SubPageLink = "Vacancy No." = field("No.");



            }
        }

    }

    actions
    {
        area(Processing)
        {
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

