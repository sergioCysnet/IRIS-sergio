Class cysnet.sergio.msg.AltaPacienteRequest Extends Ens.Request
{

Property idRegistro As %BigInt;

Property idPersona As %BigInt;

Property fechaAlta As %TimeStamp;

Storage Default
{
<Data name="AltaPacienteRequestDefaultData">
<Subscript>"AltaPacienteRequest"</Subscript>
<Value name="1">
<Value>idRegistro</Value>
</Value>
<Value name="2">
<Value>idPersona</Value>
</Value>
<Value name="3">
<Value>fechaAlta</Value>
</Value>
</Data>
<DefaultData>AltaPacienteRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
