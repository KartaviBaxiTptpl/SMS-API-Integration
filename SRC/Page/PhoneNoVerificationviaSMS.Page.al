page 50202 "Phone No. Verification via SMS"
{
    Caption = 'Phone No. Verification via SMS';
    PageType = Card;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(UserOTPTxt; UserOTPTxt)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        Text001: Label 'Please Enter Correct OTP';
                        Text002: Label 'Mobile Phone No. is verified successfully';
                    begin
                        //Verify if it's a match
                        if UserOTPTxt = GeneratedOTPTxt then begin
                            Rec."Phone No. Authentication" := true;
                            Message(Text002);
                            CurrPage.Close();
                        end
                        else
                            Error(Text001);
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Resend OTP")
            {
                ApplicationArea = all;

            }
        }
    }

    trigger OnOpenPage()
    var
        Text001: Label 'Mobile Phone No. for Customer No. = %1 is already verified.';
        SMSIntegrationMgmt: Codeunit "SMS Integration Management";
        SMSBodyTxt: Label 'Verification Code for Business Central Customer Registration is: ';
    begin
        if Rec."Phone No. Authentication" then
            Error(StrSubstNo(Text001, Rec."No."));
        GeneratedOTPTxt := GenerateOTP();
        SMSIntegrationMgmt.SendSMS(Rec."Mobile Phone No.", SMSBodyTxt + GeneratedOTPTxt);
    end;

    //Generate Random OTP 
    local procedure GenerateOTP(): text[6]
    var
        OTPInTxt: Text[6];
    begin
        OTPInTxt := Format(Random(999999));
        if StrLen(OTPInTxt) < 6 then begin
            exit(PadStr(OTPInTxt, 6, '0'));
        end
        else
            exit(OTPInTxt);
    end;

    var
        UserOTPTxt: Text[6];
        GeneratedOTPTxt: Text[6];
}
