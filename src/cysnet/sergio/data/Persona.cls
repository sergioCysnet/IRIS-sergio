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
    
    #dim id AS %Integer = 0
    write sexo
    if ((sexo '= "M")&&(sexo '= "F")){
        write "Sexo no válido"
        write !,"-1"

        quit $$$OK
    }

    set p= ##class(cysnet.sergio.data.Persona).%New()

    set p.nombre = nombre
    set p.apellidos = apellidos
    set p.sexo = sexo
    set p.fechaNacimiento = fechaNacimiento
    do p.%Save()

    write p.%Id()

    quit $$$OK
}

ClassMethod modificarPersona(id As %Integer, nombre As %String, apellidos As %String, sexo As %String, fechaNacimiento As %String) As %Integer
{
    #dim existe As %Integer  = 0

    &sql(SELECT 1 INTO :existe FROM cysnet_sergio_data.Persona WHERE id = :id)
    if (existe '= 1){
        write "La persona con ID "_id_" no existe"
        write !,"-1"

        quit $$$OK
    }
    if ((sexo '= "M")&&(sexo '= "F")){
        write "Sexo no válido"
        write !,"-1"

        quit $$$OK
    }

    set p= ##class(cysnet.sergio.data.Persona).%OpenId(id)

    set p.nombre = nombre
    set p.apellidos = apellidos
    set p.sexo = sexo
    set p.fechaNacimiento = $ZDATEH(fechaNacimiento,3)
    do p.%Save()

    write p.%Id()
    
    quit $$$OK
}

ClassMethod eliminarPersona(id As %Integer) As %Status
{
    #dim existe = 0

    &sql(SELECT 1 INTO :existe FROM cysnet_sergio_data.Persona WHERE id = :id)
    if (existe '= 1){
        write "La persona con ID "_id_" no existe"

        quit $$$OK
    }

    &sql(DELETE FROM cysnet_sergio_data.Persona WHERE id = :id)

    write "Persona con ID "_id_" eliminada correctamente"

    quit $$$OK
}

ClassMethod mostrarPersona(id As %Integer) As %Status
{
    #dim existe As %Integer = 0

    &sql(SELECT 1 INTO :existe FROM cysnet_sergio_data.Persona WHERE id = :id)

    if (existe '= 1){
        write !,"La persona con ID "_id_" no existe"
        quit $$$OK
    }
    
    set p= ##class(cysnet.sergio.data.Persona).%OpenId(id)
    write p.%Id()
    write !,p.nombre
    write !,p.apellidos
    write !,p.sexo
    write !,$ZDATE(p.fechaNacimiento,4)

    quit $$$OK
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
<IdLocation>^cysnet.sergio.data.PersonaD</IdLocation>
<IndexLocation>^cysnet.sergio.data.PersonaI</IndexLocation>
<StreamLocation>^cysnet.sergio.data.PersonaS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
