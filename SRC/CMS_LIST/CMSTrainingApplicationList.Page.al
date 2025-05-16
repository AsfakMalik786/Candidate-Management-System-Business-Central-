namespace CMSInternshipProject.CMSInternshipProject;
using Microsoft.Foundation.Attachment;

page 53112 "CMS Training Application List"
{
    Caption = 'Training Application List';
    PageType = List;
    SourceTable = "CMS Training Application";
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageId = "CMS Training Application Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                    Style = StrongAccent;
                }
                field("Training Start Date"; Rec."Training Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Training Start Date field.';
                }
                field("Training End Date"; Rec."Training End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Training End Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                    Style = Favorable;
                }
            }
        }
        area(FactBoxes)
        {
            part(Documents; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Documents';
                SubPageLink = "Table ID" = const(53507), "No." = field("No.");
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
