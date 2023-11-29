report 50101 BookSalesOrder
{
    ApplicationArea = All;
    Caption = 'BookSalesOrder';
    UsageCategory = None;
    DefaultLayout = "RDLC";
    RDLCLayout = './src/report/layout/BookSalesOrder.rdl';

    dataset
    {
        dataitem(BookSalesHeader; BookSalesHeader)
        {
            RequestFilterFields = "Order No.", "Customer No.";
            column(OrderNo; "Order No.")
            { }
            column(CustomerNo; "Customer No.")
            { }
            column(CustomerName; "Customer Name")
            { }
            column(DocumentDate; "Document Date")
            { }
            column(Payment; Payment)
            { }
            column(Status; Status)
            { }
            column(CompanyPic; CompanyInfo.Picture)
            { }
            column(Receipt_Bank_List; Receipt_Bank_List)
            { }

            dataitem(BookSalesLine; BookSalesLine)
            {
                DataItemLink = "Order No." = field("Order No.");
                column(LineItemNo; "Item No.")
                { }
                column(LineLineNo; "Line No.")
                { }
                column(LineItemName; "Item Name")
                { }
                column(LineQuantity; Quantity)
                { }
                column(LinePrice; Price)
                { }
                column(LineDiscount; "Discount %")
                { }
                column(LineAmount; "Line Amount")
                { }
            }
        }

    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        Receipt_Bank_List: Label 'Receipt Bank List';
}
