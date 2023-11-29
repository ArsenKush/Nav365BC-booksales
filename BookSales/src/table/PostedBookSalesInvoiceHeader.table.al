table 50102 PostedBookSalesInvoiceHeader
{
    Caption = 'Posted Book Sales Invoice Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
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
        field(13; "Document Data"; DateTime)
        {
            Caption = 'Document Data';
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
        field(107; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(19; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
    }
    keys
    {
        key(PK; "Invoice No.")
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
        if "Invoice No." = '' then begin
            BookOrderSetup.SafeGet();
            BookOrderSetup.TestField("Book Invoice Nos.");
            NoSeriesManagement.InitSeries(BookOrderSetup."Book Invoice Nos.", xRec."No. Series", 0D, "Invoice No.", "No. Series");
        end;
    end;
}
