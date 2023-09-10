table 50106 BookPostedSalesShipmentLine
{
    Caption = 'Book Posted Sales Shipment Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Shipment No."; Code[20])
        {
            Caption = 'Shipment No.';
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
        key(PK; "Shipment No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
