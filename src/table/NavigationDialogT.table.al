table 50107 NavigationDialogT
{
    Caption = 'Navigation Dialog T.';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item."No.";

            trigger OnValidate()
            var
                Item: Record Item;
            begin
                item.Get("Item No.");
                "Item Name" := Item.Description;
            end;
        }
        field(5; "Item Name"; Text[100])
        {
            Caption = 'Item Name';
        }
        field(6; Price; Decimal)
        {
            Caption = 'Price';
            trigger OnValidate()
            begin
                CalcTotalAmount();
            end;
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
            trigger OnValidate()
            begin
                CalcTotalAmount();
            end;
        }
        field(8; "Discount %"; Decimal)
        {
            Caption = 'Discount %';
            trigger OnValidate()
            begin
                CalcTotalAmount();
            end;
        }
        field(9; "Line Amount"; Decimal)
        {
            Editable = false;
            Caption = 'Line Amount';
        }
    }
    keys
    {
        key(PK; "Order No.")
        {
            Clustered = true;
        }
    }
    procedure CalcTotalAmount()
    var
        BookSalesHeader: Record BookSalesHeader;
        BookSalesLine: Record BookSalesLine;
    begin
        "Line Amount" := Price * Quantity * (1 - ("Discount %" / 100));
    end;
}
