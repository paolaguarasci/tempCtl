# $JSONRequest = 'http://192.168.1.113:1380/getsupply'
# $JSONContent = Invoke-WebRequest $JSONRequest | ConvertFrom-Json 
# $volt = $JSONContent.supply
$volt = 10;
$limite = Get-Content "limite.txt"
$data = Get-Date -Format "yyyyMMddHHmmss"
$msg = $data + " " + $volt;
Add-Content log.txt $msg
# Write-EventLog -LogName "Application" -Source "VoltSh" -EventID 3001 -EntryType Information -Message "[LETTURA VOLT]" + $msg;
if ($volt -le $limite) {
  Add-Content log.txt "Spegnimento lettura volt inferiore al limite impostato" 
  # Write-EventLog -LogName "Application" -Source "VoltSh" -EventID 3001 -EntryType Information -Message "Shutdown - lettura volt inferiore al limite impostato"
  # Stop-Computer -ComputerName localhost;
}
