
# Invoke-RestMethod -Uri http://localhost:1338/db/all | % {$_[0].psobject.properties} | % {"[{0}] `${1}" -f ($_.TypeNameOfValue -replace 'System.' -replace 'Int32', 'int').tolower(), $_.Name}

class AvalancheDatabase {
  [string] $id
  [string] $root
  [string] $displayName
  [string] $stateOid
  [int]    $schemaVersion
  [string] $platform
  [datetime] $created
  [string] $creatorSessionId
  [string] $oid
  [int]    $generation
  [datetime] $updated
  [long] $oplogSize
}


function Get-AvalancheDataBase {
  
  <#
      .Synopsis
      Gets databases from an avalanche server
      .DESCRIPTION
      The command enumerates all available databases from an avalanche server.
      If no URI is specified, the localhost at port 1338 is used by default.
      .EXAMPLE
      Get-AvalancheDataBase

      .OUTPUTS
      AvalanceDatabase

  #>
  [OutputType([AvalancheDatabase])]
  param(
    # The uri where the avalanche database is located
    [string] $Uri =  'http://localhost:1338'
  )
  (Invoke-RestMethod -Uri $Uri/db/all) | ForEach-Object  { [AvalancheDatabase]$_}
}
