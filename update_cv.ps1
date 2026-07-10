Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$CvDir = Join-Path $Root "Matteo_Sirani_academic"
$OutDir = Join-Path $CvDir "tex_out"
$OutputPdf = Join-Path $OutDir "CV.pdf"
$WebsitePdf = Join-Path $Root "files\CV.pdf"

if (-not (Test-Path $CvDir)) {
    throw "CV source folder not found: $CvDir"
}

if (-not (Get-Command pdflatex -ErrorAction SilentlyContinue)) {
    throw "pdflatex was not found on PATH. Install a LaTeX distribution or run this from a shell where pdflatex is available."
}

New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

Write-Host "Compiling CV..." -ForegroundColor Green
Push-Location $CvDir
try {
    for ($pass = 1; $pass -le 2; $pass++) {
        Write-Host "Running pdflatex (pass $pass)..."
        & pdflatex -synctex=1 -interaction=nonstopmode -file-line-error "-output-directory=$OutDir" CV.tex | Out-Null

        if ($LASTEXITCODE -ne 0) {
            throw "pdflatex failed on pass $pass. See $OutDir\CV.log."
        }
    }
}
finally {
    Pop-Location
}

if (-not (Test-Path $OutputPdf)) {
    throw "PDF compilation finished without creating $OutputPdf"
}

Copy-Item -Path $OutputPdf -Destination $WebsitePdf -Force
Write-Host "[OK] Updated files\CV.pdf" -ForegroundColor Cyan
Write-Host ""
Write-Host "Ready to publish:" -ForegroundColor Yellow
Write-Host "  git add files/CV.pdf"
Write-Host '  git commit -m "Update CV"'
Write-Host "  git push origin main"
