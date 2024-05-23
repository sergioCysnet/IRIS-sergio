Class cysnet.sergio.bs.InSQL Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.SQL.InboundAdapter";

Method OnProcessInput(pInput As EnsLib.SQL.Snapshot, Output pOutput As %RegisteredObject) As %Status
{
    #dim req as cysnet.sergio.msg.AltaPacienteRequest
    #dim rsp As cysnet.sergio.msg.AltaPacienteResponse

    set req = ##class(cysnet.sergio.msg.AltaPacienteRequest).%New()
    set req.idRegistro = pInput.Get("ID")
    set req.idPersona = pInput.Get("IdPersona")
    set req.fechaAlta = pInput.Get("FechaAlta")

    quit ..SendRequestSync("ProcesoAltaPaciente",req,.rsp)
}

}
