<#
.\vboxbak.ps1 -VM 'TESTVM' -Destination D:\Test\TESTVM -Compress -StartAfterBackup -Verbose
#>

[cmdletBinding()]
Param
(
    [Parameter(Mandatory=$true)][String]$VM = "",
    [Parameter(Mandatory=$true)][String]$Destination = "C:\Users\" + $env:UserName + "\Documents\",
    [Switch]$Compress,
    [Switch]$StartAfterBackup
)

function Create-7Zip([String] $aDirectory, [String] $aZipfile){
    [string]$pathToZipExe = "$($Env:ProgramFiles)-Zipz.exe";
    [Array]$arguments = "a", "-tzip", "$aZipfile", "$aDirectory", "-r";
    & $pathToZipExe $arguments;
}

function Get-RunningVirtualBox($VM)
{
    $VBoxManage = 'C:\Program Files\Oracle\VirtualBox\VBoxManage.exe'

    $pinfo = New-Object System.Diagnostics.ProcessStartInfo
    $pinfo.FileName = $VBoxManage
    $pinfo.RedirectStandardError = $true
    $pinfo.RedirectStandardOutput = $true
    $pinfo.UseShellExecute = $false
    $pinfo.Arguments = "list runningvms"
    $p = New-Object System.Diagnostics.Process
    $p.StartInfo = $pinfo
    $p.Start() | Out-Null
    $p.WaitForExit()
    $stdout = $p.StandardOutput.ReadToEnd()
    $stderr = $p.StandardError.ReadToEnd()

    if ($stdout.Contains($VM))
    {
        return $stdout
    }
}

$Date = Get-Date -format "yyyyMMdd"
$VBoxManage = 'C:\Program Files\Oracle\VirtualBox\VBoxManage.exe'
$OVA = "$VM-$Date.ova"

Write-Verbose "Stopping $VM"
Start-Process $VBoxManage -ArgumentList "controlvm $VM acpipowerbutton" -Wait -WindowStyle Hidden

Write-Verbose "Testing if $Destination exists, if not then create it"
if (-Not(Test-Path $Destination))
{
    New-Item -Path $Destination -ItemType Directory
}

Write-Verbose "Checking if $OVA already exists and removing it before beginning"
if (Test-Path $OVA)
{
    Remove-Item $OVA -Force -Verbose:($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent)
}

Write-Verbose "Waiting for $VM to have stopped"
While(Get-RunningVirtualBox($VM))
{
    Start-Sleep -Seconds 1
}

Write-Verbose "Exporting the VM appliance of $VM as $OVA"
Start-Process $VBoxManage -ArgumentList "export $VM -o $OVA" -Wait -WindowStyle Hidden

if ($StartAfterBackup)
{
    Write-Verbose "Starting $VM"
    Start-Process $VBoxManage -ArgumentList "startvm $VM" -Wait -WindowStyle Hidden
}

if ($Compress)
{
    $DestinationCompress = $Destination + "\" + $OVA.Split('.')[0] + ".zip"
   
    Write-Verbose "Checking if $DestinationCompress already exists and removing it before beginning"
    if (Test-Path $DestinationCompress)
    {
        Remove-Item $DestinationCompress -Force -Verbose:($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent)
    }

    Write-Verbose "Starting the compression of $OVA to $DestinationCompress"
    Create-7Zip ($PSScriptRoot + "\" + $OVA) $DestinationCompress

    Write-Verbose "Removing ($PSScriptRoot + "\" + $OVA) because of completed compression"
    Remove-Item ($PSScriptRoot + "\" + $OVA) -Verbose:($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent)
}
else
{
    Write-Verbose "Copying the exported $OVA to $Destination"
    Copy-Item ($PSScriptRoot + "\" + $OVA) -Destination ($Destination + "\" + $OVA) -Verbose:($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent)
}

Write-Verbose "Completed the Backup"
