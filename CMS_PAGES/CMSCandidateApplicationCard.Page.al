namespace CMSInternshipProject.CMSInternshipProject;
using Microsoft.Foundation.Attachment;
using CandidateManagmentsystem.CandidateManagmentsystem;
using Microsoft.Foundation.Address;

page 53105 "CMS Candidate Application Card"
{
    Caption = 'Candidate Application Card';
    PageType = Card;
    SourceTable = "CMS Candidate Application";
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
                    ShowMandatory = true;
                    Style = StrongAccent;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEditCanApp(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Name field.';
                    ShowMandatory = true;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                    ShowMandatory = true;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Name field.';
                    ShowMandatory = true;
                }
                field("Vacancy No."; Rec."Vacancy No.")
                {
                    ApplicationArea = All;
                    TableRelation = "CMS Vacancy"."No.";
                    ToolTip = 'Specifies the value of the Vacancy No. field.';
                    ShowMandatory = true;
                    Style = StrongAccent;

                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value Of Gender field.';
                    ShowMandatory = true;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Birth field.';
                }
                field("Marital Status"; Rec."Marital Status ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                    ShowMandatory = true;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                    ShowMandatory = true;

                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contact No. field.';
                    ExtendedDatatype = PhoneNo;
                    ShowMandatory = true;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.';
                    ShowMandatory = true;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                    ShowMandatory = true;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the City field.';
                    ShowMandatory = true;
                }
                field(State; Rec.State)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the State field.';
                    ShowMandatory = true;

                }
                field("Country/Region Code"; Rec."Country/Region Code ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                    TableRelation = "Country/Region";
                }
                field("E-mail"; Rec."E-mail ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the E-mail field.';
                    ExtendedDatatype = EMail;
                    ShowMandatory = true;
                    Style = AttentionAccent;
                }
            }
            group(Experience)
            {
                field(Experienced; Rec."Experienced ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Experienced field.';
                }
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Company Name field.';
                    Style = AttentionAccent;
                }
                field("Company Experience"; Rec."Company Experience")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Company Experience field.';
                }
                field("Current Designation"; Rec."Current Designation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Designation field.';
                }
                field("Company Address"; Rec."Company Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Company Address field.';
                }
                field("Applied Designation"; Rec."Applied Designation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Applied Designation field.';
                    TableRelation = "CMS Designation";
                    ShowMandatory = true;
                    Style = Favorable;
                }
                field("Total Experience in years"; Rec."Total Experience in years")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Experience in years field.';
                }
                field("Current CTC"; Rec."Current CTC")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current CTC field.';
                }
                field("Expected CTC"; Rec."Expected CTC ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expected CTC field.';
                    ShowMandatory = true;
                }
                field("Notice Period in Days"; Rec."Notice Period in Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Notice Period in Days field.';
                }
                field("Manager No."; Rec."Manager No. ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Manager No. field.';
                }
            }
            group("First Interview")
            {
                Caption = 'First Interview';


                field("First Interview Round"; Rec."First Interview Round")
                {
                    ApplicationArea = All;
                    Caption = 'First Interview Round';
                    ToolTip = 'First Interview Round field.';

                }
                field("First Best Day to Reach"; Rec."First Best Day to Reach")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Best Day to Reach field.';
                    ShowMandatory = true;
                }
                field("First Best Time to Reach"; Rec."First Best Time to Reach")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Best Time to Reach field.';
                    ShowMandatory = true;
                    Style = Strong;
                }
                field("First Interview Committee"; Rec."First Interview Committee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Interview Committee field.';
                    ShowMandatory = true;
                    Style = StrongAccent;
                }
                field("First Interview Committee Desc"; Rec."First Interview Committee Desc")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Interview Committee Desc field.';

                }
                field("First Interview Location"; Rec."First Interview Location")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Interview Location field.';
                }
                field("First Responsible Interviewer"; Rec."First Responsible Interviewer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Responsible Interviewer field.';
                    Style = StrongAccent;
                }
                field("First Res. Interviewer Name"; Rec."First Res. Interviewer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Res. Interviewer Name field.';
                }
                field("First Remarks"; Rec."First Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Remarks field.';
                    ShowMandatory = true;
                    Style = Strong;
                }
                field("First Priority"; Rec."First Priority")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Priority field.';
                }
            }
            group("Second Interview")
            {
                Visible = IsRound2Visible;

                field("Second Interview Round"; Rec."Second Interview Round")
                {
                    ApplicationArea = All;
                    Caption = 'Second Interview';
                    ToolTip = 'Second Interview Round field.';
                }
                field("Second Best Day to Reach"; Rec."Second Best Day to Reach")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Second Best Day to Reach field.';
                    ShowMandatory = true;
                }
                field("Second Best Time to Reach"; Rec."Second Best Time to Reach")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Second Best Time to Reach field.';
                    ShowMandatory = true;
                    Style = Strong;
                }
                field("Second Interview Committee"; Rec."Second Interview Committee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Second Interview Committee field.';
                    ShowMandatory = true;
                    Style = StrongAccent;
                }
                field("Second Interview Committee Des"; Rec."Second Interview Committee Des")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Second Interview Committee Des field.';
                }
                field("Second Interview Location"; Rec."Second Interview Location")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Second Interview Location field.';
                    ShowMandatory = true;
                }

                field("Second Responsible Interviewer"; Rec."Second Responsible Interviewer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Second Responsible Interviewer field.';
                    Style = StrongAccent;
                }
                field("Second Respo. Interviewer Name"; Rec."Second Respo. Interviewer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Second Respo. Interviewer Name field.';
                }
                field("Second Priority"; Rec."Second Priority")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Second Priority field.';
                }
                field("Second Remarks "; Rec."Second Remarks ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Second Remarks field.';
                    ShowMandatory = true;
                    Style = Strong;
                }

            }
            group("Third Interview")
            {
                Visible = IsRound3Visible;


                field("Third Interview Round"; Rec."Third Interview Round")
                {
                    ApplicationArea = All;
                    Visible = IsRound3Visible;
                    ToolTip = 'Specifies the value of the Third Interview Round field.';


                }
                field("Third Best Day to Reach"; Rec."Third Best Day to Reach")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Third Best Day to Reach field.';
                    ShowMandatory = true;
                }
                field("Third Best Time to Reach"; Rec."Third Best Time to Reach")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Third Best Time to Reach field.';
                    ShowMandatory = true;
                    Style = Strong;
                }
                field("Third Interview Committee"; Rec."Third Interview Committee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Third Interview Committee field.';
                    ShowMandatory = true;
                    Style = StrongAccent;
                }
                field("Third Interview Committee Desc"; Rec."Third Interview Committee Desc")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Third Interview Committee Desc field.';
                }
                field("Third Interview Location"; Rec."Third Interview Location")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Third Interview Location field.';
                    ShowMandatory = true;
                }
                field("Third Responsible Interviewer"; Rec."Third Responsible Interviewer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Third Responsible Interviewer field.';
                    Style = StrongAccent;
                }

                field("Third Respo Interviewer Name"; Rec."Third Respo Interviewer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Third Respo Interviewer Name field.';
                }

                field("Third Priority"; Rec."Third Priority")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Third Priority field.';
                }
                field("Third Remarks "; Rec."Third Remarks ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Third Remarks field.';
                    ShowMandatory = true;
                    Style = Strong;
                }
            }
            group("Fourth Interview")
            {
                Visible = IsRound4Visible;
                field("Fourth Interview Round"; Rec."Fourth Interview Round")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fourth Interview Round field.';
                    Caption = 'Fourth Interview Round';
                }
                field("Fourth Best Day to Reach"; Rec."Fourth Best Day to Reach")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the First Best Day to Reach field.';
                }
                field("Fourth Best Time to Reach"; Rec."Fourth Best Time to Reach")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Style = Strong;
                    ToolTip = 'Specifies the value of the First Best Time to Reach field.';
                }
                field("Fourth Interview Committee"; Rec."Fourth Interview Committee")
                {
                    ApplicationArea = All;
                    Style = StrongAccent;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the First Interview Committee field.';
                }
                field("Fourth Interview Committe Desc"; Rec."Fourth Interview Committe Desc")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Interview Committee Desc field.';
                }
                field("Fourth Interview Location"; Rec."Fourth Interview Location")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the First Interview Location field.';
                }
                field("Fourth Responsible Interviewer"; Rec."Fourth Responsible Interviewer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Responsible Interviewer field.';
                    Style = StrongAccent;
                }
                field("Fourth Res. Interviewer Name"; Rec."Fourth Res. Interviewer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Res. Interviewer Name field.';
                }
                field("Fourth Priority"; Rec."Fourth Priority")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Priority field.';
                }
                field("Fourth Remarks"; Rec."Fourth Remarks")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Style = Strong;
                    ToolTip = 'Specifies the value of the First Remarks field.';
                }

            }
            group("Fifth Interview")
            {
                Visible = IsRound5Visible;
                field("Fifth Interview Round"; Rec."Fifth Interview Round")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fifth Interview Round field.';
                    Caption = 'Fifth Interview Round';
                }
                field("Fifth Best Day to Reach"; Rec."Fifth Best Day to Reach")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the First Best Day to Reach field.';
                }
                field("Fifth Best Time to Reach"; Rec."Fifth Best Time to Reach")
                {
                    ApplicationArea = All;
                    Style = Strong;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the First Best Time to Reach field.';
                }
                field("Fifth Interview Committee"; Rec."Fifth Interview Committee")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Style = StrongAccent;
                    ToolTip = 'Specifies the value of the First Interview Committee field.';
                }
                field("Fifth Interview Committe Desc"; Rec."Fifth Interview Committe Desc")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Interview Committee Desc field.';
                }
                field("Fifth Interview Location"; Rec."Fifth Interview Location")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the First Interview Location field.';
                }

                field("Fifth Responsible Interviewer"; Rec."Fifth Responsible Interviewer")
                {
                    ApplicationArea = All;
                    Style = StrongAccent;
                    ToolTip = 'Specifies the value of the First Responsible Interviewer field.';
                }
                field("Fifth Res. Interviewer Name"; Rec."Fifth Res. Interviewer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Res. Interviewer Name field.';
                }
                field("Fifth Priority"; Rec."Fifth Priority")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Priority field.';
                }
                field("Fifth Remarks"; Rec."Fifth Remarks")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Style = Strong;
                    ToolTip = 'Specifies the value of the First Remarks field.';
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
            action("Schedule Interview")
            {
                Caption = 'Schedule Interview';
                ToolTip = 'Schedule Interview';
                ApplicationArea = All;
                Image = Calendar;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    CandidateMgt: Codeunit "CMS Candidate Management Codeu";
                begin
                    CandidateMgt.ScheduleInterview(Rec);
                end;
            }
            action("Next Round")
            {
                Caption = 'Next Round';
                ToolTip = 'Next Round';
                ApplicationArea = All;
                Image = NextRecord;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    CandidateMgt: Codeunit "CMS Candidate Management Codeu";
                begin
                    CandidateMgt.MoveToNextRound(Rec);
                end;
            }
            action("Confirm")
            {
                Caption = 'Confirm';
                ToolTip = 'Confirm';
                ApplicationArea = All;
                Image = Confirm;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    CandidateMgt: Codeunit "CMS Candidate Management Codeu";
                begin
                    CandidateMgt.ConfirmCandidate(Rec);
                end;
            }
            action("Reject")
            {
                Caption = 'Reject';
                ToolTip = 'Reject';
                ApplicationArea = All;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    CandidateMgt: Codeunit "CMS Candidate Management Codeu";
                begin
                    CandidateMgt.RejectCandidate(Rec);
                end;
            }
        }
    }


    var
        IsRound2Visible: Boolean;
        IsRound3Visible: Boolean;
        IsRound4Visible: Boolean;
        IsRound5Visible: Boolean;


    trigger OnAfterGetRecord()
    var
        CandidateSetup: Record "CMS Candidate Mgt Setup";

    begin
        if CandidateSetup.Get() then
            case CandidateSetup."Interview Rounds".AsInteger() of
                1:
                    begin
                        IsRound2Visible := false;
                        IsRound3Visible := false;
                    end;
                2:
                    begin
                        IsRound2Visible := true;
                        IsRound3Visible := false;
                    end;
                3:
                    begin
                        IsRound2Visible := true;
                        IsRound3Visible := true;
                    end;
                4:
                    begin
                        IsRound2Visible := true;
                        IsRound3Visible := true;
                        IsRound4Visible := true;
                        IsRound5Visible := false;
                    end;
                5:
                    begin
                        IsRound2Visible := true;
                        IsRound3Visible := true;
                        IsRound4Visible := true;
                        IsRound5Visible := true;
                    end;
            end
        else begin

            IsRound2Visible := false;

            IsRound3Visible := false;
            IsRound4Visible := false;
            IsRound5Visible := false;

        end;

    end;


}



