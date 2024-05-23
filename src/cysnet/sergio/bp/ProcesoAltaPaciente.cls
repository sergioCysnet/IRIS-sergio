/// 
Class cysnet.sergio.bp.ProcesoAltaPaciente Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='cysnet.sergio.msg.AltaPacienteRequest' response='cysnet.sergio.msg.AltaPacienteResponse' height='2000' width='2000' >
<sequence xend='200' yend='350' >
<call name='ObtenerPersona' target='MiServicioSoap' async='0' xpos='200' ypos='250' >
<request type='cysnet.sergio.wc.MiServicio.req.obtenerPersonaRequest' >
<assign property="callrequest.idPer" value="request.idPersona" action="set" />
</request>
<response type='cysnet.sergio.wc.MiServicio.rsp.obtenerPersonaResponse' />
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
