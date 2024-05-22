Class cysnet.sergio.bp.MiProcesoCodigo Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
    #dim sc As %Status = $$$OK

    if (pRequest.%ClassName() = "CrearPersonaRequest") {
        set pResponse = ##class(cysnet.sergio.msg.CrearPersonaResponse).%New()
        do ..SendRequestSync("DBCache", pRequest, .pResponse)
    } elseif (pRequest.%ClassName() = "ObtenerPersonaRequest") {
        set pResponse = ##class(cysnet.sergio.msg.ObtenerPersonaResponse).%New()

        if (pRequest.idPersona > 0) {
            do ..SendRequestSync("DBCache", pRequest, .pResponse)
        } else {
            set pResponse.mensaje = "El id de persona no puede ser menor o igual a 0"
        }
    }

    quit sc
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
