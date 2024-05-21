Class cysnet.sergio.ws.MiServicio Extends EnsLib.SOAP.Service [ ProcedureBlock ]
{

/// Nombre de servicio web.
Parameter SERVICENAME = "MiServicio";

/// Namespace SOAP para servicio web
Parameter NAMESPACE = "http://tempuri.org";

/// Se utilizarán namespaces de clases referenciadas en WSDL.
Parameter USECLASSNAMESPACES = 1;

Method saludo(nombre As %String) As %String [ WebMethod ]
{
	Quit "Hola, "_nombre_"!"
}

Method obtenerPersona(idPer As %Integer) As cysnet.sergio.msg.ObtenerPersonaResponse [ WebMethod ]
{
	#dim req As cysnet.sergio.msg.ObtenerPersonaRequest
	#dim rsp As cysnet.sergio.msg.ObtenerPersonaResponse
	
	set req = ##class(cysnet.sergio.msg.ObtenerPersonaRequest).%New()
	set req.idPersona = idPer
	
	do ..SendRequestSync("MiProcesoCodigo", req, .rsp)
	
	quit rsp
}

}
