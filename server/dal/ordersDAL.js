const pgClient = require("../config/postgres");
const format = require("pg-format");

async function selectOrdersByMemberId(memberId) {
  return await pgClient.pool
    .query(
      `SELECT id, ` +
        `order_date AS orderDate, ` +
        `order_ref AS orderRef, ` +
        `member_id AS memberId ` +
        `FROM orders WHERE member_id = ${memberId};`);
}

async function insertOrder(orderObj) {
  return await pgClient.pool.query(
    "INSERT INTO orders (order_date, order_ref, member_id) " +
      "VALUES ($1, $2, $3) RETURNING *;",
    [orderObj.orderDate, orderObj.orderRef, orderObj.memberId]
  );
}

async function insertOrderItems(orderItems) {
  const orderItemsArray = orderItems.map(item => {
    return [item.productId, item.orderId, item.quantity];
  })
  return await pgClient.pool.query(
    format(
      "INSERT INTO order_item (product_id, order_id, quantity) VALUES %L RETURNING *",
      orderItemsArray
    ),
    []
  );
}

module.exports = {
  selectOrdersByMemberId,
  insertOrder,
  insertOrderItems,
};
