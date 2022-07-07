const productService = require("./products");
const ordersDAL = require("../dal/ordersDAL");
const memberService = require("./members");

async function getOrders(userId) {

    if (!memberService.isAdmin(userId)) {

      const dbOrders = await ordersDAL.selectOrdersByMemberId(userId)
      
      return Promise.all(
        dbOrders.rows.map(async (dbOrder) => {
          const productList = await productService.getAllProductsByOrderId(dbOrder.id);

          return {
            id: dbOrder.id,
            orderdate: dbOrder.orderdate,
            orderref: dbOrder.orderref,
            products: productList,
          };
        })
      ).then((ordersList) => {
        return ordersList;
      });
    }
}

async function addOrder(orderObj, userId) {  
  if(memberService.isAdmin(userId))  {
    return {
      statusCode: 401,
      message: 'unauthorised access - admin is not allowed to create orders.'
    };
  }

  const orderRef = Math.random().toString(36).substring(2, 9);
  const currentDateTime = new Date();

  const newOrderRecord = {
    memberId: orderObj.memberId,
    orderRef: orderRef,
    orderDate: currentDateTime
  };

  const insertOrderResult = await ordersDAL.insertOrder(newOrderRecord);
  if(!insertOrderResult.rowCount > 0) {
    return {
          statusCode: 500,
          message: 'order did not get inserted',
        };
  }

  const orderId = insertOrderResult.rows[0].id;

  const orderItems = orderObj.products.map( (product) => {
      return {
        productId: product.id,
        orderId: orderId,
        quantity: product.quantity,
      };
  });

  return ordersDAL.insertOrderItems(orderItems).then((insertRes) => {
      if(insertRes.rowCount === orderItems.length) {
        return {
          statusCode: 200, 
          message: {id: orderId}
        }
      } else {
        return {
          statusCode: 500,
          message: 'order did not get inserted',
        };
      }

    })
    .catch((error) => {
      console.log(error);
        return {
          statusCode: 500,
          message: "an error occured on the server-side during the order insertion",
        };
    });
}

module.exports = {
  getOrders,
  addOrder
};
