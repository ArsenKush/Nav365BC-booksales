page 50102 BookSalesOrderLinesPart
{
    ApplicationArea = All;
    Caption = 'Book Sales Order Lines';
    PageType = ListPart;
    SourceTable = BookSalesLine;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Order No."; Rec."Order No.")
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Order No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field("Item Name"; Rec."Item Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Item Name field.';
                }
                field(Price; Rec."Price")
                {
                    ToolTip = 'Specifies the value of the Price field.';
                }
                field(Quantity; Rec."Quantity")
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Discount%"; Rec."Discount %")
                {
                    Caption = 'Discount %';
                    ToolTip = 'Specifies the value of the Discount % field.';
                }
                field(LineAmount; Rec."Line Amount")
                {
                    Caption = 'Line Amount';
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }

            }
        }
    }
}
