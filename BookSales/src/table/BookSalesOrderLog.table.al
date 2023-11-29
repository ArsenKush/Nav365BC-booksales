table 50109 BookSalesOrderLog
{
    Caption = 'Book Sales Order Log';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Id; Integer)
        {
            AutoIncrement = true;
            Caption = 'Log ID';
        }
        field(10; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(11; "Order Date"; Date)
        {
            Caption = 'Order Date';
        }
        field(12; "Order Status"; Enum BookSalesStatus)
        {
            Caption = 'Order Status';
        }
        field(13; LogDateTime; DateTime)
        {
            Caption = 'LogDateTime';
        }
        field(14; UserId; Text[250])
        {
            Caption = 'User Id.';
        }
    }
    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
    }
}
