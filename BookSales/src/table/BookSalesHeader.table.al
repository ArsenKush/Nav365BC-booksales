table 50108 BookSalesHeader
{
    Caption = 'Book Sales Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(10; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                Customer.Get("Customer No.");
                "Customer Name" := Customer.Name;
            end;
        }
        field(11; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }

        field(12; "Payment"; Boolean)
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
        field(15; TotalAmount; Decimal)
        {
            // AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum(BookSalesLine."Line Amount" where("Order No." = field("Order No.")));
        }
        field(16; "Ship-to Adress"; Text[100])
        {
            Caption = 'Ship to Address';
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
            TableRelation = "No. Series";
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "Order No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        SetOrderNo();
        SetDate();
    end;

    local procedure SetOrderNo()
    var
        BookOrderSetup: Record BookOrderSetup;
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "Order No." = '' then begin
            BookOrderSetup.SafeGet();
            BookOrderSetup.TestField("Book Order Nos.");
            NoSeriesManagement.InitSeries(BookOrderSetup."Book Order Nos.", xRec."No. Series", 0D, "Order No.", "No. Series");
        end;
    end;



    local procedure SetDate()
    begin
        "Document Date" := CurrentDateTime;
    end;
}