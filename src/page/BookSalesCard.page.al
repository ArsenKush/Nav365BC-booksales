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
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Payment "; Rec."Payment")
                {
                    ToolTip = 'Specifies the value of the Payment  field.';
                }
                field("Document data"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document data field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(PartName; BookSalesLine)
            {
                Caption = 'Book Sales Line';
                SubPageLink = "Order No." = field("Order No.");
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
        // Report.Run(Report::"ReceiptBankList")
    end;



}
