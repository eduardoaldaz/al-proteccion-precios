codeunit 50200 "Proteccion Lista Precios"
{
    [EventSubscriber(ObjectType::Table, Database::"Price List Header", 'OnBeforeDeleteEvent', '', false, false)]
    local procedure ProtegerListaPrecios(var Rec: Record "Price List Header"; RunTrigger: Boolean)
    begin
        if Rec.Status = Rec.Status::Active then
            Error(
                'No se puede eliminar la lista de precios "%1" porque está en estado Activo.\' +
                'Si realmente necesitas eliminarla, cambia a estado Borrador.',
                Rec.Description);

        //if not IsUserSuperAdmin() then
        //    Error('No tienes permisos para eliminar listas de precios.\Contacta con un administrador.');
    end;

    local procedure IsUserSuperAdmin(): Boolean
    var
        AccessControl: Record "Access Control";
    begin
        AccessControl.Reset();
        AccessControl.SetRange("User Security ID", UserSecurityId());
        AccessControl.SetRange("Role ID", 'SUPER');
        exit(not AccessControl.IsEmpty());
    end;
}