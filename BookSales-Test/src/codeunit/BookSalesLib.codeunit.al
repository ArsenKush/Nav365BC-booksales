codeunit 50130 BookSalesLib
{
    procedure CreateBookSalesOrder(var BookSalesHeader: Record BookSalesHeader)
    begin
        BookSalesHeader.Init();
        BookSalesHeader.Insert(true);
    end;
}
