table 53505 "CMS Interview Committee"
{
    Caption = 'CMS Interview Committee';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Committee Name"; Code[20])
        {
            Caption = 'Committee Name';
        }
        field(8; "Interviewer 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                if Emp.Get("Interviewer 1 Code") then
                    "Interviewer 1 Name" := Emp.FullName();
            end;

        }
        field(3; "Interviewer 1 Name"; Text[100])
        {
            Caption = 'Interviewer 1 Name';

        }
        field(9; "Interviewer 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                if Emp.Get("Interviewer 2 Code") then
                    "Interviewer 2 Name" := Emp.FullName();
            end;
        }
        field(4; "Interviewer 2 Name"; Text[100])
        {
            Caption = 'Interviewer 2 Name';
        }

        field(5; "Interviewer 3 Code"; Code[20])
        {
            Caption = 'Interviewer 3 code';
            TableRelation = Employee;
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                if Emp.Get("Interviewer 3 Code") then
                    "Interviewer 3 Name" := Emp.FullName();
            end;
        }
        field(10; "Interviewer 3 Name"; Text[100])
        {
            Caption = 'Interviewer 3 Name';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }



    }
}
