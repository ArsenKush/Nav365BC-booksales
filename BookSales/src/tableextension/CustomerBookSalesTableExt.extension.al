tableextension 50101 CustomerBookSalesTableExt extends Customer
{
    fields
    {
        field(50100; "Book Sales Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Book Sales Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum(BookSalesLine."Line Amount" where("Customer No." = field("No.")));
        }
    }
}
