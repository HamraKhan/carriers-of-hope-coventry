export function selectProductsByOrderId(orderId) {
  return pgClient
    .query(
      `SELECT id, ` +
        `name, ` +
        `category_name, ` +
        `quantity ` +
        `FROM products ` +
        `WHERE id in (select id from order_item where order_id = ${orderId})`,
      (err, res) => {
        if (err) throw err;

        return JSON.stringify(res.rows);
      }
    )
    .finally(pgClient.end());
}

