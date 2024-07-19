Class cysnet.sergio.bs.InRest Extends Ens.BusinessService
{

Method OnProcessInput(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
    quit ..SendRequestSync("MySQLOp", pRequest, .pResponse)
}

}
