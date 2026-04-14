$baseDir = "C..."
$list = "c..."
$dest = Join-Path $baseDir "duplicates"

New-Item -ItemType Directory -Path $dest -Force | Out-Null

Get-Content $list | ForEach-Object {
    $src = $_

    if(Test-Path $src) {
        Move-Item $src -Destination $dest -Force
        Write-Host "Moved: $src"
    } else {
        Write-Warning "File not found: $src"
    }
}
