param ( [parameter(mandatory=$true)][string]$system,
        [parameter(mandatory=$true)][string]$Disk,
        [parameter(mandatory=$true)][string]$Network )


Write-Output "The System variable contains '$system'."
Write-Output "The Disk variable contains '$Disk'."
Write-Output "The Network Variable contains '$Network'."

if ( $system -like "True" ) {
get-cpuinfo
OperatingSystemInfo
RamSummary
VideoCard
}
else { Write-Output "You have not chose to see System information" }

if ( $Disk -like "True" ) {
get-mydisks
PhysicalDisk
}
else { Write-Output "You have not chose to see Disk information" }

if ( $Network -like "True" ) {
NetworkAdapter
}
else { Write-Output "You have not chose to see Network information" }
