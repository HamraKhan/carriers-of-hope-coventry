const express = require('express');
const cors = require('cors');
const app = express();

const PORT = process.env.PORT || 3000;
const products = require('./routes/products')
const members = require('./routes/members');

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

app.use('/products',products)
app.use('/members', members)

app.listen(PORT, () => {
  console.log(`Server listening on ${PORT}`);
});

