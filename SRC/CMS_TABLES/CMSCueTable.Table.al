table 53102 "CMS Cue Table"
{
    Caption = 'Cue Table';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(2; "Open Vacancies"; Integer)
        {
            Caption = 'Open Vacancies';
            FieldClass = FlowField;
            CalcFormula = count("CMS Vacancy" where(Status = const(Open)));
        }
        field(3; "Open Candidate Applications"; Integer)
        {
            Caption = 'Open Candidate Applications';
            FieldClass = FlowField;
            CalcFormula = count("CMS Candidate Application" where(Status = const(Open)));
        }
        field(4; "In Interview Rounds"; Integer)
        {
            Caption = 'In Interview Rounds';
            FieldClass = FlowField;
            CalcFormula = count("CMS Candidate Application" where(Status = const("Interview Rounds")));
        }
        field(5; "Selected Applications"; Integer)
        {
            Caption = 'Selected Applications';
            FieldClass = FlowField;
            CalcFormula = count("CMS Candidate Application" where(Status = const(Selected)));
        }
        field(6; "Rejected Applications"; Integer)
        {
            Caption = 'Rejected Applications';
            FieldClass = FlowField;
            CalcFormula = count("CMS Candidate Application" where(Status = const(Rejected)));
        }
        field(7; "Employees"; Integer)
        {
            Caption = 'Employees';
            FieldClass = FlowField;
            CalcFormula = count(Employee);

        }
        field(8; "Open Training Applications"; Integer)
        {
            Caption = 'Open Training Applications';
            FieldClass = FlowField;
            CalcFormula = count("CMS Training Application" where(Status = const(Open)));
        }
        field(9; "Closed Vacancy"; Integer)
        {
            Caption = 'Closed Vacancy';
            FieldClass = FlowField;
            CalcFormula = count("CMS Vacancy" where(Status = const(Closed)));
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}