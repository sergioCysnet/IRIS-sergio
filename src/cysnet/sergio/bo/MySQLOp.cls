Class cysnet.sergio.bo.MySQLOp Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

/// Método que obtiene los datos de una persona a partir de su ID
Method obtenerPersona(pRequest As cysnet.sergio.msg.ObtenerPersonaRequest, Output pResponse As cysnet.sergio.msg.ObtenerPersonaResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim stm As %SQL.Statement
    #dim rs As %SQL.StatementResult

    set pResponse = ##class(cysnet.sergio.msg.ObtenerPersonaResponse).%New()
    set pResponse.exito = 1

    try {
        #dim rs As EnsLib.SQL.GatewayResultSet

        set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()
        set sql = "SELECT Nombre, Apellidos FROM Persona WHERE ID = ?"

        set sc = ..Adapter.ExecuteQuery(.rs, sql, pRequest.idPersona)
        if ($$$ISOK(sc)) {
            if (rs.Next(.sc)) {
                quit:$$$ISERR(sc)
                set pResponse.nombre = rs.Get("Nombre")
                set pResponse.apellidos = rs.Get("Apellidos")
            }
        }
    } catch (err) {
        // Si ha ocurrido un error, crear el objeto Status:
        if (err.%ClassName(1)="common.err.exception") && ($$$ISERR(err.status)) {
            set sc = err.status
        } else {
            set sc = $System.Status.Error(err.Code,err.Name,err.Location,err.InnerException)
        }
    }
    if ($$$ISERR(sc)) {
        set pResponse.exito = 0
        set pResponse.error = $System.Status.GetErrorText(sc)
    }

    quit $$$OK
}

/// Método que crea una nueva persona
Method crearPersona(pRequest As cysnet.sergio.msg.CrearPersonaRequest, Output pResponse As cysnet.sergio.msg.CrearPersonaResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim idPersona As %Integer = 0

    set pResponse = ##class(cysnet.sergio.msg.CrearPersonaResponse).%New()
    set pResponse.exito = 1
    
    try {
        #dim numRows As %Integer = 0

        set sql = "INSERT INTO Persona (Nombre, Apellidos) VALUES (?, ?)"

        set sc = ..Adapter.ExecuteUpdate(.numRows, sql, pRequest.nombre, pRequest.apellidos)
        if ($$$ISOK(sc)) {
            if (numRows = 0) {
                set pResponse.exito = 0
                set pResponse.error = "No se ha insertado ninguna fila"
            }
        }     
    } catch (err) {
        // Si ha ocurrido un error, crear el objeto Status:
        if (err.%ClassName(1)="common.err.exception") && ($$$ISERR(err.status)) {
            set sc = err.status
        } else {
            set sc = $System.Status.Error(err.Code,err.Name,err.Location,err.InnerException)
        }
    }
    if ($$$ISERR(sc)) {
        set pResponse.exito = 0
        set pResponse.error = $System.Status.GetErrorText(sc)
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
