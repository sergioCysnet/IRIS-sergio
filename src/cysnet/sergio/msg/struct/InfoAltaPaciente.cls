Class cysnet.sergio.msg.struct.InfoAltaPaciente Extends (%SerialObject, %XML.Adaptor)
{

Property idPersona As %BigInt;

Property fechaAlta As %TimeStamp;

Property nombre As %String(MAXLEN = "");

Property apellidos As %String(MAXLEN = "");

Storage Default
{
<Data name="InfoAltaPacienteState">
<Value name="1">
<Value>idPersona</Value>
</Value>
<Value name="2">
<Value>fechaAlta</Value>
</Value>
<Value name="3">
<Value>nombre</Value>
</Value>
<Value name="4">
<Value>apellidos</Value>
</Value>
</Data>
<State>InfoAltaPacienteState</State>
<StreamLocation>^cysnet.serg64D.InfoAltaPacD889S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
