table 50200 "SMS Setup"
{
    Caption = 'SMS Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(2; "Account SID"; Text[200])
        {
            Caption = 'Account SID';
            DataClassification = ToBeClassified;
        }
        field(3; "Auth Token"; Text[200])
        {
            Caption = 'Auth Token';
            DataClassification = ToBeClassified;
        }
        field(4; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
        }
        field(5; "Send SMS API URL"; Text[200])
        {
            Caption = 'Send SMS API URL';
            DataClassification = ToBeClassified;
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
