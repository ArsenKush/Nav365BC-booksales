codeunit 50105 BookSalesOrderSubs
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::BookRelease, 'OnBeforeRelease', '', true, true)]
    local procedure BookReleaseOnBeforeRelease(var BookSalesHeader: Record BookSalesHeader)
    begin
        InsertBookSalesOrderStatusLog(BookSalesHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::BookRelease, 'OnAfterRelease', '', true, true)]
    local procedure BookReleaseOnAfterRelease(var BookSalesHeader: Record BookSalesHeader)
    begin
        InsertBookSalesOrderStatusLog(BookSalesHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::BookRelease, 'OnBeforeReopen', '', true, true)]
    local procedure BookReleaseOnBeforeReopen(var BookSalesHeader: Record BookSalesHeader)
    begin
        InsertBookSalesOrderStatusLog(BookSalesHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::BookRelease, 'OnAfterReopen', '', true, true)]
    local procedure BookReleaseOnAfterReopen(var BookSalesHeader: Record BookSalesHeader)
    begin
        InsertBookSalesOrderStatusLog(BookSalesHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::BookPosting, 'OnAfterPosting', '', true, true)]
    local procedure BookPostingOnAfterPosting(var BookSalesHeader: Record BookSalesHeader)
    begin
        InsertBookSalesOrderStatusLog(BookSalesHeader);
    end;

    local procedure InsertBookSalesOrderStatusLog(var BookSalesHeader: Record BookSalesHeader)
    var
        BookSalesLog: Record BookSalesOrderLog;
    begin
        BookSalesLog.Init();
        BookSalesLog."Order No." := BookSalesHeader."Order No.";
        BookSalesLog."Order Date" := DT2Date(BookSalesHeader."Document Date");
        BookSalesLog."Order Status" := BookSalesHeader.Status;
        BookSalesLog.LogDateTime := CurrentDateTime();
        BookSalesLog.UserId := UserId();
        BookSalesLog.Insert()
    end;
}
