codeunit 50103 NavigationDialogSubscribing
{
    TableNo = NavigationDialogT;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRegisterAssistedSetup', '', true, true)]
    local procedure OnRegisterAssistedSetup()
    var
        AssistedSetup: Codeunit "Guided Experience";
        GuidedExperienceType: Enum "Guided Experience Type";
        AssistedSetupGroup: Enum "Assisted Setup Group";
        VideoCategory: Enum "Video Category";
        Language: Codeunit Language;
        CurrentGlobalLanguage: Integer;
    begin
        if not AssistedSetup.Exists(GuidedExperienceType::"Assisted Setup",
                                    ObjectType::Page,
                                    Page::NavigationDialogWizard) then
            AssistedSetup.InsertAssistedSetup(
                                             // Link text for the assisted setup guide
                                             'Add a to-do',
                                             // Short description, not shown on page 
                                             'Create a task for your team',
                                             // Text that shows in Description column
                                             'Register a task for your team and assign people',
                                             1,
                                             ObjectType::Page,
                                             Page::NavigationDialogWizard,
                                             // Assign guide to Task category
                                             AssistedSetupGroup::Warehouse,
                                             //Video URL not required
                                             '',
                                             VideoCategory::Uncategorized,
                                             //Help URL not required
                                             '');
    end;

    local procedure GetAppId(): Guid
    var
        EmptyGuid: Guid;
    begin
        if Info.Id() = EmptyGuid then
            NavApp.GetCurrentModuleInfo(Info);
        exit(Info.Id());
    end;

    var
        Info: ModuleInfo;
        SetupTxt: Label 'Set up General Ledger Setup';
}