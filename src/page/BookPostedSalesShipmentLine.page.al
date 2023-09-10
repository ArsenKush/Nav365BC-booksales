page 50108 BookPostedSalesShipmentLine
{
    ApplicationArea = All;
    Caption = 'Book Posted Sales Shipment Line';
    PageType = ListPart;
    SourceTable = BookPostedSalesShipmentLine;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Order No."; Rec."Shipment No.")
                {
                    ToolTip = 'Specifies the value of the Order No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field("Item Name"; Rec."Item Name")
                {
                    ToolTip = 'Specifies the value of the Item Name field.';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Discount %"; Rec."Discount %")
                {
                    ToolTip = 'Specifies the value of the Discount % field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
            }
        }
    }
}
