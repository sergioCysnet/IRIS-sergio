/// 
Class cysnet.sergio.rules.HL7RoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="" production="cysnet.sergio.MiProduccion">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Enrutar mensajes ADT^A01" disabled="false">
<constraint name="source" value="InFileHL7"></constraint>
<constraint name="docCategory" value="2.5"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="1" comment="">
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
