namespace CMSInternshipProject.CMSInternshipProject;
using Microsoft.Foundation.Attachment;

page 53113 "CMS Training Application Card"
{
    Caption = 'Training Application Card';
    PageType = Document;
    SourceTable = "CMS Training Application";
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
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEditTrain(xRec) then
                            CurrPage.Update();
                    end;
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
                field(Trainer; Rec.Trainer)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trainer field.';
                }
                field("Trainer Name"; Rec."Trainer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trainer Name field.';
                }
                field("Designation of Trainer"; Rec."Designation of Trainer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation of Trainer field.';
                }
                field("Designation of Trainees"; Rec."Designation of Trainees")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation of Trainees field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Code field.';

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