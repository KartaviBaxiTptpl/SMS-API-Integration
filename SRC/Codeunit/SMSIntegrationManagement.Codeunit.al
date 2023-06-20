codeunit 50200 "SMS Integration Management"
{
    procedure SendSMS(ToContactNo: Text[30]; MessageTxt: Text)
    var
        TypeHelper: Codeunit "Type Helper";
        JSONManagement: Codeunit "JSON Management";
        ContentHeaders: HttpHeaders;
        Client: HttpClient;
        RequestContent: HttpContent;
        ResponseMessage: HttpResponseMessage;
        FromContactNo: Text[30];
        URL: Text[200];
        JsonText: Text;
        RequestContentTxt: Text;
        Text001: Label 'Message Sent Successfully';
        Text002: Label 'Error: ';
    begin
        SMSSetup.Get();
        FromContactNo := SMSSetup."Phone No.";
        URL := SMSSetup."Send SMS API URL";

        //Convert Request Data to Url Encoded format
        RequestContentTxt := 'Body=' + TypeHelper.UrlEncode(MessageTxt) + '&To=' + TypeHelper.UrlEncode(ToContactNo) + '&From=' + TypeHelper.UrlEncode(FromContactNo);
        RequestContent.WriteFrom(RequestContentTxt);

        //URL Encoded Content-Type
        RequestContent.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/x-www-form-urlencoded');
        //HTTP Basic Authentication
        Client.DefaultRequestHeaders.Add('Authorization', 'Basic ' + GetAuthCredentials());

        //Post Method
        Client.Post(URL, RequestContent, ResponseMessage);
        ResponseMessage.Content.ReadAs(JsonText);
        JSONManagement.InitializeObject(JsonText);
        if JSONManagement.GetValue('status') = 'queued' then
            Message(Text001)
        else
            Message(Text002 + JSONManagement.GetValue('message'));
    end;

    procedure GetAuthCredentials(): Text
    var
        AuthToken: Text;
        Base64: Codeunit "Base64 Convert";
    begin
        //Convert to HTTP Basic Authentication Format
        AuthToken := SMSSetup."Account SID" + ':' + SMSSetup."Auth Token";
        exit(Base64.ToBase64(AuthToken));
    end;

    var
        SMSSetup: Record "SMS Setup";
}
