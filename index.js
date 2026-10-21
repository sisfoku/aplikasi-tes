const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.json({
    status: "success",
    message: "Halo! Aplikasi Node.js berhasil berjalan di Docker & Komodo! 🚀",
    timestamp: new Date()
  });
});

app.listen(port, () => {
  console.log(`Server berjalan di port ${port}`);
});
