table 50101 BookSalesLine
{
    Caption = 'Book Sales Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(10; "Item No."; Code[20])
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
        field(11; "Item Name"; Text[100])
        {
            Caption = 'Item Name';
        }
        field(35; "Price"; Decimal)
        {
            Caption = 'Price';
            trigger OnValidate()
            begin
                CalcTotalAmount();
            end;
        }
        field(13; Quantity; Decimal)
        {
            Caption = 'Quantity';
            trigger OnValidate()
            begin
                CalcTotalAmount();
            end;
        }
        field(14; "Discount %"; Decimal)
        {
            Caption = 'Discount %';
            trigger OnValidate()
            begin
                CalcTotalAmount();
            end;
        }
        field(15; "Line Amount"; Decimal)
        {
            Editable = false;
            Caption = 'Line Amount';
        }
    }
    keys
    {
        key(PK; "Order No.", "Line No.")
        {
            Clustered = true;
        }

    }

    trigger OnInsert()
    var
        BookSalesLine: Record BookSalesLine;
    begin
        if Rec."Line No." = 0 then begin
            BookSalesLine.Reset();
            BookSalesLine.SetRange("Order No.", Rec."Order No.");
            if BookSalesLine.FindLast() then
                Rec."Line No." := BookSalesLine."Line No." + 10000
            else
                Rec."Line No." := 10000;
        end;

    end;

    procedure CalcTotalAmount()
    begin
        "Line Amount" := Price * Quantity * (1 - ("Discount %" / 100));
    end;
}
