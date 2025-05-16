namespace CMSInternshipProject.CMSInternshipProject;
using Microsoft.Foundation.Attachment;

codeunit 53102 "CMS Event Codeunit"
{
    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure SpecifyBeforeCanCardDocAttach(Documentattachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        CandApp: Record "CMS Candidate Application";
    begin
        case
            Documentattachment."Table ID" of
            DATABASE::"CMS Candidate Application":
                begin
                    RecRef.Open(Database::"CMS Candidate Application");
                    if CandApp.Get(Documentattachment."No.") then
                        RecRef.GetTable(CandApp);
                end;
        end;

    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure SpecifyTheFieldAssociateinOpenRecref(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.Number of
            Database::"CMS Candidate Application":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;

    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure UpdatePrimaryKeyOnAfterInitFieldsFromRecRec(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FielfRef: FieldRef;
        RecNo: Code[20];
    begin
        if RecRef.Number = Database::"CMS Candidate Application" then begin
            FielfRef := RecRef.Field(1);
            RecNo := FielfRef.Value;
            DocumentAttachment.Validate("No.", RecNo);
        end;

    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure DocumentAttachOnBeforeFrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        TrainApp: Record "CMS Training Application";
    begin
        case
       Documentattachment."Table ID" of
            DATABASE::"CMS Training Application":
                begin
                    RecRef.Open(Database::"CMS Training Application");
                    if TrainApp.Get(Documentattachment."No.") then
                        RecRef.GetTable(TrainApp);
                end;
        end;


    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure SpecifyTheFieldAssociateOnTrainingAppinOpenRecref(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.Number of
            Database::"CMS Training Application":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;

    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure UpdatePrimaryKeyOfTrainingAppOnAfterInitFieldsFromRecRec(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FielfRef: FieldRef;
        RecNo: Code[20];
    begin
        if RecRef.Number = Database::"CMS Training Application" then begin
            FielfRef := RecRef.Field(1);
            RecNo := FielfRef.Value;
            DocumentAttachment.Validate("No.", RecNo);
        end;

    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure SpecifyBeforeVacancyCardDocAttach(Documentattachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        VacApp: Record "CMS Vacancy";
    begin
        case
            Documentattachment."Table ID" of
            DATABASE::"CMS Vacancy":
                begin
                    RecRef.Open(Database::"CMS Vacancy");
                    if VacApp.Get(Documentattachment."No.") then
                        RecRef.GetTable(VacApp);
                end;
        end;

    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure SpecifyTheFieldAssociateOnVacinOpenRecref(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.Number of
            Database::"CMS Vacancy":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;

    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure UpdatePrimaryKeyVacancyOnAfterInitFieldsFromRecRec(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FielfRef: FieldRef;
        RecNo: Code[20];
    begin
        if RecRef.Number = Database::"CMS Vacancy" then begin
            FielfRef := RecRef.Field(1);
            RecNo := FielfRef.Value;
            DocumentAttachment.Validate("No.", RecNo);
        end;

    end;
}
