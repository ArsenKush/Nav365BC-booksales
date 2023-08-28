page 50101 BookSalesCard
{
    ApplicationArea = All;
    Caption = 'Book Sales Card';
    PageType = Card;
    SourceTable = BookSalesHeader;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

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
                field("Payment "; Rec."Payment ")
                {
                    ToolTip = 'Specifies the value of the Payment  field.';
                }
                field("Document data"; Rec."Document data")
                {
                    ToolTip = 'Specifies the value of the Document data field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(PartName; BookSalesLine)
            {
                Caption = 'Book Sales Line';
                SubPageLink = "Order No." = field("Order No.");
            }
        }
    }
}
