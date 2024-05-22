Class cysnet.sergio.wc.MiServicio.req.obtenerPersonaRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "cysnet.sergio.wc.MiServicio.rsp.obtenerPersonaResponse";

Property idPer As %Integer;

Storage Default
{
<Data name="obtenerPersonaRequestDefaultData">
<Subscript>"obtenerPersonaRequest"</Subscript>
<Value name="1">
<Value>idPer</Value>
</Value>
</Data>
<DefaultData>obtenerPersonaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
