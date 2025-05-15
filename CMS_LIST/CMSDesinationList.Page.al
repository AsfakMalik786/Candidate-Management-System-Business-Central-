namespace CMSInternshipProject.CMSInternshipProject;
using Microsoft.Foundation.Attachment;

page 53108 "CMS Desination List"
{
    Caption = 'Designation List';
    PageType = List;
    SourceTable = "CMS Designation";
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of Vacancy"; Rec."No. of Vacancy")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Style = Strong;
                    ToolTip = 'Specifies the value of the No. of Vacancy field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Documents; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Documents';
                SubPageLink = "Table ID" = const(53504), "No." = field("Code");
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

    actions
    {
        area(Processing)
        {
            action(GenerateVacancy)
            {
                Caption = 'Generate Vacancy';
                ApplicationArea = All;
                Image = New;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Generate Vacancy';

                trigger OnAction()
                var
                    VacancyMgt: Codeunit "CMS Vacancy Management Codeuni";
                begin
                    VacancyMgt.GenerateVacancy(Rec);
                end;
            }
        }
    }
}
