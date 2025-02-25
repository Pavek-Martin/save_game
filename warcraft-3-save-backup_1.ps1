# Windows 10 PoweShell ver. 1.0

Clear-Host #cls
[string] $scriptName = pwd
$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

#-------------------------- edit zona ------------------------------------
$adresar_kde_je_hra = "C:\Program Files (x86)\Warcraft III\save" # adresar kde je hra
$adresar_kam = "C:\Users\DELL\Documents\zaloha\save_hry\warcraft_3\" # kam se bude zalohovat
#----------------------- konec edit zona ---------------------------------

$exist = Test-Path -Path $adresar_kam
#echo $exist
if ( $exist -ilike "False" ){
echo "chyby cilovy adresar pro zalohu  - $adresar_kam"
# tady by moch este ten adesar udelat automaticky pokud chybi
sleep 3
Exit
}

$datum = "{0:dd_MM_yyyy-HH_mm_ss}" -f (Get-Date) # datum ve tvaru den_mesic_rok_hodina_minuta_vterina
$name="$datum-warcraft-3_save-backup.zip" # nazev souboru (archivu) zalohy + prefix datum, popsani o radek visse
echo $adresar_kam$name # plan cesta pro backup + filename

$hvezdicka = "*" # hvezdicka, nahradni znak za jakykoliv nazev souboru (a vlastne i adresar, pouze soubor by byla maska *.* )
# C:\Users\DELL\Documents\zaloha\save_hry\warcraft_3\*
# vznikne tim toto ^^^^ tzn. vymaz vse v adrasari "C:\Users\DELL\Documents\zaloha\save_hry\warcraft_3\"

echo "mazu stare zalohy $adresar_kam"
Remove-Item -Path $adresar_kam$hvezdicka -Force # maze vse stary v ceste "C:\Users\DELL\Documents\zaloha\save_hry\warcraft_3\"
sleep 2

Compress-Archive -Path $adresar_kde_je_hra -CompressionLevel Optimal -DestinationPath $adresar_kam$name
sleep 3

# c:\Users\DELL\AppData\Local\VirtualStore\Program Files (x86)\Warcraft III\save\
# nejky save data sjou pak jeste i tady ???

