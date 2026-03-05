# Script to compile CV.tex and update website PDF

Write-Host "Compiling CV..." -ForegroundColor Green

# Navigate to LaTeX folder
Push-Location ".\Matteo_Sirani_academic"

# Compile CV.tex
Write-Host "Running pdflatex (pass 1)..."
pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=.\tex_out CV.tex | Out-Null

Write-Host "Running pdflatex (pass 2)..."
pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=.\tex_out CV.tex | Out-Null

# Check if PDF was created
if (Test-Path ".\tex_out\CV.pdf") {
    # Copy to website files folder
    Copy-Item -Path ".\tex_out\CV.pdf" -Destination "..\files\CV.pdf" -Force
    Write-Host "✓ CV.pdf successfully updated in files folder" -ForegroundColor Cyan
    
    # Return to website root
    Pop-Location
    
    # Show git status
    Write-Host "`nReady to commit and push:" -ForegroundColor Yellow
    Write-Host "  git add files/CV.pdf"
    Write-Host "  git commit -m `"Update CV`""
    Write-Host "  git push origin main"
} else {
    Write-Host "✗ Error: PDF compilation failed" -ForegroundColor Red
    Pop-Location
    exit 1
}
