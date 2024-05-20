Class Library.Book Extends (%Persistent, %Populate, %XML.Adaptor, %ZEN.DataModel.Adaptor)
{

Property Title As %String [ Required ];

Property Genre As %String;

Property Author As Library.Person;

Property Friend As Library.Person;

Storage Default
{
<Data name="BookDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Title</Value>
</Value>
<Value name="3">
<Value>Genre</Value>
</Value>
<Value name="4">
<Value>Author</Value>
</Value>
<Value name="5">
<Value>Friend</Value>
</Value>
</Data>
<DataLocation>^Library.BookD</DataLocation>
<DefaultData>BookDefaultData</DefaultData>
<IdLocation>^Library.BookD</IdLocation>
<IndexLocation>^Library.BookI</IndexLocation>
<StreamLocation>^Library.BookS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
