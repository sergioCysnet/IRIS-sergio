Class cysnet.sergio.wc.MiServicio.bo.MiServicioSoap Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method crearPersona(pRequest As cysnet.sergio.wc.MiServicio.req.crearPersonaRequest, Output pResponse As cysnet.sergio.wc.MiServicio.rsp.crearPersonaResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "cysnet.sergio.wc.MiServicio.MiServicioSoap"
 Set tSC = ..Adapter.InvokeMethod("crearPersona",.crearPersonaResult,pRequest.nombre,pRequest.apellidos,pRequest.direccion,pRequest.codPostal)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.crearPersonaResult=$get(crearPersonaResult)
 Quit $$$OK
}

Method obtenerPersona(pRequest As cysnet.sergio.wc.MiServicio.req.obtenerPersonaRequest, Output pResponse As cysnet.sergio.wc.MiServicio.rsp.obtenerPersonaResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "cysnet.sergio.wc.MiServicio.MiServicioSoap"
 Set tSC = ..Adapter.InvokeMethod("obtenerPersona",.obtenerPersonaResult,pRequest.idPer)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.obtenerPersonaResult=$get(obtenerPersonaResult)
 Quit $$$OK
}

Method saludo(pRequest As cysnet.sergio.wc.MiServicio.req.saludoRequest, Output pResponse As cysnet.sergio.wc.MiServicio.rsp.saludoResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "cysnet.sergio.wc.MiServicio.MiServicioSoap"
 Set tSC = ..Adapter.InvokeMethod("saludo",.saludoResult,pRequest.nombre)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.saludoResult=$get(saludoResult)
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="cysnet.sergio.wc.MiServicio.req.crearPersonaRequest">
		<Method>crearPersona</Method>
	</MapItem>
	<MapItem MessageType="cysnet.sergio.wc.MiServicio.req.obtenerPersonaRequest">
		<Method>obtenerPersona</Method>
	</MapItem>
	<MapItem MessageType="cysnet.sergio.wc.MiServicio.req.saludoRequest">
		<Method>saludo</Method>
	</MapItem>
</MapItems>
}

}
