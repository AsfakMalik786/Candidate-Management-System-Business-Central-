table 53504 "CMS Designation"
{
    Caption = 'CMS Designation';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; "No. of Vacancy"; Integer)
        {
            Caption = 'No. of Vacancy';

        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
    trigger OnDelete()
    begin
        ClearAll();
    end;
}
