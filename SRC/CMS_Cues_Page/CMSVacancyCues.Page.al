namespace CMSInternshipProject.CMSInternshipProject;
using CandidateManagmentsystem.CandidateManagmentsystem;

page 53120 "CMS Vacancy Cues"
{
    ApplicationArea = All;
    Caption = 'Vacancy Cues';
    PageType = CardPart;
    SourceTable = "CMS Cue Table";

    layout
    {
        area(Content)
        {
            cuegroup(Vacancies)
            {

                Caption = 'Vacancy';
                field("Open Vacancies"; Rec."Open Vacancies")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "CMS Vacancy List";
                    ToolTip = 'Open Vacancies';
                    Style = Favorable;
                    StyleExpr = true;
                }
                field("Vacancy"; Rec."Closed Vacancy")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "CMS Closed Vacancy List";
                    ToolTip = 'Closed Vacancy';
                    Style = Unfavorable;
                    StyleExpr = true;

                }


            }
            cuegroup("Rejected Application")
            {
                field("Rejected Applications"; Rec."Rejected Applications")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "CMS Candidate Application List";
                    ToolTip = 'Rejected Applications';
                    Style = Ambiguous;
                    StyleExpr = true;
                }

            }
            cuegroup("Employee")
            {


                field(Employees; Rec.Employees)
                {

                    DrillDownPageId = "CMS Employee List";
                    ToolTip = 'Employees';
                    Caption = 'Employees';
                    Style = Favorable;
                    StyleExpr = true;


                }

            }
            cuegroup("Training Applications")
            {
                field("Open Training Applications"; Rec."Open Training Applications")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "CMS Training Application List";
                    Caption = 'Training Application';
                    Style = Ambiguous;
                    StyleExpr = true;
                    ToolTip = 'Training Application';
                }
            }

        }
    }


}
