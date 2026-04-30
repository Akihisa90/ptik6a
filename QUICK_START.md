# 🚀 QUICK START: Deploy ke Railway

## ✅ Apa yang sudah saya siapkan:

- ✅ Database migration difix (hapus duplikat comments table)
- ✅ `.env.production` untuk production  
- ✅ `Procfile` untuk web server config
- ✅ `railway.json` untuk Railway deploy
- ✅ Git repository sudah initialized
- ✅ Panduan lengkap di `RAILWAY_DEPLOY.md`

---

## 🎯 3 Langkah untuk Deploy:

### **Langkah 1: Commit & Push ke GitHub**

Buka **PowerShell** atau **VS Code Terminal** di folder project:

```powershell
cd "d:\Ahmad\College\Semester 6\Web Programming\Landing-Page - Copy"

# Setup git user
git config user.name "Your Name"
git config user.email "your@email.com"

# Add & commit
git add .
git commit -m "PTIK 6A Landing Page - Ready for Railway"

# Setup remote (ganti URL dengan repository Anda)
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git branch -M main
git push -u origin main
```

---

### **Langkah 2: Setup Railway (5 menit)**

1. Buka https://railway.app
2. **Sign up with GitHub** (atau Login)
3. **Create New Project** → **Deploy from GitHub**
4. Select repository `YOUR_REPO`
5. Railway otomatis mulai build & deploy

---

### **Langkah 3: Setup Database**

Di Railway Dashboard:

1. **Add Service** → **MySQL**
2. Copy database credentials (HOST, PORT, USER, PASSWORD, DATABASE)
3. Go to your App → **Variables**
4. Add variables:
   ```
   DATABASE_HOST = [dari MySQL service]
   DATABASE_PORT = [dari MySQL service]  
   DATABASE_USER = [dari MySQL service]
   DATABASE_PASSWORD = [dari MySQL service]
   DATABASE_NAME = [dari MySQL service]
   ```

5. Redeploy atau restart app

---

## 📋 Checklist:

- [ ] GitHub repository created
- [ ] Project pushed to GitHub
- [ ] Railway project created
- [ ] MySQL database added
- [ ] Environment variables set
- [ ] Website live! ✨

---

## ⚠️ Jika Ada Error:

### Error: "Table already exists"
- Sudah difix, tidak perlu khawatir

### Error: "DATABASE CONNECTION FAILED"
- Check DATABASE_* variables di Railway
- Restart app/redeploy

### Error: "500 Internal Server"
- Check Railway logs: `railway logs`
- Atau buka Railway Console

### Error: "Assets tidak load"
- Jalankan: `railway run "php artisan storage:link"`
- Atau: `railway run "npm run build"`

---

## 🔗 Useful Links:

- Railway Docs: https://docs.railway.app
- Laravel on Railway: https://docs.railway.app/guides/laravel
- Troubleshooting: Baca `RAILWAY_DEPLOY.md` untuk detail

---

## 💡 Tips:

- Test local dulu: `php artisan serve` + buka http://localhost:8000
- Check logs: `railway logs` untuk debug
- Database backup: Download dari Railway dashboard
- Custom domain: Settings → Domains

---

**Butuh bantuan?** Baca `RAILWAY_DEPLOY.md` untuk panduan lengkap!
