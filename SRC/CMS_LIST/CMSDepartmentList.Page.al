namespace CMSInternshipProject.CMSInternshipProject;

page 53119 "CMS Department List"
{
    ApplicationArea = All;
    Caption = 'Department List';
    PageType = List;
    SourceTable = "CMS Department Table";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Department)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    ToolTip = 'Code of the department.';
                    Style = StrongAccent;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    Caption = 'Department Name';
                    ToolTip = 'Name of the department.';
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
