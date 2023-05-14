pageextension 50140 ItemCardExt extends "Item Card"
{
    actions
    {
        addfirst(Functions)
        {
            action("Export to WooCommerce")
            {
                trigger OnAction()
                var
                    WooService: Codeunit WooService;
                begin
                    WooService.InsertItem(Rec);
                end;
            }
        }
    }
}
