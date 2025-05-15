tableextension 53101 "CMS Employee Table" extends Employee
{
    Caption = 'CMS Employee Table';

    fields
    {

        field(50000; "Candidate Application No."; Code[20])
        {
            Caption = 'Candidate Application No.';
            DataClassification = ToBeClassified;
            TableRelation = "CMS Candidate Application"."No.";
        }
        field(50001; "Designation"; Code[20])
        {
            Caption = 'Designation';
            DataClassification = ToBeClassified;
            TableRelation = "CMS Designation";
        }
        field(50002; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
            DataClassification = ToBeClassified;
            TableRelation = "CMS Department Table";
            trigger OnValidate()
            begin

            end;
            // Placeholder: Replace with actual table relation, e.g., Dimension
        }
        field(50003; "Hire Date"; Date)
        {
            Caption = 'Hire Date';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK2; "Candidate Application No.")
        {


        }
    }

    trigger OnInsert()
    var
        CandidateMgtSetup: Record "CMS Candidate Mgt Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        if "No." = '' then begin
            CandidateMgtSetup.Get();
            CandidateMgtSetup.TestField("Employee Nos.");
            "No." := NoSeriesMgt.GetNextNo(CandidateMgtSetup."Employee Nos.", WorkDate(), true);
        end;
    end;

    procedure AssistEditVac(OldEmp: Record Employee): Boolean
    var
        Emp: Record Employee;
        CanMgtSet: Record "CMS Candidate Mgt Setup";
        Noseriesmgt: Codeunit "No. Series";
    begin
        Emp := Rec;
        CanMgtSet.Get();
        CanMgtSet.TestField("Employee Nos.");
        if Noseriesmgt.LookupRelatedNoSeries(CanMgtSet."Employee Nos.", OldEmp."No. Series", Emp."No. Series") then begin
            Emp."No." := Noseriesmgt.GetNextNo(Emp."No. Series");
            Rec := Emp;
            exit(true);
        end;
    end;
}