namespace CMSInternshipProject.CMSInternshipProject;
using Microsoft.Foundation.Attachment;

page 53104 "CMS Candidate Application List"
{
    Caption = 'Candidate Application List';
    PageType = List;
    SourceTable = "CMS Candidate Application";
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageId = "CMS Candidate Application Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                ShowAsTree = true;
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

                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies The Gender Field';
                }
                field("Vacancy No."; Rec."Vacancy No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'The vacancy number for which the candidate has applied.';
                    Style = Strong;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'The status of the candidate application.';
                }
            }
        }
        area(FactBoxes)
        {
            part("Candidate Document"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Documents';
                SubPageLink = "Table ID" = const(53503), "No." = field("No.");
                SubPageView = where("Table ID" = const(53503));

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

            action(ScheduleInterview)
            {
                Caption = 'Schedule Interview';
                ApplicationArea = All;
                Image = Calendar;
                ToolTip = 'Schedule an interview for the selected candidate.';

                trigger OnAction()
                var
                    CandidateMgt: Codeunit "CMS Candidate Management Codeu";
                begin
                    CandidateMgt.ScheduleInterview(Rec);
                end;
            }
            action(NextRound)
            {
                Caption = 'Next Round';
                ApplicationArea = All;
                Image = NextRecord;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Move the candidate to the next round of the selection process.';

                trigger OnAction()
                var
                    CandidateMgt: Codeunit "CMS Candidate Management Codeu";
                begin
                    CandidateMgt.MoveToNextRound(Rec);
                end;
            }
            action(Confirm)
            {
                Caption = 'Confirm';
                ApplicationArea = All;
                Image = Confirm;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Confirm the candidate for the selected vacancy.';

                trigger OnAction()
                var
                    CandidateMgt: Codeunit "CMS Candidate Management Codeu";
                begin
                    CandidateMgt.ConfirmCandidate(Rec);
                end;
            }
            action(Reject)
            {
                Caption = 'Reject';
                ApplicationArea = All;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Reject the candidate for the selected vacancy.';

                trigger OnAction()
                var
                    CandidateMgt: Codeunit "CMS Candidate Management Codeu";
                begin
                    CandidateMgt.RejectCandidate(Rec);
                end;
            }
        }
    }
}
