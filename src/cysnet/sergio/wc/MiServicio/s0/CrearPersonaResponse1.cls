/// Creado desde: http://localhost:52773/csp/healthshare/sergio/cysnet.sergio.ws.MiServicio.cls?WSDL
Class cysnet.sergio.wc.MiServicio.s0.CrearPersonaResponse1 Extends cysnet.sergio.wc.MiServicio.s0.EnsResponse [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "CrearPersonaResponse";

Parameter XMLTYPE = "CrearPersonaResponse";

Property mensaje As %String(MAXLEN = "", XMLNAME = "mensaje");

Property exito As %Boolean(XMLNAME = "exito");

Property error As %String(MAXLEN = "", XMLNAME = "error");

Storage Default
{
<Data name="CrearPersonaResponse1State">
<Subscript>"CrearPersonaResponse1"</Subscript>
<Value name="1">
<Value>mensaje</Value>
</Value>
<Value name="2">
<Value>exito</Value>
</Value>
<Value name="3">
<Value>error</Value>
</Value>
</Data>
<State>CrearPersonaResponse1State</State>
<Type>%Storage.Serial</Type>
}

}
