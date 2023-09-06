page 50103 BookOrderSetup
{
    ApplicationArea = All;
    Caption = 'Book Order Setup';
    PageType = Card;
    SourceTable = BookOrderSetup;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(Name; Rec."Book Order Nos.")
                {
                    ToolTip = 'Specifies the value of the Book Order Nos. field.';
                }
            }
        }
    }
}
