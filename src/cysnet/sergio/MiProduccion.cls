Class cysnet.sergio.MiProduccion Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="cysnet.sergio.MiProduccion" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="MiServicio" Category="" ClassName="cysnet.sergio.ws.MiServicio" PoolSize="1" Enabled="true" Foreground="false" Comment="Servicio SOAP de entrada" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">1981</Setting>
  </Item>
  <Item Name="DBCache" Category="" ClassName="cysnet.sergio.bo.DBCache" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="MiProceso" Category="" ClassName="cysnet.sergio.bp.MiProceso" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="MiProcesoCodigo" Category="" ClassName="cysnet.sergio.bp.MiProcesoCodigo" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="InFileHL7" Category="" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/shared/HL7/out/</Setting>
    <Setting Target="Adapter" Name="FilePath">/shared/HL7/in/</Setting>
    <Setting Target="Adapter" Name="WorkPath">/shared/HL7/proc/</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Host" Name="TargetConfigNames">HL7RoutingProcess</Setting>
    <Setting Target="Host" Name="DefCharEncoding">utf-8</Setting>
  </Item>
  <Item Name="HL7RoutingProcess" Category="" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cysnet.sergio.rules.HL7RoutingRule</Setting>
    <Setting Target="Host" Name="ResponseFrom">MiServicioSoap</Setting>
  </Item>
  <Item Name="MiServicioSoap" Category="" ClassName="cysnet.sergio.wc.MiServicio.bo.MiServicioSoap" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="WebServiceURL">http://localhost:1981/csp/healthshare/sergio/cysnet.sergio.ws.MiServicio.cls</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="Ens.Alert" Category="" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="IncludeDetails">1</Setting>
    <Setting Target="Adapter" Name="Credentials">CuentaGmail</Setting>
    <Setting Target="Adapter" Name="From">sergiokatas@gmail.com</Setting>
    <Setting Target="Adapter" Name="Recipient">sergio@cysnet.es</Setting>
    <Setting Target="Adapter" Name="SMTPPort">587</Setting>
    <Setting Target="Adapter" Name="SMTPServer">smtp.gmail.com</Setting>
    <Setting Target="Adapter" Name="SSLConfig">ISC.FeatureTracker.SSL.Config*</Setting>
  </Item>
  <Item Name="EnviarEmail" Category="" ClassName="cysnet.sergio.bo.EnviarEmail" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="Credentials">CuentaGmail</Setting>
    <Setting Target="Adapter" Name="From">sergiokatas@gmail.com</Setting>
    <Setting Target="Adapter" Name="Recipient">sergiopeje@gmail.es</Setting>
    <Setting Target="Adapter" Name="SMTPPort">587</Setting>
    <Setting Target="Adapter" Name="SMTPServer">smtp.gmail.com</Setting>
    <Setting Target="Adapter" Name="SSLConfig">ISC.FeatureTracker.SSL.Config*</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
  </Item>
</Production>
}

}
