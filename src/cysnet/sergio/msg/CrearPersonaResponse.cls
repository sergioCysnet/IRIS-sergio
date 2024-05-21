Class cysnet.sergio.msg.CrearPersonaResponse Extends Ens.Response
{

Property mensaje As %String(MAXLEN = "");

Storage Default
{
<Data name="CrearPersonaResponseDefaultData">
<Subscript>"CrearPersonaResponse"</Subscript>
<Value name="1">
<Value>mensaje</Value>
</Value>
</Data>
<DefaultData>CrearPersonaResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
