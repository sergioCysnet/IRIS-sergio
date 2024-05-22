/// Comprueba que los datos recibidos sean válidos
Class cysnet.sergio.rules.CheckDatosValidos Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="cysnet.sergio.bp.MiProceso.Context" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Comprobar ObtenerPersona" disabled="false">
<when condition="nombreClase = &quot;ObtenerPersonaRequest&quot;" comment="">
<rule name="Comprobar IdPersona" disabled="false">
<when condition="(objRequ.idPersona!=&quot;&quot;)&amp;&amp;objReq.idPersona &gt; 0" comment="">
<return>1</return>
</when>
</rule>
</when>
</rule>
<rule name="Comprobar CrearPersona" disabled="false">
<when condition="nombreClase = &quot;CrearPersonaRequest&quot;" comment="">
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
