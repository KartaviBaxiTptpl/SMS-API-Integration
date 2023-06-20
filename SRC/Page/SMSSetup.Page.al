page 50200 "SMS Setup"
{
    ApplicationArea = All;
    Caption = 'SMS Setup';
    PageType = Card;
    SourceTable = "SMS Setup";
    UsageCategory = Administration;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Send SMS API URL"; Rec."Send SMS API URL")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Send SMS API URL field.';
                }

                field("Account SID"; Rec."Account SID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account SID field.';
                }
                field("Auth Token"; Rec."Auth Token")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Auth Token field.';
                }
                field("Phone No. "; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.RESET;
        IF NOT Rec.GET THEN BEGIN
            Rec.INIT;
            Rec.INSERT;
        END;
    end;
}
