const { Pool } = require("pg");
const connectionString = process.env.DATABASE_URL;

export const pgClient = new Pool({
  connectionString,
});

export function selectOrders() {
  return pgClient.query(`SELECT id, `+
  `order_date as orderDate, `+ 
  `order_ref as orderRef, `+
  `member_id as memberId `+
  `product_id as productId `+
  `FROM orders;`, (err, res) => {
    if (err) throw err;

    return JSON.stringify(res.rows);
  })
  .finally(pgClient.end());
}

export function selectOrdersByMemberId(memberId) {
    return pgClient
      .query(
        `SELECT id, ` +
          `order_date as orderDate, ` +
          `order_ref as orderRef, ` +
          `member_id as memberId ` +
          `product_id as productId ` +
          `FROM orders where member_id = ${memberId};`,
        (err, res) => {
          if (err) throw err;

          return JSON.stringify(res.rows);
        }
      )
      .finally(pgClient.end());
}