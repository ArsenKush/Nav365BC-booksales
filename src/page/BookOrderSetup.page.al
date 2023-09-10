page 50103 BookOrderSetup
{
    ApplicationArea = All;
    Caption = 'Book Order Setup';
    PageType = Card;
    SourceTable = BookOrderSetup;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Book Order Nos."; Rec."Book Order Nos.")
                {
                    ToolTip = 'Specifies the value of the Book Order Nos. field.';
                }
                field("Book Invoice Nos."; Rec."Book Invoice Nos.")
                {
                    ToolTip = 'Specifies the value of the Book Invoice Nos. field.';
                }
                field("Book Shipment Nos."; Rec."Book Shipment Nos.")
                {
                    ToolTip = 'Specifies the value of the Book Shipment Nos. field.';
                }
            }
        }
    }
}
