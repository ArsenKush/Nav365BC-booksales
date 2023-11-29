codeunit 50104 BookRelease
{
    procedure Release(var BookSalesHeader: Record BookSalesHeader)
    begin
        OnBeforeRelease(BookSalesHeader);
        BookSalesHeader.Status := BookSalesStatus::Release;
        OnAfterRelease(BookSalesHeader);
    end;

    procedure Reopen(var BookSalesHeader: Record BookSalesHeader)
    begin
        OnBeforeReopen(BookSalesHeader);
        BookSalesHeader.Status := BookSalesStatus::Open;
        OnAfterReopen(BookSalesHeader);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeRelease(var BookSalesHeader: Record BookSalesHeader)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterRelease(var BookSalesHeader: Record BookSalesHeader)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeReopen(var BookSalesHeader: Record BookSalesHeader)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterReopen(var BookSalesHeader: Record BookSalesHeader)
    begin
    end;
}