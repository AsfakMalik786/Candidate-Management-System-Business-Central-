namespace CMSInternshipProject.CMSInternshipProject;

page 53110 "CMS Interview Location List"
{
    Caption = 'Interview Location List';
    PageType = Worksheet;
    SourceTable = "CMS Interview Location";
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
                field("Location Name"; Rec."Location Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location Name field.';
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

