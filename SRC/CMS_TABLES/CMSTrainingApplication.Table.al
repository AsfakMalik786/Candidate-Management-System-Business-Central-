table 53507 "CMS Training Application"
{
    Caption = 'CMS Training Application';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = "No. Series";

        }
        field(10; "No.Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Training Start Date"; Date)
        {
            Caption = 'Training Start Date';
        }
        field(3; "Training End Date"; Date)
        {
            Caption = 'Training End Date';
        }
        field(4; Trainer; Code[20])
        {
            Caption = 'Trainer';
        }
        field(5; "Trainer Name"; Text[100])
        {
            Caption = 'Trainer Name';
        }
        field(6; "Designation of Trainer"; Code[20])
        {
            Caption = 'Designation of Trainer';
        }
        field(7; "Designation of Trainees"; Code[20])
        {
            Caption = 'Designation of Trainees';
        }
        field(8; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = "Open","Close";
        }
        field(9; "Department Code"; Code[20])
        {
            Caption = 'Department Code';


        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        CandidateMgtSetup: Record "CMS Candidate Mgt Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        if "No." = '' then begin
            CandidateMgtSetup.Get();
            CandidateMgtSetup.TestField("Training Application Nos.");
            "No." := NoSeriesMgt.GetNextNo(CandidateMgtSetup."Training Application Nos.", WorkDate(), true);
        end;
    end;

    procedure AssistEditTrain(OldVac: Record "CMS Training Application"): Boolean
    var
        TrainApp: Record "CMS Training Application";
        CanMgtSet: Record "CMS Candidate Mgt Setup";
        Noseriesmgt: Codeunit "No. Series";
    begin
        TrainApp := Rec;
        CanMgtSet.Get();
        CanMgtSet.TestField("Vacancy Nos.");
        if Noseriesmgt.LookupRelatedNoSeries(CanMgtSet."Training Application Nos.", OldVac."No.Series", TrainApp."No.Series") then begin
            TrainApp."No." := Noseriesmgt.GetNextNo(TrainApp."No.Series");
            Rec := TrainApp;
            exit(true);
        end;
    end;


}
