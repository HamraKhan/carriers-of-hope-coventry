const express = require("express");
const router = express.Router();

const { getOrders } = require("../service/orders");

router.get('/orders', (req, res) => {
    getOrders().then(orders => {
        res.json(orders);
    })
})

module.exports = router;