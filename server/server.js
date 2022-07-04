const express = require('express');
const cors = require('cors');
const app = express();
const PORT = 8000;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
// GET "/"
app.get('/', (req, res) => {
  // Delete this line after you've confirmed your server is running
  res.send({
    express: 'Your Backend Service is Running.',
  });
});

app.listen(PORT, () => {
  console.log(`Server listening on ${PORT}`);
});

