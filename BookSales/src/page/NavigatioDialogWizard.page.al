page 50110 NavigatioDialogWizard
{
    ApplicationArea = All;
    Caption = 'Navigatio Dialog Wizard';
    PageType = NavigatePage;
    SourceTable = NavigationDialogT;
    SourceTableTemporary = true;
    UsageCategory = Administration;


    layout
    {

        area(content)
        {
            group(StandardBanner)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible and not FinishActionEnabled;
                field(MediaResourcesStandard; MediaResourcesStandard."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(FinishedBanner)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible and FinishActionEnabled;
                field(MediaResourcesDone; MediaResourcesDone."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(Step1)
            {
                Visible = Step1Visible;
                group("Welcome to Navigation Dialog Wizard")
                {
                    Caption = 'Welcome to Navigation Dialog Wizard';
                    Visible = Step1Visible;
                    group(Welcome)
                    {
                        ShowCaption = false;
                        InstructionalText = 'You can setup Navigation Dialog now.';
                    }
                }
                group("Let's go!")
                {
                    Caption = 'Let''s go!';
                    group(Group10)
                    {
                        ShowCaption = false;
                        InstructionalText = 'Choose Next to start basic settings for Navigation Dialog.';
                    }
                }
            }
            group(Step2)
            {
                Caption = 'General';
                InstructionalText = 'Step2 - Setup General.';
                Visible = Step2Visible;

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Item Name"; Rec."Item Name")
                {
                    ApplicationArea = All;
                }
            }
            group(Step3)
            {
                Caption = 'Dimensions';
                InstructionalText = 'Step3 - Setup dimensions';
                Visible = Step3Visible;

                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Discount %"; Rec."Discount %")
                {
                    ApplicationArea = All;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                }
            }
            group(Step4)
            {
                Visible = Step4Visible;
                group(Group23)
                {
                    Caption = 'OK';
                    InstructionalText = 'Step4 - You have finished the setup';
                }
                group("That's it!")
                {
                    Caption = 'That''s it!';
                    group(Group25)
                    {
                        ShowCaption = false;
                        InstructionalText = 'To save this setup, choose Finish.';
                    }
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(ActionBack)
            {
                ApplicationArea = All;
                Caption = 'Back';
                Enabled = BackActionEnabled;
                Image = PreviousRecord;
                InFooterBar = true;
                trigger OnAction();
                begin
                    NextStep(true);
                end;
            }
            action(ActionNext)
            {
                ApplicationArea = All;
                Caption = 'Next';
                Enabled = NextActionEnabled;
                Image = NextRecord;
                InFooterBar = true;
                trigger OnAction();
                begin
                    NextStep(false);
                end;
            }
            action(ActionFinish)
            {
                ApplicationArea = All;
                Caption = 'Finish';
                Enabled = FinishActionEnabled;
                Image = Approve;
                InFooterBar = true;
                trigger OnAction();
                begin
                    FinishAction();
                end;
            }
        }
    }
    trigger OnInit();
    begin
        LoadTopBanners();
    end;

    trigger OnOpenPage();
    var
        NavigationDialogT: Record NavigationDialogT;
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        Rec.Init();
        if NavigationDialogT.Get() then
            Rec.TransferFields(NavigationDialogT);

        Rec.Insert();

        Step := Step::Start;
        EnableControls();
    end;

    var
        Step1Visible: Boolean;
        Step2Visible: Boolean;
        Step3Visible: Boolean;
        Step4Visible: Boolean;
        Step: Option Start,Step2,Step3,Finish;
        BackActionEnabled: Boolean;
        FinishActionEnabled: Boolean;
        NextActionEnabled: Boolean;
        TopBannerVisible: Boolean;
        MediaRepositoryDone: Record "Media Repository";
        MediaRepositoryStandard: Record "Media Repository";
        MediaResourcesDone: Record "Media Resources";
        MediaResourcesStandard: Record "Media Resources";

    local procedure EnableControls();
    begin
        ResetControls();

        case Step of
            Step::Start:
                ShowStep1();
            Step::Step2:
                ShowStep2();
            Step::Step3:
                ShowStep3();
            Step::Finish:
                ShowStep4();
        end;
    end;

    local procedure StoreRecordVar();
    var
        NavigationDialogT: Record "NavigationDialogT";
    begin
        if not NavigationDialogT.Get() then begin
            NavigationDialogT.Init();
            NavigationDialogT.Insert();
        end;

        NavigationDialogT.TransferFields(Rec, false);
        NavigationDialogT.Modify(true);
    end;


    local procedure FinishAction();
    begin
        StoreRecordVar();
        CurrPage.Close();
    end;

    local procedure NextStep(Backwards: Boolean);
    begin
        if Backwards then
            Step := Step - 1
        ELSE
            Step := Step + 1;

        EnableControls();
    end;

    local procedure ShowStep1();
    begin
        Step1Visible := true;

        FinishActionEnabled := false;
        BackActionEnabled := false;
    end;

    local procedure ShowStep2();
    begin
        Step2Visible := true;
    end;

    local procedure ShowStep3();
    begin
        Step3Visible := true;
    end;

    local procedure ShowStep4();
    begin
        Step4Visible := true;

        NextActionEnabled := false;
        FinishActionEnabled := true;
    end;

    local procedure ResetControls();
    begin
        FinishActionEnabled := false;
        BackActionEnabled := true;
        NextActionEnabled := true;

        Step1Visible := false;
        Step2Visible := false;
        Step3Visible := false;
        Step4Visible := false;
    end;

    local procedure LoadTopBanners();
    begin
        if MediaRepositoryStandard.GET('AssistedSetup-NoText-400px.png', FORMAT(CurrentClientType())) AND
           MediaRepositoryDone.GET('AssistedSetupDone-NoText-400px.png', FORMAT(CurrentClientType()))
        then
            if MediaResourcesStandard.GET(MediaRepositoryStandard."Media Resources Ref") AND
               MediaResourcesDone.GET(MediaRepositoryDone."Media Resources Ref")
            then
                TopBannerVisible := MediaResourcesDone."Media Reference".HasValue();
    end;
}

