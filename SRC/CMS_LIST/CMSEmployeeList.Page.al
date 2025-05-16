namespace CMSInternshipProject.CMSInternshipProject;
using Microsoft.Foundation.Attachment;
using Microsoft.HumanResources.Employee;

page 53114 "CMS Employee List"
{
    Caption = 'Employee List';
    PageType = List;
    SourceTable = Employee;
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageId = "CMS Employee Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unique identifier for the employee.';
                    Style = StrongAccent;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'First name of the employee.';
                    Style = StrongAccent;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Last name of the employee.';
                }
                field("Designation"; Rec."Designation")
                {
                    ApplicationArea = All;
                    ToolTip = 'The designation of the employee.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'The department code of the employee.';
                    Style = StrongAccent;
                }
                field("Hire Date"; Rec."Hire Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The hire date of the employee.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Documents; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Documents';
                SubPageLink = "Table ID" = const(53101), "No." = field("No.");
            }
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

