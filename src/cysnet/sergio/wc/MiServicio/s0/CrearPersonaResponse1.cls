/// Creado desde: http://localhost:52773/csp/healthshare/sergio/cysnet.sergio.ws.MiServicio.cls?WSDL
Class cysnet.sergio.wc.MiServicio.s0.CrearPersonaResponse1 Extends cysnet.sergio.wc.MiServicio.s0.EnsResponse [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "CrearPersonaResponse";

Parameter XMLTYPE = "CrearPersonaResponse";

Property mensaje As %String(MAXLEN = "", XMLNAME = "mensaje");

Storage Default
{
<Data name="CrearPersonaResponse1State">
<Subscript>"CrearPersonaResponse1"</Subscript>
<Value name="1">
<Value>mensaje</Value>
</Value>
</Data>
<State>CrearPersonaResponse1State</State>
<Type>%Storage.Serial</Type>
}

}
