page 50111 BookSalesOrders
{
    ApplicationArea = All;
    Caption = 'Book Sales Orders';
    PageType = List;
    SourceTable = BookSalesHeader;
    UsageCategory = Documents;
    CardPageId = BookSalesOrder;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Order No."; Rec."Order No.")
                {
                    ToolTip = 'Specifies the value of the Order No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("TotalAmount"; Rec.TotalAmount)
                {
                    Caption = 'Total Amount';
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Payment "; Rec."Payment")
                {
                    ToolTip = 'Specifies the value of the Payment  field.';
                }
                field("Document data"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document data field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}
