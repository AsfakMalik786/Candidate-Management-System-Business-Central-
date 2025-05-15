namespace CMSInternshipProject.CMSInternshipProject;

page 53109 "CMS Interview Comitee List"
{
    Caption = 'Interview Committee List';
    PageType = Worksheet;
    SourceTable = "CMS Interview Committee";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                    Style = StrongAccent;
                }
                field("Committee Name"; Rec."Committee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Committee Name field.';
                }
                field("Interviewer 1 Code"; Rec."Interviewer 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interviewer 1 Code field.';
                    Style = Strong;
                }
                field("Interviewer 1"; Rec."Interviewer 1 Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interviewer 1 field.';
                }
                field("Interviewer 2 Code"; Rec."Interviewer 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interviewer 2 Code field.';
                    Style = Strong;

                }
                field("Interviewer 2"; Rec."Interviewer 2 Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interviewer 2 field.';
                }
                field("Interviewer 3 Code"; Rec."Interviewer 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interviewer 3 Code field.';
                    Style = Strong;

                }
                field("Interviewer 3"; Rec."Interviewer 3 Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interviewer 3 field.';
                }


            }
        }
        area(FactBoxes)
        {
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
}

