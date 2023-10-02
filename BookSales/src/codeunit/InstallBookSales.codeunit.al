codeunit 50102 InstallBookSales
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        BookOrderSetup: Record BookOrderSetup;
        BoOrdNosLbl: Label 'BO-ORD', Locked = true;
        BoInvNosLbl: Label 'BO-INV', Locked = true;
        BoShpNosLbl: Label 'BO-SHP', Locked = true;
        BookOrderLbl: Label 'Book Order';
        BookOrderInvoiceLbl: Label 'Book Order Invoice';
        BookOrderShipmentLbl: Label 'Book Order Shipment';
    begin
        CheckAndCreateNoSeries(BoOrdNosLbl, BookOrderLbl);
        CheckAndCreateNoSeries(BoInvNosLbl, BookOrderInvoiceLbl);
        CheckAndCreateNoSeries(BoShpNosLbl, BookOrderShipmentLbl);
        if not BookOrderSetup.Get() then begin
            BookOrderSetup.Init();
            BookOrderSetup.Validate("Book Order Nos.", BoOrdNosLbl);
            BookOrderSetup.Validate("Book Invoice Nos.", BoInvNosLbl);
            BookOrderSetup.Validate("Book Shipment Nos.", BoShpNosLbl);
            BookOrderSetup.Insert(true);
        end

    end;

    trigger OnInstallAppPerDatabase()
    begin

    end;

    procedure CheckAndCreateNoSeries(NoSeriesCode: code[20]; NoSeriesDescription: text[100])
    var
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
    begin
        if not NoSeries.Get(NoSeriesCode) then begin
            NoSeries.Init();
            NoSeries.Validate(Code, NoSeriesCode);
            NoSeries.Validate(Description, NoSeriesDescription);
            NoSeries.Validate("Default Nos.", true);
            NoSeries.Insert(true);

            NoSeriesLine.Init();
            NoSeriesLine.Validate("Series Code", NoSeries.Code);
            NoSeriesLine.Validate("Line No.", 10000);
            NoSeriesLine.Validate("Starting No.", NoSeriesCode + '000001');
            NoSeriesLine.Validate("Ending No.", NoSeriesCode + '999999');
            NoSeriesLine.Insert(true);
        end;

    end;
}