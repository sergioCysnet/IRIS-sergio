Class cysnet.sergio.wc.MiServicio.req.crearPersonaRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "cysnet.sergio.wc.MiServicio.rsp.crearPersonaResponse";

Property nombre As %String;

Property apellidos As %String;

Property direccion As %String;

Property codPostal As %String;

Storage Default
{
<Data name="crearPersonaRequestDefaultData">
<Subscript>"crearPersonaRequest"</Subscript>
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
</Data>
<DefaultData>crearPersonaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
