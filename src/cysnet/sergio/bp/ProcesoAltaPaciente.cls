/// 
Class cysnet.sergio.bp.ProcesoAltaPaciente Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='cysnet.sergio.msg.AltaPacienteRequest' response='cysnet.sergio.msg.AltaPacienteResponse' height='2000' width='2000' >
<context>
<property name='infoAltaP' type='cysnet.sergio.msg.struct.InfoAltaPaciente' instantiate='0' />
<property name='mensajeHL7' type='EnsLib.HL7.Message' instantiate='0' />
</context>
<sequence xend='200' yend='750' >
<assign name="Asignar idPersona" property="context.infoAltaP.idPersona" value="request.idPersona" action="set" xpos='200' ypos='250' />
<assign name="Asignar fechaAlta" property="context.infoAltaP.fechaAlta" value="request.fechaAlta" action="set" xpos='200' ypos='350' />
<call name='ObtenerPersona' target='MiServicioSoap' async='0' xpos='200' ypos='450' >
<request type='cysnet.sergio.wc.MiServicio.req.obtenerPersonaRequest' >
<assign property="callrequest.idPer" value="request.idPersona" action="set" />
</request>
<response type='cysnet.sergio.wc.MiServicio.rsp.obtenerPersonaResponse' >
<assign property="context.infoAltaP.nombre" value="callresponse.obtenerPersonaResult.nombre" action="set" />
<assign property="context.infoAltaP.apellidos" value="callresponse.obtenerPersonaResult.apellidos" action="set" />
</response>
</call>
<transform name='Transformar' class='cysnet.sergio.dtl.InfoAltaPacienteToADTA03' source='context.infoAltaP' target='context.mensajeHL7' xpos='200' ypos='550' />
<call name='Enviar HL7' target='OutFileHL7' async='0' xpos='200' ypos='650' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.mensajeHL7" action="set" />
</request>
<response type='EnsLib.HL7.Message' />
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
