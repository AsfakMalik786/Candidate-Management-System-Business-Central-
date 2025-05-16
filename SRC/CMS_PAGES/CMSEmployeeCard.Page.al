namespace CMSInternshipProject.CMSInternshipProject;
using Microsoft.Foundation.Attachment;
using Microsoft.HumanResources.Employee;

page 53115 "CMS Employee Card"
{
    Caption = 'Employee Card';
    PageType = Card;
    SourceTable = Employee;
    UsageCategory = Documents;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                    Style = StrongAccent;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'First name of the employee.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Middle name of the employee.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Last name of the employee.';
                }
                field("Candidate Application No."; Rec."Candidate Application No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'The candidate application number for which the employee is hired.';
                    Style = StrongAccent;
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
                    TableRelation = "CMS Vacancy";
                    Style = StrongAccent;
                }
                field("Hire Date"; Rec."Hire Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The hire date of the employee.';
                }
                field("E-mail"; Rec."E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'The email address of the employee.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'The phone number of the employee.';
                    Style = Strong;
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