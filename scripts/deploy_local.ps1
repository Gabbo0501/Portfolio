param(
    [string]$PrivateKey = "$env:USERPROFILE\OneDrive\Documenti\Portfolio\ssh-key-2025-10-10.key",
    [string]$RemoteUser = 'ubuntu',
    [string]$RemoteHost = '129.152.14.247',
    [string]$TarName = 'portfolio-images.tar'
)

Write-Host "Building docker images..."
cd ..\app
docker compose build --pull

Write-Host "Saving images to tar: $TarName"
docker save -o $TarName portfolio-server:latest portfolio-client:latest

Write-Host "Transferring $TarName to $($RemoteUser)@$($RemoteHost):~"
scp -i "$PrivateKey" $TarName "$($RemoteUser)@$($RemoteHost):~"

Write-Host "Done. Uploaded to remote. You can now SSH and run the VM deploy script:"
Write-Host "ssh -i $PrivateKey $RemoteUser@$RemoteHost"
Write-Host "On the VM: bash ~/deploy_vm.sh $TarName"
