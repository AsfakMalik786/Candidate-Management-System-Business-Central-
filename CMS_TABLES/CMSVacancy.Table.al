table 53502 "CMS Vacancy"
{
    Caption = 'CSM Vacancy';
    DataClassification = ToBeClassified;
    Permissions = tabledata "CMS Vacancy" = RIMD;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = "No. Series";
        }
        field(14; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Opening Date"; Date)
        {
            Caption = 'Opening Date';
        }
        field(3; "Designation "; Code[20])
        {
            Caption = 'Designation ';
            TableRelation = "CMS Designation";
        }
        field(4; "No. of Vacancy"; Integer)
        {
            Caption = 'No. of Vacancy';
        }
        field(5; "Description "; Text[500])
        {
            Caption = 'Description ';
        }
        field(6; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
            TableRelation = "CMS Department Table";
            trigger OnValidate()
            var
                Dept: Record "CMS Department Table";
                begin
                    if Dept.Get("Department Code") then
                    "Department Code" := Dept."Code";
                end;
        }
        field(7; "Budgeted CTC"; Decimal)
        {
            Caption = 'Budgeted CTC';
        }
        field(8; "Expected Onboard Date"; Date)
        {
            Caption = 'Expected Onboard Date';
        }
        field(9; Status; enum "CMS Vacancy Status")
        {
            Caption = 'Status';
        }
        field(10; "Required Skill"; Text[500])
        {
            Caption = 'Required Skill';
        }
        field(11; "Required Experienced "; Boolean)
        {
            Caption = 'Required Experienced ';
           
        }
        field(12; "Experience (No. of yrs) "; Integer)
        {
            Caption = 'Experience (No. of yrs) ';
            trigger OnValidate()
            begin
                RequiredExperienceBeforeInsert();
            end;
          
        }
        field(13; "Responsible Person "; Code[20])
        {
            Caption = 'Responsible Person ';
            TableRelation = Employee;
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
        CandidateMgtSet: Record "CMS Candidate Mgt Setup";
        Noseriesmgt: Codeunit "No. Series";

    begin
        if "No." = '' then begin
            CandidateMgtSet.Get();
            CandidateMgtSet.TestField("Vacancy Nos.");
            "No." := Noseriesmgt.GetNextNo(CandidateMgtSet."Vacancy Nos.", WorkDate(), true)
        end;
    end;


    procedure AssistEditVac(OldVac: Record "CMS Vacancy"): Boolean
    var
        Vac: Record "CMS Vacancy";
        CanMgtSet: Record "CMS Candidate Mgt Setup";
        Noseriesmgt: Codeunit "No. Series";
    begin
        Vac := Rec;
        CanMgtSet.Get();
        CanMgtSet.TestField("Vacancy Nos.");
        if Noseriesmgt.LookupRelatedNoSeries(CanMgtSet."Vacancy Nos.",OldVac."No. Series",Vac."No. Series") then begin
            Vac."No." := Noseriesmgt.GetNextNo(Vac."No. Series");
            Rec := Vac;
            exit(true);
        end;
    end;
    trigger OnDelete()
    begin
        if Status = Status::Closed then
        ClearAll();
    end;

        local procedure RequiredExperienceBeforeInsert()
    begin
        if not "Required Experienced " then
            Error('Experience must be selected before entering experience-related details.');
    end;

}
  
