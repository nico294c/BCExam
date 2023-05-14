codeunit 50141 Wordpress
{
    procedure CreateCustomerWs(JsonCustomer: JsonObject) response: Text

    var
        CustomerRec: Record Customer;

    begin


        CustomerRec.Init();
        CustomerRec."No." := 'Woo' + getFieldTextAsText(JsonCustomer, 'id');
        CustomerRec.Name := getFieldTextAsText(JsonCustomer, 'name');
        CustomerRec."E-Mail" := getFieldTextAsText(JsonCustomer, 'email');

        if CustomerRec.Insert() then begin
            response := 'Customer inserted'
        end else begin
            response := 'Failed insertion'
        end;
    end;

    local procedure getFieldTextAsText(JObject: JsonObject; fieldName: Text): Text
    var
        returnVal: Text;
        JToken: JsonToken;
    begin
        if JObject.Get(fieldName, JToken) then
            returnVal := JToken.AsValue().AsText();

        exit(returnVal);
    end;

    local procedure GetBodyAsJsonObject(Response: HttpResponseMessage) JsonBody: JsonObject
    var
        Body: Text;
    begin
        Response.Content.ReadAs(Body);
        JsonBody.ReadFrom(Body);
    end;
}
