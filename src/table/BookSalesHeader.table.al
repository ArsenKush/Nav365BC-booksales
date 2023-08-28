table 50100 BookSalesHeader
{
    Caption = 'Book Sales Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Order No."; Code[10])
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

        field(12; "Payment "; Boolean)
        {
            Caption = 'Payment ';
        }
        field(13; "Document data"; DateTime)
        {
            Caption = 'Document data';
        }
        field(14; Status; Enum BookSalesStatus)
        {
            Caption = 'Status';
        }
    }
    keys
    {
        key(PK; "Order No.")
        {
            Clustered = true;
        }
    }
}
