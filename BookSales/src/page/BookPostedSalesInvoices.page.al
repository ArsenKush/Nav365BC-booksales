page 50104 BookPostedSalesInvoices
{
    ApplicationArea = All;
    Caption = 'Book Posted Sales Invoices';
    PageType = List;
    SourceTable = BookPostedSalesInvoiceHeader;
    UsageCategory = Documents;
    CardPageId = BookPostedSalesInvoice;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';

                field("Order No."; Rec."Order No.")
                {
                    ToolTip = 'Specifies the value of the Order No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field(Payment; Rec.Payment)
                {
                    ToolTip = 'Specifies the value of the Payment field.';
                }
                field("Document Data"; Rec."Document Data")
                {
                    ToolTip = 'Specifies the value of the Document Data field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Ship-to Adress"; Rec."Ship-to Adress")
                {
                    ToolTip = 'Specifies the value of the Ship-to Adress field.';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ToolTip = 'Specifies the value of the Phone Number field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
            }
        }
    }
}
