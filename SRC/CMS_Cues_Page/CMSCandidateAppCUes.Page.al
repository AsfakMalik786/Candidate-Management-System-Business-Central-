namespace CMSInternshipProject.CMSInternshipProject;

page 53118 "CMS Candidate App. CUes"
{
    ApplicationArea = All;
    Caption = 'CMS Candidate App. CUes';
    PageType = CardPart;
    SourceTable = "CMS Cue Table";
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Open Candidate Applications"; Rec."Open Candidate Applications")
                {
                    ToolTip = 'Open Candidate Applications';
                    DrillDownPageId = "CMS Candidate Application List";
                    Caption = 'Open Candidate Applications';
                }
                field("Selected Applications"; Rec."Selected Applications")
                {
                    ToolTip = 'Selected Applications';
                    DrillDownPageId = "CMS Candidate Application List";
                    Caption = 'Selected Applications';
                }
                field("Rejected Applications"; Rec."Rejected Applications")
                {
                    ToolTip = 'Rejected Applications';
                    DrillDownPageId = "CMS Candidate Application List";
                    Caption = 'Rejected Applications';
                }
                field("In Interview Rounds"; Rec."In Interview Rounds")
                {
                    ToolTip = 'In Interview Rounds';
                    DrillDownPageId = "CMS Candidate Application List";
                    Caption = 'In Interview Rounds';
                }
            }
        }
    }

}
