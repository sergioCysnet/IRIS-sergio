Class cysnet.sergio.wc.MiServicio.MiServicioSoap Extends %SOAP.WebClient [ ProcedureBlock ]
{

/// This is the URL used to access the web service.
Parameter LOCATION = "http://localhost:52773/csp/healthshare/sergio/cysnet.sergio.ws.MiServicio.cls";

/// This is the namespace used by the Service
Parameter NAMESPACE = "http://tempuri.org";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// Determines handling of Security header.
Parameter SECURITYIN = "ALLOW";

/// This is the name of the Service
Parameter SERVICENAME = "MiServicio";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.1;

Method crearPersona(nombre As %String, apellidos As %String, direccion As %String, codPostal As %String) As cysnet.sergio.wc.MiServicio.s0.CrearPersonaResponse1 [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("crearPersona").Invoke($this,"http://tempuri.org/cysnet.sergio.ws.MiServicio.crearPersona",.nombre,.apellidos,.direccion,.codPostal)
}

Method obtenerPersona(idPer As %Integer) As cysnet.sergio.wc.MiServicio.s0.ObtenerPersonaResponse1 [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("obtenerPersona").Invoke($this,"http://tempuri.org/cysnet.sergio.ws.MiServicio.obtenerPersona",.idPer)
}

Method saludo(nombre As %String) As %String [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("saludo").Invoke($this,"http://tempuri.org/cysnet.sergio.ws.MiServicio.saludo",.nombre)
}

}
