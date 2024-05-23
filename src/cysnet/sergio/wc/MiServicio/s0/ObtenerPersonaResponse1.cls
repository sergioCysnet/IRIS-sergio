/// Creado desde: http://localhost:52773/csp/healthshare/sergio/cysnet.sergio.ws.MiServicio.cls?WSDL
Class cysnet.sergio.wc.MiServicio.s0.ObtenerPersonaResponse1 Extends cysnet.sergio.wc.MiServicio.s0.EnsResponse [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "ObtenerPersonaResponse";

Parameter XMLTYPE = "ObtenerPersonaResponse";

Property nombre As %String(MAXLEN = "", XMLNAME = "nombre");

Property apellidos As %String(MAXLEN = "", XMLNAME = "apellidos");

Property direccion As %String(MAXLEN = "", XMLNAME = "direccion");

Property codPostal As %Integer(XMLNAME = "codPostal");

Property mensaje As %String(MAXLEN = "", XMLNAME = "mensaje");

Property exito As %Boolean(XMLNAME = "exito");

Property error As %String(MAXLEN = "", XMLNAME = "error");

Storage Default
{
<Data name="ObtenerPersonaResponse1State">
<Subscript>"ObtenerPersonaResponse1"</Subscript>
<Value name="1">
<Value>nombre</Value>
</Value>
<Value name="2">
<Value>apellidos</Value>
</Value>
<Value name="3">
<Value>direccion</Value>
</Value>
<Value name="4">
<Value>codPostal</Value>
</Value>
<Value name="5">
<Value>mensaje</Value>
</Value>
<Value name="6">
<Value>exito</Value>
</Value>
<Value name="7">
<Value>error</Value>
</Value>
</Data>
<State>ObtenerPersonaResponse1State</State>
<Type>%Storage.Serial</Type>
}

}
