table 53506 "CMS Interview Location"
{
    Caption = 'CMS Interview Location';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Location Name"; Text[20])
        {
            Caption = 'Location Name';
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
