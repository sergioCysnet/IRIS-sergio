/// Comprueba que los datos recibidos sean válidos
Class cysnet.sergio.rules.CheckDatosValidos Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="cysnet.sergio.bp.MiProceso.Context" production="">
<variable name="cysnet"></variable>
<variable name="gmail"></variable>
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Comprobar ObtenerPersona" disabled="false">
<when condition="nombreClase = &quot;ObtenerPersonaRequest&quot;" comment="">
<assign property="destinatario" value="&quot;sergio@cysnet.es&quot;"></assign>
<rule name="Comprobar IdPersona" disabled="false">
<when condition="(objReq.idPersona!=&quot;&quot;)&amp;&amp;objReq.idPersona&gt;0" comment="">
<return>1</return>
</when>
</rule>
</when>
</rule>
<rule name="Comprobar CrearPersona" disabled="false">
<when condition="nombreClase = &quot;CrearPersonaRequest&quot;" comment="">
<assign property="destinatario" value="&quot;sergiokatas@gmail.com&quot;"></assign>
<rule name="Comprobar nombre y apellidos" disabled="false">
<when condition="((objReq.nombre!=&quot;&quot;)&amp;&amp;((Length(objReq.nombre,))&gt;1))&amp;&amp;objReq.apellidos!=&quot;&quot;&amp;&amp;(Length(objReq.apellidos,))&gt;1" comment="">
<return>1</return>
</when>
</rule>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
