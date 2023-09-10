table 50105 BookPostedSalesShipmentHeader
{
    Caption = ' Book Posted Sales Shipment Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Shipment No."; Code[20])
        {
            Caption = 'Shipment No.';
        }
        field(10; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
        }
        field(11; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }
        field(12; Payment; Boolean)
        {
            Caption = 'Payment';
        }
        field(13; "Document Date"; DateTime)
        {
            Caption = 'Document Date';
        }
        field(14; Status; Enum BookSalesStatus)
        {
            Caption = 'Status';
        }
        field(15; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
        }
        field(16; "Ship-to Adress"; Text[100])
        {
            Caption = 'Ship-to Adress';
        }
        field(17; City; Text[100])
        {
            Caption = 'City';
        }
        field(18; "Phone Number"; Text[100])
        {
            Caption = 'Phone Number';
        }
        field(19; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(107; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
    }
    keys
    {
        key(PK; "Shipment No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        SetOrderNo();
    end;

    local procedure SetOrderNo()
    var
        BookOrderSetup: Record BookOrderSetup;
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "Shipment No." = '' then begin
            BookOrderSetup.SafeGet();
            BookOrderSetup.TestField("Book Shipment Nos.");
            NoSeriesManagement.InitSeries(BookOrderSetup."Book Shipment Nos.", xRec."No. Series", 0D, "Shipment No.", "No. Series");
        end;
    end;
}
