Class cysnet.sergio.dtl.ADTA01ToCrearPersonaReq Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, cysnet.sergio.wc.MiServicio.req.crearPersonaRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='cysnet.sergio.wc.MiServicio.req.crearPersonaRequest' sourceDocType='2.5:ADT_A01' create='new' language='objectscript' >
<assign value='source.{PID:PatientName(1).GivenName}' property='target.nombre' action='set' />
<assign value='source.{PID:PatientName(1).FamilyName}' property='target.apellidos' action='set' />
<assign value='source.{PID:PatientAddress().StreetAddress}' property='target.direccion' action='set' />
<assign value='source.{PID:PatientAddress().ZiporPostalCode}' property='target.codPostal' action='set' />
</transform>
}

}
