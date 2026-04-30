# 📚 Panduan Deploy ke Railway

## ✅ Langkah 1: Persiapan Repository Git

1. Buka Terminal di folder project:
```powershell
cd "d:\Ahmad\College\Semester 6\Web Programming\Landing-Page - Copy"
```

2. Initialize Git Repository:
```powershell
git init
git add .
git commit -m "Initial commit - PTIK 6A Landing Page"
```

3. Setup GitHub Remote (gunakan SSH atau HTTPS):
```powershell
# Ganti YOUR_USERNAME dan YOUR_REPO dengan milik Anda
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git branch -M main
git push -u origin main
```

---

## 🚀 Langkah 2: Setup Railway Project

### Daftar/Login Railway:
1. Buka https://railway.app
2. Click "Login" atau "Sign Up with GitHub"
3. Authorize Railway dengan akun GitHub Anda

### Create New Project:
1. Klik "New Project" button
2. Pilih "Deploy from GitHub"
3. Cari dan pilih repository `YOUR_REPO`
4. Railway akan otomatis detect Laravel project

---

## 🗄️ Langkah 3: Setup Database

Di Railway Dashboard:

1. **Add MySQL Service:**
   - Klik "Add Service" → "MySQL"
   - Railway akan auto-create MySQL database
   - Copy credentials (HOST, PORT, USER, PASSWORD, DATABASE)

2. **Link Database ke App:**
   - Klik app Anda
   - Pilih tab "Variables"
   - Add environment variables:
   ```
   DATABASE_HOST = [MySQL Host]
   DATABASE_PORT = [MySQL Port]
   DATABASE_USER = [MySQL User]
   DATABASE_PASSWORD = [MySQL Password]
   DATABASE_NAME = [Database Name]
   ```

3. **Generate APP_KEY (jika belum):**
   - Di Railway, cari variable `APP_KEY` 
   - Sudah ada value: `base64:hblPtnOzBaISZI1I1Do8RMtUtV94+9pPoSfhKjPyD8g=`

---

## ⚙️ Langkah 4: Environment Variables

Set semua variable di Railway Dashboard → Variables:

```
APP_NAME=PTIK 6A Landing Page
APP_ENV=production
APP_DEBUG=false
APP_KEY=base64:hblPtnOzBaISZI1I1Do8RMtUtV94+9pPoSfhKjPyD8g=
LOG_CHANNEL=stack
LOG_LEVEL=info
SESSION_DRIVER=database
CACHE_STORE=database
QUEUE_CONNECTION=database
DATABASE_CONNECTION=mysql
DATABASE_HOST=[dari MySQL service]
DATABASE_PORT=[dari MySQL service]
DATABASE_USER=[dari MySQL service]
DATABASE_PASSWORD=[dari MySQL service]
DATABASE_NAME=[dari MySQL service]
```

---

## 🔄 Langkah 5: Run Migration

1. Di Railway Dashboard, buka app Anda
2. Cari tab "Deploy Logs" → lihat URL yang di-generate
3. Buka Terminal/PowerShell di local Anda
4. Jalankan migration via SSH:
   ```powershell
   # Railway akan provide SSH command
   # atau bisa melalui Railway CLI:
   npm install -g @railway/cli
   railway login
   railway link [project-id]
   railway run "php artisan migrate --force"
   ```

**ATAU lebih mudah:**
- Gunakan Railway Console dari dashboard
- Klik "Console" tab
- Jalankan: `php artisan migrate --force`

---

## ✨ Langkah 6: Verifikasi Deploy

1. Tunggu build selesai (Railway akan notify)
2. Klik URL yang di-generate (format: `https://xxxx-production.up.railway.app`)
3. Test website Anda!

---

## 🎯 Keuntungan Railway:

✅ Gratis $5/bulan credit (cukup untuk small project)  
✅ Auto-deploy saat push ke GitHub  
✅ Database PostgreSQL/MySQL included  
✅ Auto SSL certificate  
✅ Easy environment management  
✅ 24/7 uptime  

---

## ⚠️ Troubleshooting:

### Error: APP_KEY not set
```powershell
# Set di Railway Variables atau jalankan:
railway run "php artisan key:generate"
```

### Error: Database Connection Failed
- Pastikan MySQL service sudah di-add
- Verifikasi DATABASE_* variables benar
- Check MySQL credentials di Railway MySQL service detail

### Error: Storage Permission Denied
- Railway auto-handle ini, pastikan folder `storage/` writable

### Website Blank/Error 500
```powershell
# Check logs:
railway logs
```

---

## 📝 Notes:

- Jangan commit `.env` file ke GitHub (sudah di .gitignore)
- Railway akan auto-compile assets (npm run build)
- Database persisten di Railway MySQL
- Untuk custom domain: Settings → Domains

