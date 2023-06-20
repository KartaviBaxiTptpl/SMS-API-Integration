page 50201 "Send SMS"
{
    ApplicationArea = All;
    Caption = 'Send SMS';
    PageType = Card;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(ContactNo; ContactNo)
                {
                    ApplicationArea = all;
                    Caption = 'Mobile No.';
                }
                field(Message; Message)
                {
                    ApplicationArea = all;
                    Caption = 'Message';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Send Message")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    SMSIntegrationMgmt: Codeunit "SMS Integration Management";
                begin
                    SMSIntegrationMgmt.SendSMS(ContactNo, Message);
                end;
            }
        }
    }
    var
        ContactNo: text;
        Message: Text;
}
