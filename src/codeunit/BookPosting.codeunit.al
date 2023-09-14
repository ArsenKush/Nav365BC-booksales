codeunit 50101 BookPosting
{
    TableNo = BookSalesHeader;

    trigger OnRun()
    begin

    end;

    procedure PostBookSalesHeader(BookSalesHeader: Record BookSalesHeader)
    begin
        BookSalesHeader.TestField(Status, BookSalesHeader.Status::Release);
        PostBookSalesShipment(BookSalesHeader);
        PostBookSalesInvoice(BookSalesHeader);
        DeleteBookSalesHeader(BookSalesHeader);
    end;

    local procedure DeleteBookSalesHeader(BookSalesHeader: Record BookSalesHeader)
    var
        BookSalesLine: Record BookSalesLine;
    begin
        BookSalesLine.Reset();
        BookSalesLine.SetRange("Order No.", BookSalesHeader."Order No.");
        if not BookSalesLine.IsEmpty then
            BookSalesLine.DeleteAll();
        BookSalesHeader.Delete();
    end;

    local procedure PostBookSalesInvoice(BookSalesHeader: Record BookSalesHeader)
    var
        BookPostedSalesInvoiceHeader: Record BookPostedSalesInvoiceHeader;
        BookPostedSelaeInvoiceLine: Record BookPostedSalesInvoiceLine;
        BookSalesLine: Record BookSalesLine;
    begin
        BookPostedSalesInvoiceHeader.Init();
        BookPostedSalesInvoiceHeader.TransferFields(BookSalesHeader);
        BookPostedSalesInvoiceHeader."Order No." := BookSalesHeader."Order No.";
        BookPostedSalesInvoiceHeader."Invoice No." := '';
        BookPostedSalesInvoiceHeader.Insert(true);

        BookSalesLine.Reset();
        BookSalesLine.SetRange("Order No.", BookSalesHeader."Order No.");
        if BookSalesLine.FindSet() then
            repeat
                BookPostedSelaeInvoiceLine.Init();
                BookPostedSelaeInvoiceLine.TransferFields(BookSalesLine);
                BookPostedSelaeInvoiceLine."Invoice No." := BookPostedSalesInvoiceHeader."Invoice No.";
                BookPostedSelaeInvoiceLine.Insert(true);
            until BookSalesLine.Next() = 0;
    end;

    local procedure PostBookSalesShipment(BookSalesHeader: Record BookSalesHeader)
    var
        BookPostedSalesShipmentHeader: Record BookPostedSalesShipmentHeader;
        BookPostedSalesShipmentLine: Record BookPostedSalesShipmentLine;
        BookSalesLine: Record BookSalesLine;
    begin
        BookPostedSalesShipmentHeader.Init();
        BookPostedSalesShipmentHeader.TransferFields(BookSalesHeader);
        BookPostedSalesShipmentHeader."Order No." := BookSalesHeader."Order No.";
        BookPostedSalesShipmentHeader."Shipment No." := '';
        BookPostedSalesShipmentHeader.Insert(true);

        BookSalesLine.Reset();
        BookSalesLine.SetRange("Order No.", BookSalesHeader."Order No.");
        if BookSalesLine.FindSet() then
            repeat
                BookPostedSalesShipmentLine.Init();
                BookPostedSalesShipmentLine.TransferFields(BookSalesLine);
                BookPostedSalesShipmentLine."Shipment No." := BookPostedSalesShipmentHeader."Shipment No.";
                BookPostedSalesShipmentLine.Insert(true);
            until BookSalesLine.Next() = 0;
    end;

}
