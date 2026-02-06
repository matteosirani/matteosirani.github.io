# 🚀 GitHub Pages Deployment Instructions

Follow these steps to publish your academic website on GitHub Pages.

---

## Method 1: Upload Files Directly (Easiest - No Git Knowledge Required)

### Step 1: Create GitHub Repository

1. Go to [github.com](https://github.com) and sign in
2. Click the **+** icon (top right) → **New repository**
3. **Repository name**: `yourusername.github.io` 
   - ⚠️ Replace `yourusername` with your actual GitHub username
   - Example: if your username is `viscontemezzo`, name it `viscontemezzo.github.io`
4. **Description**: "Personal academic website"
5. Set to **Public**
6. ✅ Check "Add a README file" (optional)
7. Click **Create repository**

### Step 2: Upload Your Website Files

1. In your new repository, click **Add file** → **Upload files**
2. Open your `Academic website` folder on your computer
3. **Select and drag these files/folders** to GitHub:
   ```
   ✅ index.html
   ✅ research.html
   ✅ cv.html
   ✅ css/ (entire folder)
   ✅ js/ (entire folder)
   ✅ images/ (entire folder)
   ✅ files/ (entire folder)
   ✅ .gitignore
   ```

4. **DO NOT upload** these folders (keep them locally):
   ```
   ❌ Matteo_Sirani_academic/
   ❌ BGSE logos/
   ```

5. Add commit message: "Initial website upload"
6. Click **Commit changes**

### Step 3: Enable GitHub Pages

1. In your repository, click **Settings** (top menu)
2. Click **Pages** in the left sidebar
3. Under "Build and deployment":
   - **Source**: Select "Deploy from a branch"
   - **Branch**: Select "main" (or "master")
   - **Folder**: Select "/ (root)"
4. Click **Save**

### Step 4: Access Your Website

1. Wait 1-3 minutes for GitHub to build your site
2. Refresh the Pages settings page - you'll see: "Your site is live at..."
3. Visit: `https://yourusername.github.io`
4. 🎉 Your website is live!

---

## Method 2: Using Git (For Advanced Users)

If you want to use Git command line:

### Initial Setup

```powershell
# Navigate to your website folder
cd "\\neori\dfs\home3$\2024\msirani\Documents\BGSE\Academic website"

# Initialize Git repository
git init

# Add all files (respects .gitignore)
git add .

# Create first commit
git commit -m "Initial commit: Academic website"

# Link to GitHub repository (replace URL with yours)
git remote add origin https://github.com/yourusername/yourusername.github.io.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Future Updates

```powershell
# After making changes to your website
git add .
git commit -m "Update content"
git push
```

---

## 📝 Important Notes

### ✅ What Gets Deployed
- All HTML, CSS, JS files
- Images (profile.jpg, bgse-logo.png)
- Files (CV.pdf)

### ❌ What Stays Local
The `.gitignore` file is already configured to exclude:
- `Matteo_Sirani_academic/` (LaTeX source files)
- `BGSE logos/` (source logo files)
- System files (Thumbs.db, .DS_Store)

### 🔄 Updating Your Website

**Method 1 (Web Interface):**
1. Go to your repository on GitHub
2. Navigate to the file you want to edit
3. Click the pencil icon (Edit)
4. Make changes and commit

**Method 2 (Upload New Files):**
1. Click "Add file" → "Upload files"
2. Drag updated files
3. Commit changes

**Method 3 (Git):**
1. Edit files locally
2. Run: `git add . && git commit -m "Description" && git push`

---

## 🐛 Troubleshooting

### Site not loading?
- Wait 2-3 minutes after first deployment
- Check Settings → Pages shows "Your site is published"
- Try clearing browser cache (Ctrl + F5)

### Changes not showing?
- GitHub Pages can take 1-2 minutes to update
- Try hard refresh: Ctrl + Shift + R
- Check you committed to the correct branch

### 404 Error?
- Verify repository name is exactly `yourusername.github.io`
- Check that `index.html` is in the root folder
- Ensure branch is set to "main" in Pages settings

### Theme toggle not working?
- This is expected when viewing files locally (file://)
- Will work perfectly once deployed to GitHub Pages
- Uses localStorage which requires a web server

---

## 📧 Need Help?

If you encounter issues:
1. Check [GitHub Pages Documentation](https://docs.github.com/en/pages)
2. Verify all files uploaded correctly
3. Check GitHub Actions tab for build errors

---

**Ready to deploy? Start with Method 1 - it's the easiest!** 🚀
