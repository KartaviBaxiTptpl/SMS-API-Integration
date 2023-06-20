tableextension 50200 CustomerExt extends Customer
{
    fields
    {
        field(50200; "Phone No. Authentication"; Boolean)
        {
            Caption = 'Phone No. Authentication';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        modify("Mobile Phone No.")
        {
            trigger OnBeforeValidate()
            begin
                if (Rec."Mobile Phone No." <> xRec."Mobile Phone No.") and Rec."Phone No. Authentication" then
                    Rec."Phone No. Authentication" := false;
            end;
        }
    }
}
