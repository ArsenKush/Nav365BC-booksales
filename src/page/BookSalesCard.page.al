page 50101 BookSalesCard
{
    ApplicationArea = All;
    Caption = 'Book Sales Card';
    PageType = Card;
    SourceTable = BookSalesHeader;

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
                    Importance = Promoted;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    Importance = Promoted;

                }
                field("Payment "; Rec."Payment")
                {
                    ToolTip = 'Specifies the value of the Payment  field.';
                    Importance = Additional;

                }
                field("Document data"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document data field.';
                    Importance = Additional;


                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }

                group("Sell-to")
                {
                    Caption = 'Sell-to';
                    field("Ship-to Address"; Rec."Ship-to Adress")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Address';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the address where the customer is located.';
                    }
                    field(City; Rec.City)
                    {
                        ToolTip = 'Specifies the value of the City field.';
                        Importance = Additional;
                    }
                    field("Phone Number"; Rec."Phone Number")
                    {
                        ToolTip = 'Specifies the value of the Phone Number data field.';
                        Importance = Additional;
                    }
                }
            }
            part(PartName; BookSalesLine)
            {
                Caption = 'Book Sales Line';
                SubPageLink = "Order No." = field("Order No.");
            }
            group(Totals)
            {
                field(TotalAmount; Rec.TotalAmount)
                {
                    Caption = 'Total Amount';
                }

            }
        }
    }


    actions
    {
        area(Promoted)
        {
            group(Category_Category5)
            {
                Caption = 'Release', Comment = 'Generated from the PromotedActionCategories property index 4.';
                ShowAs = SplitButton;

                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
        }
        area(Processing)
        {
            action(Posting)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    BookPosting: Codeunit BookPosting;
                begin
                    BookPosting.PostBookSalesHeader(Rec);
                end;
            }
            action(Release)
            {
                ApplicationArea = All;
                Caption = 'Release';
                Image = ReleaseDoc;

                trigger OnAction()
                begin
                    ReleaseOnPage();
                end;
            }

            action(Reopen)
            {
                ApplicationArea = All;
                Caption = 'Reopen';
                Image = ReOpen;

                trigger OnAction()
                begin
                    OpenOnPage();
                end;
            }

        }
        area(Reporting)
        {
            action(PrintOrder)
            {
                Caption = 'Print Order';
                RunObject = report BookSalesOrder;
            }

            action(PrintOrder2)
            {
                Caption = 'Print Order2';
                trigger OnAction()
                begin
                    Report.Run(Report::BookSalesOrder);
                end;
            }
        }
    }


    var
        BookLibrary: Codeunit BookLibrary;

    local procedure ReleaseOnPage()
    begin
        BookLibrary.Release(Rec);
    end;

    local procedure OpenOnPage()
    begin
        BookLibrary.Reopen(Rec);
    end;

    trigger OnOpenPage()
    begin

    end;

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(TotalAmount);
        // CurrPage.Update();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        Rec.CalcFields(TotalAmount);
        // CurrPage.Update();
    end;
}
