Class cysnet.sergio.data.Persona Extends (%Persistent, %Populate)
{

Property nombre As %String(POPSPEC = "FirstName()");

Property apellidos As %String(POPSPEC = "LastName()");

Property sexo As %String(VALUELIST = "-M-F");

Property fechaNacimiento As %String(POPSPEC = "CDate(4,30000,$H)");

Property direccion As %String(POPSPEC = "Street()");

Property codPostal As %Integer(POPSPEC = "USZip()");

ClassMethod altaPersona(nombre As %String, apellidos As %String, sexo As %String, fechaNacimiento As %String) As %Status
{
    #dim sc As %Status = $$$OK

    #dim id AS %Integer = 0
    write sexo
    if ((sexo '= "M")&&(sexo '= "F")){
        write "Sexo no válido"
        write !,"-1"

        quit sc
    }

    set p= ##class(cysnet.sergio.data.Persona).%New()

    set p.nombre = nombre
    set p.apellidos = apellidos
    set p.sexo = sexo
    set p.fechaNacimiento = fechaNacimiento
    do p.%Save()

    write p.%Id()

    quit sc
}

ClassMethod modificarPersona(id As %Integer, nombre As %String, apellidos As %String, sexo As %String, fechaNacimiento As %String) As %Integer
{
    #dim sc As %Status = $$$OK
    #dim existe As %Integer  = 0

    &sql(SELECT 1 INTO :existe FROM cysnet_sergio_data.Persona WHERE id = :id)
    if (existe '= 1){
        write "La persona con ID "_id_" no existe"
        write !,"-1"

        quit sc
    }
    if ((sexo '= "M")&&(sexo '= "F")){
        write "Sexo no válido"
        write !,"-1"

        quit sc
    }

    set p= ##class(cysnet.sergio.data.Persona).%OpenId(id)

    set p.nombre = nombre
    set p.apellidos = apellidos
    set p.sexo = sexo
    set p.fechaNacimiento = $ZDATEH(fechaNacimiento,3)
    do p.%Save()

    write p.%Id()
    
    quit sc
}

ClassMethod eliminarPersona(id As %Integer) As %Status
{
    #dim sc As %Status = $$$OK
    #dim existe = 0

    &sql(SELECT 1 INTO :existe FROM cysnet_sergio_data.Persona WHERE id = :id)
    if (existe '= 1){
        write "La persona con ID "_id_" no existe"

        quit sc
    }

    &sql(DELETE FROM cysnet_sergio_data.Persona WHERE id = :id)

    write "Persona con ID "_id_" eliminada correctamente"

    quit sc
}

ClassMethod mostrarPersona(id As %Integer) As %Status
{
    #dim sc As %Status = $$$OK
    #dim existe As %Integer = 0

    &sql(SELECT 1 INTO :existe FROM cysnet_sergio_data.Persona WHERE id = :id)

    if (existe '= 1){
        write !,"La persona con ID "_id_" no existe"
        quit sc
    }
    
    set p= ##class(cysnet.sergio.data.Persona).%OpenId(id)
    write p.%Id()
    write !,p.nombre
    write !,p.apellidos
    write !,p.sexo
    write !,$ZDATE(p.fechaNacimiento,4)

    quit sc
}

Storage Default
{
<Data name="PersonaDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>nombre</Value>
</Value>
<Value name="3">
<Value>apellidos</Value>
</Value>
<Value name="4">
<Value>sexo</Value>
</Value>
<Value name="5">
<Value>fechaNacimiento</Value>
</Value>
<Value name="6">
<Value>direccion</Value>
</Value>
<Value name="7">
<Value>codPostal</Value>
</Value>
</Data>
<DataLocation>^cysnet.sergio.data.PersonaD</DataLocation>
<DefaultData>PersonaDefaultData</DefaultData>
<ExtentSize>12</ExtentSize>
<IdLocation>^cysnet.sergio.data.PersonaD</IdLocation>
<IndexLocation>^cysnet.sergio.data.PersonaI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="apellidos">
<AverageFieldSize>8.08</AverageFieldSize>
<Selectivity>8.3333%</Selectivity>
</Property>
<Property name="codPostal">
<AverageFieldSize>2.17</AverageFieldSize>
<OutlierSelectivity>.916667:</OutlierSelectivity>
<Selectivity>8.3333%</Selectivity>
</Property>
<Property name="direccion">
<AverageFieldSize>3.25</AverageFieldSize>
<OutlierSelectivity>.916667:</OutlierSelectivity>
<Selectivity>8.3333%</Selectivity>
</Property>
<Property name="fechaNacimiento">
<AverageFieldSize>8.5</AverageFieldSize>
<Selectivity>9.0909%</Selectivity>
</Property>
<Property name="nombre">
<AverageFieldSize>7.25</AverageFieldSize>
<Selectivity>8.3333%</Selectivity>
</Property>
<Property name="sexo">
<AverageFieldSize>2.83</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^cysnet.sergio.data.PersonaS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
