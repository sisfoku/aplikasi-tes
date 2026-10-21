# 1. Gunakan image resmi Node.js versi LTS (Long Term Support) yang ringan (Alpine Linux)
FROM node:20-alpine

# 2. Tentukan direktori kerja di dalam container
WORKDIR /app

# 3. Salin file package.json dan package-lock.json (atau yarn.lock) terlebih dahulu
# Langkah ini penting agar Docker memanfaatkan cache layer, jadi dependencies tidak di-install ulang jika tidak ada perubahan package.
COPY package*.json ./

# 4. Install dependencies (gunakan npm ci untuk hasil yang konsisten di production)
RUN npm ci --only=production

# 5. Salin seluruh sisa source code aplikasi ke dalam container
COPY . .

# 6. Tentukan port berapa yang akan digunakan oleh aplikasi Anda (sesuaikan dengan app.js/server.js Anda)
EXPOSE 3000

# 7. Perintah untuk menjalankan aplikasi saat container menyala
CMD ["node", "index.js"]
