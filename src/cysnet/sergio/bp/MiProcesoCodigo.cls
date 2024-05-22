Class cysnet.sergio.bp.MiProcesoCodigo Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As cysnet.sergio.msg.ObtenerPersonaRequest, Output pResponse As cysnet.sergio.msg.ObtenerPersonaResponse) As %Status
{
    #dim sc As %Status = $$$OK

    set pResponse = ##class(cysnet.sergio.msg.ObtenerPersonaResponse).%New()

    if (pRequest.idPersona > 0) {
        do ..SendRequestSync("DBCache", pRequest, .pResponse)
    } else {
        set pResponse.mensaje = "El id de persona no puede ser menor o igual a 0"
    }

    quit sc
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
