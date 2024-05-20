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

XData MessageMap
{
<MapItems>
    <MapItem MessageType="cysnet.sergio.msg.ObtenerPersonaRequest">
        <Method>obtenerPersona</Method>
    </MapItem>
</MapItems>
}

}
