Class cysnet.sergio.msg.AltaPacienteResponse Extends Ens.Response
{

Property exito As %Boolean;

Property error As %String(MAXLEN = "");

Storage Default
{
<Data name="AltaPacienteResponseDefaultData">
<Subscript>"AltaPacienteResponse"</Subscript>
<Value name="1">
<Value>exito</Value>
</Value>
<Value name="2">
<Value>error</Value>
</Value>
</Data>
<DefaultData>AltaPacienteResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
