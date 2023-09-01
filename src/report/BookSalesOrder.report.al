report 50100 BookSalesOrder
{
    ApplicationArea = All;
    Caption = 'BookSalesOrder';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = "RDLC";
    RDLCLayout = './src/layout/BookSalesOrder.rdl';

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

                // column(Order_No_; "Order No.")
                // { }
                column(LineItemNo; "Item No.")
                { }
                column(LineLineNo; "Line No.")
                { }
                column(LineItemName; "Item Name")
                { }
                column(LineQuantity; Quantity)
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
