Class cysnet.sergio.bo.DBCache Extends Ens.BusinessOperation
{

/// Método que obtiene los datos de una persona a partir de su ID
Method obtenerPersona(pRequest As cysnet.sergio.msg.ObtenerPersonaRequest, Output pResponse As cysnet.sergio.msg.ObtenerPersonaResponse) As %Status
{
    set pResponse = ##class(cysnet.sergio.msg.ObtenerPersonaResponse).%New()
    set stm = ##class(%SQL.Statement).%New()
    do stm.%Prepare("SELECT nombre, apellidos, direccion, codPostal FROM cysnet_sergio_data.Persona WHERE ID = "_pRequest.idPersona)
    set rs = stm.%Execute()
    if (rs.%Next()) {
        set pResponse.nombre = rs.nombre
        set pResponse.apellidos = rs.apellidos
        set pResponse.direccion = rs.direccion
        set pResponse.codPostal = rs.codPostal
    } else {
        set pResponse.mensaje = "No existen datos para ese identificador ("_pRequest.idPersona_")"
    }
    quit $$$OK
}

/// Método que crea una nueva persona
Method crearPersona(pRequest As cysnet.sergio.msg.CrearPersonaRequest, Output pResponse As cysnet.sergio.msg.CrearPersonaResponse) As %Status
{
    #dim idPersona As %Integer = 0
    set pResponse = ##class(cysnet.sergio.msg.CrearPersonaResponse).%New()

    &sql(SELECT ID INTO :idPersona FROM cysnet_sergio_data.Persona WHERE nombre = :pRequest.nombre AND apellidos = :pRequest.apellidos)

    if (idPersona > 0) {
        set pResponse.mensaje = "La persona "_pRequest.nombre_" "_pRequest.apellidos_" ya existe."
    } else{
        &sql(INSERT INTO cysnet_sergio_data.Persona (nombre, apellidos, direccion, codPostal) VALUES (:pRequest.nombre, :pRequest.apellidos, :pRequest.direccion, :pRequest.codPostal))

        set pResponse.mensaje = "La persona "_pRequest.nombre_" "_pRequest.apellidos_" ha sido creada correctamente."
    }

    quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="cysnet.sergio.msg.ObtenerPersonaRequest">
        <Method>obtenerPersona</Method>
    </MapItem>
     <MapItem MessageType="cysnet.sergio.msg.CrearPersonaRequest">
        <Method>crearPersona</Method>
    </MapItem>
</MapItems>
}

}
