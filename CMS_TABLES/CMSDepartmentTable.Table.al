table 53101 "CMS Department Table"
{
    Caption = 'CMS Department Table';
    DataClassification = ToBeClassified;
    Extensible = true;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Department Name"; Text[50])
        {
            Caption = 'Department Name';
        }
    }
    keys
    {
        key(PK; "Code", "Department Name")
        {
            Clustered = true;
        }
    }
}
