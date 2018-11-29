<#
 Copyright (c) 2018 ITT Development team
    Author: Cezary Rojewski

.DESCRIPTION
    Given the input params, attempts to compile map script using jasshelper.

.REMARKS
    Although no parameters are specified, any provided will be added to
    command line when invoking jasshelper.

    Checkout jasshelper manual for more infomation about available arguments.

.EXAMPLE
    compile.ps1 --debug  # '--debug' option will be added to command line
#>

$ScriptPath  = Split-Path -Parent $MyInvocation.MyCommand.Definition

$CommonJ     = Join-Path -Path $ScriptPath -ChildPath 'bin\jasshelper\common.j'
$BlizzardJ   = Join-Path -Path $ScriptPath -ChildPath 'bin\jasshelper\blizzard.j'
$Jasshelper  = Join-Path -Path $ScriptPath -ChildPath 'bin\jasshelper\clijasshelper.exe'

# Path to directory containing all .j and .zn files to be compiled using jasshelper
$JassFolder  = Join-Path -Path $ScriptPath -ChildPath 'jass'
# Path to unparsed .j file generated prior to compilation
$GeneratedJ  = Join-Path -Path $ScriptPath -ChildPath 'bin\generated.j'
# Path to output .j file to be created after compilation
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

# Run jasshelper to perform actual compilation of map script
$Params = $args + @('--scriptonly', $CommonJ, $BlizzardJ, $GeneratedJ, $OutputJ)


If (Get-Command wine -errorAction SilentlyContinue)
{
    & wine $Jasshelper $Params
}
Else
{
    & $Jasshelper $Params
}