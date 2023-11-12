pageextension 50100 CustomerCardBookSalesExt extends "Customer Card"
{
    layout
    {
        addafter("No.")
        {
            field("Book Sales Amount"; Rec."Book Sales Amount")
            {
                ApplicationArea = All;
                Caption = 'Book Sales Amount';
                ToolTip = 'Specifies the value of the Book Sales Amount field.';
            }
        }
    }
}
