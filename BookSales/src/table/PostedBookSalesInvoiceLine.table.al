table 50104 PostedBookSalesInvoiceLine
{
    Caption = 'Posted Book Sales Invoice Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(10; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(11; "Item Name"; Text[100])
        {
            Caption = 'Item Name';
        }
        field(12; Price; Decimal)
        {
            Caption = 'Price';
        }
        field(13; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(14; "Discount %"; Decimal)
        {
            Caption = 'Discount %';
        }
        field(15; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
        }
    }
    keys
    {
        key(PK; "Invoice No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
