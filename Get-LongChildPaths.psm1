function Get-LongChildPaths {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [Alias("Path")]
        [string]$ParentPath,

        [Parameter(Position=1)]
        [int]$Length = 254
    )

    if (-not (Test-Path $ParentPath)) {
        Write-Error "Specified ParentPath does not exist."
        return
    }

    Get-ChildItem -Recurse -LiteralPath $ParentPath | ForEach-Object {
        if ($_.FullName.Length -gt $Length) {
            $_.FullName
        }
    }
}