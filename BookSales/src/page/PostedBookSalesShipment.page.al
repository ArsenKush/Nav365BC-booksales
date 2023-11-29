page 50109 PostedBookSalesShipment
{
    ApplicationArea = All;
    Caption = 'Posted Book Sales Shipment';
    PageType = Card;
    SourceTable = PostedBookSalesShipmentHeader;

    layout
    {
        area(content)
        {
            group(General)
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
            part(PartName; PostedBookSalesShipmentLine)
            {
                Caption = 'Shipment Line';
                SubPageLink = "Shipment No." = field("Shipment No.");
            }
        }
    }
}
