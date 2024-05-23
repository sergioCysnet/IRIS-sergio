/// 
Class cysnet.sergio.bp.MiProceso Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='objReq' type='Ens.Request' instantiate='0' />
<property name='nombreClase' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='resultadoRegla' type='%Boolean' initialexpression='0' instantiate='0' />
<property name='destinatario' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1400' >
<assign name="Asignar objReq" property="context.objReq" value="request" action="set" xpos='200' ypos='250' />
<assign name="Asignar nombreClase" property="context.nombreClase" value="request.%ClassName()" action="set" xpos='200' ypos='350' />
<rule name='Check datos válidos' rule='cysnet.sergio.rules.CheckDatosValidos'  resultLocation='context.resultadoRegla' ruleContext='context' xpos='200' ypos='450' >
</rule>
<if name='¿Todo bien?' condition='context.resultadoRegla = 1' xpos='200' ypos='550' xend='200' yend='1300' >
<true>
<switch name='Según mensaje' xpos='470' ypos='700' xend='470' yend='1200' >
<case condition='request.%ClassName() = "CrearPersonaRequest"' name='CrearPersona' >
<call name='Crear Persona' target='DBCache' async='0' xpos='605' ypos='850' >
<request type='cysnet.sergio.msg.CrearPersonaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.sergio.msg.ObtenerPersonaResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<case condition='request.%ClassName() = "ObtenerPersonaRequest"' name='ObtenerPersona' >
<if name='¿ID &gt; 0?' condition='request.idPersona &gt; 0' xpos='875' ypos='850' xend='875' yend='1100' >
<true>
<call name='Obtener Persona' target='DBCache' async='0' xpos='1145' ypos='1000' >
<request type='cysnet.sergio.msg.ObtenerPersonaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.sergio.msg.ObtenerPersonaResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</true>
<false>
<assign name="Mensaje error" property="response.mensaje" value="&quot;El ID debe ser mayor a 0&quot;" action="set" xpos='875' ypos='1000' />
</false>
</if>
</case>
<default name='default' />
</switch>
</true>
<false>
<call name='Enviar email' target='EnviarEmail' async='0' xpos='200' ypos='700' >
<request type='cysnet.sergio.msg.EnviarEmailRequest' >
<assign property="callrequest.asunto" value="&quot;Datos incorrectos&quot;" action="set" />
<assign property="callrequest.mensaje" value="&quot;Los datos recibidos son incorrectos&quot;" action="set" />
<assign property="callrequest.destinatario" value="context.destinatario" action="set" />
</request>
<response type='cysnet.sergio.msg.EnviarEmailResponse' />
</call>
</false>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
