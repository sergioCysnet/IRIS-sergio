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
</Production>
}

}
