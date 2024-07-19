Class cysnet.sergio.msg.ObtenerPersonaRequest Extends (Ens.Request, %JSON.Adaptor)
{

Property idPersona As %Integer;

Storage Default
{
<Data name="ObtenerPersonaRequestDefaultData">
<Subscript>"ObtenerPersonaRequest"</Subscript>
<Value name="1">
<Value>idPersona</Value>
</Value>
</Data>
<DefaultData>ObtenerPersonaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
