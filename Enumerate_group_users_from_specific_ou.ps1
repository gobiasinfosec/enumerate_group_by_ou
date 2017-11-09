import-module activedirectory

$OU      = "*OU=*"
$Group   = "group_name"
$outfile = "C:\temp\output.csv"

$users = Get-ADUser -filter * | Where-Object{$_.DistinguishedName -like $ou }| Select-Object DistinguishedName, SamAccountName
$members = Get-ADGroup $Group -Properties Member | Select -ExpandProperty Member

foreach($user in $users)
    {
    If ($members -contains $user.DistinguishedName)
        {
        Add-Content $outfile "`"$($user.SamAccountName)`""
        }
    }
