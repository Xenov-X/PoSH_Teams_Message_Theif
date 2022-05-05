$firstString = "<div"
$secondString = "div>"

$importPath = "$Env:AppData\Microsoft\Teams\IndexedDB\https_teams.microsoft.com_0.indexeddb.leveldb\*.log"

$text = Get-Content $importPath

#Sample pattern
$pattern = "(?<=$firstString).*?(?=$secondString)"

$output = [regex]::Matches($text,$pattern).value

$hash = @{} 
echo $output | %{if($hash.$_ -eq $null) { $_ }; $hash.$_ = 1} 
