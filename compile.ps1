<#
 Copyright (c) 2018 ITT Development team
    Author: Cezary Rojewski

.DESCRIPTION
    Given the input params, attempts to compiles map script using jasshelper.

.PARAMETER  JasshelperArgs
    String value for additional arguments to pass to jasshelper.
#>

Param(
    [string]
    $JasshelperArgs  # defaults to an empty string
)

$ScriptPath  = Split-Path -Parent $MyInvocation.MyCommand.Definition

$CommonJ     = Join-Path -Path $ScriptPath -ChildPath 'bin\jasshelper\common.j'
$BlizzardJ   = Join-Path -Path $ScriptPath -ChildPath 'bin\jasshelper\blizzard.j'
$Jasshelper  = Join-Path -Path $ScriptPath -ChildPath 'bin\jasshelper\jasshelper.exe'

# Path to directory containing all .j and .zn files to be complited using jasshelper
$JassFolder  = Join-Path -Path $ScriptPath -ChildPath 'jass'
# Path to unparsed .j file generated prior to complitation
$GeneratedJ  = Join-Path -Path $ScriptPath -ChildPath 'bin\generated.j'
# Path to output .j file to be created after complitation
$OutputJ     = Join-Path -Path $ScriptPath -ChildPath 'wurst\war3map.j'

# Create GeneratedJ file from content of all .j and .zn files
$InputFiles  = Get-ChildItem -Path $JassFolder -Include *.j, *.zn -Recurse
New-Item $GeneratedJ -ItemType File -Force

ForEach ($File in $InputFiles)
{
    If ($File.Extension -eq '.zn')
    {
        Add-Content -Path $GeneratedJ -Value "//! zinc"
        Get-Content -Path $File | Add-Content $GeneratedJ
        Add-Content -Path $GeneratedJ -Value "//! endzinc"
    }
    Else
    {
        Get-Content -Path $File | Add-Content $GeneratedJ
    }
}

# Run jasshelper to perform actual complitaion of map script
$Params = @('--scriptonly', $JasshelperArgs, $CommonJ, $BlizzardJ, $GeneratedJ, $OutputJ)
& $Jasshelper $Params
