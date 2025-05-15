table 53501 "CMS Candidate Mgt Setup"
{
    Caption = 'CMS Candidate Mgt Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Candidate Application Nos."; Code[20])
        {
            Caption = ' Candidate Application Nos.';
            TableRelation = "No. Series";
        }
        field(3; "Vacancy Nos."; Code[20])
        {
            Caption = 'Vacancy Nos.';
            TableRelation = "No. Series";
        }
        field(4; "Training Application Nos."; Code[20])
        {
            Caption = ' Training Application Nos.';
            TableRelation = "No. Series";
        }
        field(5; "Employee Nos."; Code[20])
        {
            Caption = ' Employee Nos. ';
            TableRelation = "No. Series";

        }
        field(6; "Interview Rounds"; Enum "CMS InterviewRound")
        {
            Caption = 'Interview Rounds';
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
