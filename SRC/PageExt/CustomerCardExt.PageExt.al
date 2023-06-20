pageextension 50200 CustomerCardExt extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Phone No. Authentication"; Rec."Phone No. Authentication")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Phone No. Authentication field.';
            }
        }
    }
    actions
    {
        addlast(processing)
        {
            action("Phone No. Verification")
            {
                ApplicationArea = all;

                trigger OnAction()
                var
                    PhoneNoVerificationViaSMS: Page "Phone No. Verification via SMS";
                begin
                    Clear(PhoneNoVerificationViaSMS);
                    PhoneNoVerificationViaSMS.SetRecord(Rec);
                    PhoneNoVerificationViaSMS.Run();
                end;
            }
        }
    }
}
