page 50102 BookSalesLine
{
    ApplicationArea = All;
    Caption = 'Book Sales Line';
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
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
            }
        }
    }
}
