Class cysnet.sergio.msg.ObtenerPersonaResponse Extends Ens.Response
{

Property nombre As %String(MAXLEN = "");

Property apellidos As %String(MAXLEN = "");

Property direccion As %String(MAXLEN = "");

Property codPostal As %Integer;

Property mensaje As %String(MAXLEN = "");

Property exito As %Boolean;

Property error As %String(MAXLEN = "");

Storage Default
{
<Data name="ObtenerPersonaResponseDefaultData">
<Subscript>"ObtenerPersonaResponse"</Subscript>
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
<DefaultData>ObtenerPersonaResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
