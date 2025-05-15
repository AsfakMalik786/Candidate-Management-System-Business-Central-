namespace CMSInternshipProject.CMSInternshipProject;

page 53106 "CMS Candidate Application Subf"
{
    Caption = 'Candidate Applications';
    PageType = ListPart;
    SourceTable = "CMS Candidate Application";
    ApplicationArea = All;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unique identifier for the candidate application.';
                    Style = StrongAccent;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'First name of the candidate.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Last name of the candidate.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'The status of the candidate application.';
                    Style = Favorable;
                }
            }
        }
    }
}