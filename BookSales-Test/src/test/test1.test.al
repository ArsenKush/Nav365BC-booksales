codeunit 50131 Test1
{
    Subtype = Test;

    trigger OnRun()
    begin
        //
    end;

    var
        BookSalesLib: Codeunit BookSalesLib;
        LibraryAssert: Codeunit "Library Assert";
        IsInitialized: Boolean;

    local procedure SetTestPermissions();
    var
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
    begin
        LibraryLowerPermissions.AddO365BusinessPremium();
        LibraryLowerPermissions.AddPermissionSet('BookSalesPermission');
    end;

    local procedure Initialize();
    begin
        SetTestPermissions();
        if IsInitialized then
            exit;

        IsInitialized := true;
    end;


    [Test]
    procedure TestCreationBookSalesOrder()
    var
        Customer: Record Customer;
        BookSalesHeader: Record BookSalesHeader;
    begin
        Initialize();
        BookSalesLib.CreateBookSalesOrder(BookSalesHeader);
        LibraryAssert.AreNotEqual('', BookSalesHeader."Order No.", '');
    end;
}