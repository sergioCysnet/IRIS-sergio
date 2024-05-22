Class cysnet.sergio.wc.MiServicio.req.saludoRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "cysnet.sergio.wc.MiServicio.rsp.saludoResponse";

Property nombre As %String;

Storage Default
{
<Data name="saludoRequestDefaultData">
<Subscript>"saludoRequest"</Subscript>
<Value name="1">
<Value>nombre</Value>
</Value>
</Data>
<DefaultData>saludoRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
