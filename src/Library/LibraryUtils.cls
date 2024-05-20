Class Library.LibraryUtils Extends %RegisteredObject
{

ClassMethod AddBook() As %Status
{
    set book = ##class(Library.Book).%New()

    read #!!,"Please enter the book title: ",name
    set book.Title = name

    read !,"Please enter the name of the author: ",author
    &sql(SELECT id INTO :id FROM library.person WHERE Name = :author)
    if (id '= ""){
        set book.Author = ##class(Library.Person).%OpenId(id)
    }
    else{
        set newAuthor = ##class(Library.Person).%New()
        set newAuthor.Name = author
        set book.Author = newAuthor
        set statusPerson = newAuthor.%Save()
    }

    read !,"Please enter a 1 for Non-Fiction or a 2 for Fiction: ",genre
    if genre = "1" {
        set book.Genre = "NonFiction"
    }
    else{
        set book.Genre = "Fiction"
    }

    set status = book.%Save()

    return status
}

ClassMethod AddFriend() As %Status
{
    set friend = ##class(Library.Person).%New()

    read #!!,"Please enter the name of your new friend: ",name
    set friend.Name = name

    read #!!,"Please enter the phone number of your new friend: ",phoneNum
    set friend.PhoneNumber = phoneNum

    set status = friend.%Save()
    return status
}

ClassMethod PrintOne(id As %String) As %Status
{
    set book = ##class(Library.Book).%OpenId(id)

    write !,"This book is called ", book.Title," and was written by ", book.Author.Name,"."
    write !,"This is a ",book.Genre," book."

    if book.Friend = ""{
        write !,"This book is currently in the library."
    }
    else{
        write !,"This book is currently on loan to ",book.Friend.Name,"."
    }

    return $$$OK
}

ClassMethod PrintAll() As %Status
{
    &sql(select count(*) INTO :count from library.book)

    set id = 1

    WHILE (id <= count) {
        write !,"Book at ID ",id, ": "
        do ##class(Library.LibraryUtils).PrintOne(id)
        set id = id + 1
    }

    return $$$OK
}

ClassMethod LoanBook(bookID As %String, friend As %String) As %Status
{
    set check = ##class(Library.Book).%OpenId(bookID)

    if (check.Friend '= ""){
        write !,"This book is currently on loan.",!,"Please use the ReturnBook method to return the book before loaning it to a new friend."
        quit $$$OK
    }
    else{
        &sql(SELECT id INTO :id FROM library.person WHERE name = :friend)
        if (id = ""){
            write !,"This friend is not registered.",!,"Please use the AddFriend method to add a new friend."    
            quit $$$OK
        }
        else{
            set friend = ##class(Library.Person).%OpenId(id)
            set check.Friend = friend
            write !,"Book loaned to ",friend.Name,"."
            set status = check.%Save()
        }
    }

    return $$$OK
}

}
