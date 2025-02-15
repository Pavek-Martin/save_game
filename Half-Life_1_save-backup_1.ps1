cls
[string] $scriptName = pwd
$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

$adresar_kam="C:\Users\DELL\Documents\zaloha\save_hry\Half-Life_1\"
$exist = Test-Path -Path $adresar_kam
#echo $exist
if ( $exist -ilike "False" ){
echo "chyby cilovy adresar pro zalohu  - $adresar_kam"
Timeout /t 3
Exit
}

$datum = "{0:dd_MM_yyyy-HH_mm_ss}" -f (Get-Date)

$name="$datum-Half-Life_1_save-backup_1.zip"

echo $adresar_kam$name

Compress-Archive -Path "c:\Users\DELL\AppData\Local\VirtualStore\Program Files (x86)\Valve\Half-Life\valve\" -CompressionLevel Optimal -DestinationPath "$adresar_kam$name"
Start-Sleep -Seconds 3

# c:\Users\DELL\AppData\Local\VirtualStore\Program Files (x86)\Valve\Half-Life\valve\ 
