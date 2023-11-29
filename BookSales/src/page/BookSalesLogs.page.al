page 50112 BookSalesLogs
{
    ApplicationArea = All;
    Caption = 'Book Sales Logs';
    PageType = List;
    SourceTable = BookSalesOrderLog;
    UsageCategory = Administration;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(LogID; Rec.Id)
                {
                    ToolTip = 'Specifies the value of the LogID field.';
                }
                field("Order No."; Rec."Order No.")
                {
                    ToolTip = 'Specifies the value of the Order No. field.';
                }
                field("Order Status"; Rec."Order Status")
                {
                    ToolTip = 'Specifies the value of the Order Status field.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.';
                }
                field(LogDateTime; Rec.LogDateTime)
                {
                    ToolTip = 'Specifies the value of the LogDateTime field.';
                }
                field(UserId; Rec.UserId)
                {
                    ToolTip = 'Specifies the value of the UserId field.';
                }
            }
        }
    }
}
