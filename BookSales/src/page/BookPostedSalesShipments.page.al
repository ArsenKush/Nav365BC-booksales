page 50107 BookPostedSalesShipments
{
    ApplicationArea = All;
    Caption = 'Book Posted Sales Shipments';
    PageType = List;
    SourceTable = BookPostedSalesShipmentHeader;
    UsageCategory = Documents;
    CardPageId = BookPostedSalesShipment;

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
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
