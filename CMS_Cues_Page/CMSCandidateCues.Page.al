namespace CMSInternshipProject.CMSInternshipProject;

page 53117 "CMS Candidate Cues"
{
    ApplicationArea = All;
    Caption = 'Candidate Cues';
    PageType = CardPart;
    SourceTable = "CMS Cue Table";


    layout
    {
        area(Content)
        {
            cuegroup(Candidates)
            {
                Caption = 'Candidates';
                field("Open Candidate Applications"; Rec."Open Candidate Applications")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "CMS Candidate Application List";
                    ToolTip = 'Open Candidate Applications';
                    StyleExpr = true;
                    Image = Checklist;
                }

                field("In Interview Rounds"; Rec."In Interview Rounds")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "CMS Candidate Application List";
                    ToolTip = 'In Interview Rounds';
                    Style = Ambiguous;
                    Image = People;
                }
                field("Selected Applications"; Rec."Selected Applications")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "CMS Candidate Application List";
                    ToolTip = 'Selected Applications';
                    Image = Star;
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
                    Image = Info;
                }

            }
            cuegroup("Employee")
            {
                CuegroupLayout = Wide;
                field(Employees; Rec.Employees)
                {

                    DrillDownPageId = "CMS Employee List";
                    ToolTip = 'Employees';
                    Caption = 'Employees';
                    Style = Favorable;
                    Importance = Promoted;

                }

            }
        }
    }


}