codeunit 50100 BookLibrary
{
    procedure Release(var BookSalesHeader: Record BookSalesHeader)
    begin
        BookSalesHeader.Status := BookSalesStatus::Release;
    end;

    procedure Reopen(var BookSalesHeader: Record BookSalesHeader)
    begin
        BookSalesHeader.Status := BookSalesStatus::Open;
    end;
}