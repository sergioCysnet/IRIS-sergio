Class cysnet.sergio.ws.Rest Extends %CSP.REST
{

Parameter CHARSET = "UTF-8";

Parameter CONVERTINPUTSTREAM = 1;

XData UrlMap
{
<Routes>
	<Route Url="/persona" Method="POST" Call="CrearPersona" />
    <Route Url="/persona/:id" Method="GET" Call="ObtenerPersona" />
</Routes>
}

ClassMethod CrearPersona() As %Status
{
    #dim request as cysnet.sergio.msg.CrearPersonaRequest
    #dim response as cysnet.sergio.msg.CrearPersonaResponse

    try {
        do ##class(%REST.Impl).%SetContentType("application/json")
        if '##class(%REST.Impl).%CheckAccepts("application/json") do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) quit
        
        set bodyJson = %request.Content.Read()
        
        set request = ##class(cysnet.sergio.msg.CrearPersonaRequest).%New()
        do request.%JSONImport(bodyJson)

        set sc = ##class(Ens.Director).CreateBusinessService("InRest", .bs)
        if ($$$ISOK(sc)) {
            set sc = bs.OnProcessInput(request, .response)
            if ($$$ISOK(sc)) {
                do response.%JSONExport()
            }
        }
        if ($$$ISERR(sc)) {
            set response = ##class(cysnet.sergio.msg.CrearPersonaResponse).%New()
            set response.exito = 0
            set response.mensaje = "Ha ocurrido un error: "_$System.Status.GetErrorText(sc)

            do ##class(%REST.Impl).%SetContentType("application/json")
            do ##class(%REST.Impl).%SetStatusCode("400")
            do response.%JSONExport()
        }
    } catch (ex) {
        set response = ##class(cysnet.sergio.msg.CrearPersonaResponse).%New()
        set response.exito = 0
        set response.mensaje = "Ha ocurrido un error: "_ex.DisplayString()

        do ##class(%REST.Impl).%SetContentType("application/json")
        do ##class(%REST.Impl).%SetStatusCode("400")
        do response.%JSONExport()
    }

    quit $$$OK
}

ClassMethod ObtenerPersona(idPersona As %Integer) As %Status
{
    #dim request as cysnet.sergio.msg.ObtenerPersonaRequest
    #dim response as cysnet.sergio.msg.ObtenerPersonaResponse

    try {
        do ##class(%REST.Impl).%SetContentType("application/json")
        if '##class(%REST.Impl).%CheckAccepts("application/json") do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) quit
        
        set request = ##class(cysnet.sergio.msg.ObtenerPersonaRequest).%New()
        set request.idPersona = idPersona

        set sc = ##class(Ens.Director).CreateBusinessService("InRest", .bs)
        if ($$$ISOK(sc)) {
            set sc = bs.OnProcessInput(request, .response)
            if ($$$ISOK(sc)) {
                do response.%JSONExport()
            }
        }
        if ($$$ISERR(sc)) {
            set response = ##class(cysnet.sergio.msg.CrearPersonaResponse).%New()
            set response.exito = 0
            set response.mensaje = "Ha ocurrido un error: "_$System.Status.GetErrorText(sc)

            do ##class(%REST.Impl).%SetContentType("application/json")
            do ##class(%REST.Impl).%SetStatusCode("400")
            do response.%JSONExport()
        }


    } catch (ex) {
        set response = ##class(cysnet.sergio.msg.CrearPersonaResponse).%New()
        set response.exito = 0
        set response.mensaje = "Ha ocurrido un error: "_ex.DisplayString()

        do ##class(%REST.Impl).%SetContentType("application/json")
        do ##class(%REST.Impl).%SetStatusCode("400")
        do response.%JSONExport()
    }

    quit $$$OK
}

}
