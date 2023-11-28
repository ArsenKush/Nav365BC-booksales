table 50103 BookOrderSetup
{
    Caption = 'Book Order Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
        }
        field(10; "Book Order Nos."; Code[20])
        {
            Caption = 'Book Order Nos.';
            TableRelation = "No. Series";
        }
        field(11; "Book Invoice Nos."; Code[20])
        {
            Caption = 'Book Invoice Nos.';
            TableRelation = "No. Series";
        }
        field(12; "Book Shipment Nos."; Code[20])
        {
            Caption = 'Book Shipment Nos.';
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    procedure SafeGet()
    begin
        if Not Get() then
            Insert(true);
    end;
}
