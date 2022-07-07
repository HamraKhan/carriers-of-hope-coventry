const pgClient = require("../config/postgres");

function selectProductsByOrderId(orderId) {
  return pgClient.pool
  .query(
    `SELECT id, ` +
      `product_name, ` +
      `category_name, ` +
      `quantity ` +
      `FROM products ` +
      `WHERE id in (SELECT id FROM order_item WHERE order_id = ${orderId})`
  );
}


module.exports = {
  selectProductsByOrderId,
};
