tableextension 50201 SalesHeaderExt extends "Sales Header"
{
    fields
    {
        modify("Sell-to Customer No.")
        {
            trigger OnBeforeValidate()
            var
                CustomerRec: Record Customer;
                Text001: Label 'Mobile Phone No. verification is mandatory for Customer No. = %1';
            begin
                if CustomerRec.Get("Sell-to Customer No.") and not CustomerRec."Phone No. Authentication" then
                    Error(StrSubstNo(Text001, "Sell-to Customer No."));
            end;
        }
    }
}
