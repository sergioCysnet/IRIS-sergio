Class cysnet.sergio.dtl.InfoAltaPacienteToADTA03 Extends Ens.DataTransformDTL [ DependsOn = (cysnet.sergio.msg.struct.InfoAltaPaciente, EnsLib.HL7.Message) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='cysnet.sergio.msg.struct.InfoAltaPaciente' targetClass='EnsLib.HL7.Message' targetDocType='2.5:ADT_A03' create='new' language='objectscript' >
<assign value='source.idPersona' property='target.{PID:PatientID.IDNumber}' action='set' />
<assign value='source.nombre' property='target.{PID:PatientName(1).GivenName}' action='set' />
<assign value='source.apellidos' property='target.{PID:PatientName(1).FamilyName}' action='set' />
<assign value='source.fechaAlta' property='target.{PV1:DischargeDateTime(1)}' action='set' />
</transform>
}

}
