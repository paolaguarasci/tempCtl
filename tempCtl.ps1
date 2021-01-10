$JSONRequest = 'http://192.168.1.113:1380/getsupply'
$JSONContent = Invoke-WebRequest $JSONRequest | ConvertFrom-Json 
$temp = $JSONContent.supply
$limite = Get-Content "limite.txt"
if ($temp -ge $limite) {
  Write-Host 'Temperatura maggiore di ';
  Write-Host $limite;
  Write-Host '... spegnimento...';
  Stop-Computer -ComputerName localhost;
}
