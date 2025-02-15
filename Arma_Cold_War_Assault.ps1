cls
[string] $scriptName = pwd
$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

$adresar_kam="C:\Users\DELL\Documents\zaloha\save_hry\Arma_Cold_War_Assault\"
$exist = Test-Path -Path $adresar_kam
#echo $exist
if ( $exist -ilike "False" ){
echo "chyby cilovy adresar pro zalohu  - $adresar_kam"
sleep 3
Exit
}

$datum = "{0:dd_MM_yyyy-HH_mm_ss}" -f (Get-Date)
$name = "$datum-Arma_Cold_War_Assault.zip"
echo $adresar_kam$name

Compress-Archive -Path "C:\Program Files (x86)\Bohemia Interactive\Arma Cold War Assault\Users" -CompressionLevel Optimal -DestinationPath "$adresar_kam$name"

sleep 3

