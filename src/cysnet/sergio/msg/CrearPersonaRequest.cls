Class cysnet.sergio.msg.CrearPersonaRequest Extends Ens.Request
{

Property nombre As %String(MAXLEN = "");

Property apellidos As %String(MAXLEN = "");

Property direccion As %String(MAXLEN = "");

Property codPostal As %Integer;

Storage Default
{
<Data name="CrearPersonaRequestDefaultData">
<Subscript>"CrearPersonaRequest"</Subscript>
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
<DefaultData>CrearPersonaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
