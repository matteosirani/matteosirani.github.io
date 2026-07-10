# Matteo Sirani Academic Website

Static academic website for `matteosirani.github.io`.

## Deployable files

The public site is the small static bundle at the repository root:

- `index.html`
- `research.html`
- `cv.html`
- `css/style.css`
- `js/theme-toggle.js`
- `images/`
- `files/CV.pdf`

Local source folders such as `Matteo_Sirani_academic/`, `BGSE logos/`, and `08_Matteo Sirani/` are intentionally ignored by Git.

## Update the CV PDF

1. Edit `Matteo_Sirani_academic/CV.tex`.
2. Run the update script from the website root:

```powershell
.\update_cv.ps1
```

The script compiles the LaTeX CV into `Matteo_Sirani_academic/tex_out/CV.pdf` and copies the result to `files/CV.pdf`, which is the PDF linked by the website.

## Preview locally

Because the site is plain HTML/CSS/JS, opening `index.html` directly in a browser is enough for a quick check. For a closer GitHub Pages preview, run a simple local server from this folder and open the printed URL.

## Publish

```powershell
git status --short
git add index.html research.html cv.html css/style.css js/theme-toggle.js files/CV.pdf README.md .gitignore update_cv.ps1
git commit -m "Clean up academic website"
git push origin main
```

GitHub Pages deploys from the `main` branch of `matteosirani/matteosirani.github.io`.
