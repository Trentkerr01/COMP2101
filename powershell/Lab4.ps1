function HardwareDescription {
Write-Output 'System Hardware description:'
gwmi win32_computersystem | Format-List
}

function OperatingSystemInfo {
Write-Output 'Operating System Name and Version:'
gwmi win32_operatingsystem | Format-List Caption, Version
}

function ProcessorInfo {
Write-Output 'Processor Information:'
gwmi win32_processor | Format-List Description, CurrentClockSpeed, NumberOfCores, L1CacheSize, L2CacheSize, L3CacheSize
}

function RamSummary {
Write-Output 'RAM summary:'
gwmi win32_physicalmemory| ft Manufacturer, Description, Capacity, Banklabel
}

function PhysicalDisk {
Write-Output 'Disk Summary:'

 foreach ($disk in $diskdrives) {
      $partitions = $disk|get-cimassociatedinstance -resultclassname CIM_diskpartition
      foreach ($partition in $partitions) {
            $logicaldisks = $partition | get-cimassociatedinstance -resultclassname CIM_logicaldisk
            foreach ($logicaldisk in $logicaldisks) {
                     new-object -typename psobject -property @{Manufacturer=$disk.Manufacturer
                                                               Model=$disk.model
                                                               Drive=$logicaldisk.deviceid
                                                               "Size(GB)"=$logicaldisk.size / 1gb -as [int]
                                                               }
           }
      }
  }
}

function NetworkAdapter {
Write-Output 'Network Adapter Summary:'
get-ciminstance win32_networkadapterconfiguration | where-object ipenabled | format-table Description,Index,IPAdress,IPSubnet,DNSHostName,DNSServerSearchOrder
}

function VideoCard {
Write-Output 'Video Card Summary:'
Get-WmiObject win32_videocontroller | Format-List Name, Description, VideoModeDescription
}

#OUTPUT

HardwareDescription
OperatingSystemInfo
ProcessorInfo
RamSummary
PhysicalDisk
NetworkAdapter
VideoCard