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
                    Image = Checklist;
                    Style = AttentionAccent;
                }
                field("Vacancy"; Rec."Closed Vacancy")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "CMS Closed Vacancy List";
                    ToolTip = 'Closed Vacancy';
                    Image = People;
                    Style = Unfavorable;

                }


            }
        }
    }


}
