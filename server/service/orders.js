// import { selectOrders } from "../dal/ordersDAL";
import { getAllProductsByOrderId } from "./products";
import { selectOrdersByMemberId } from "../dal/ordersDAL";

//gets order records. 
    //condition: uses userId parameter to check if the user is an admin or not
export function getOrders(userId) {
    //check if user is admin or not....
    //isAdmin() function needs to be created in the members.js file
    //located in the service folder
    if(!isAdmin(userId)) {

        //if the user is not an admin:
        //select order records by memberId/userId using the selectOrdersByMemberId() function 
        //located in the ordersDAL.js file
        return selectOrdersByMemberId(userId)
           .then(orders => {
            // orders: [
            //     {id:,
            //     orderDate,
            //     orderRef,
            //     memberId,
            //     },
            //     
            //     {id:,
            //     orderDate,
            //     orderRef,
            //     memberId,
            //     },
            //     
            //     {id:,
            //     orderDate,
            //     orderRef,
            //     memberId,
            //     }
            // ]

            // loop through all the orders and retrieve the orderItems for each order

            const ordersList = orders.map(order => {
                //get all products by order id using the products service
                
                // products: [
                //     {
                //         id:,
                //         name:,
                //         category:,
                //         quantity:,
                //     },
                //     {
                //         id:,
                //         name:,
                //         category:,
                //         quantity:,
                //     },
                //     {
                //         id:,
                //         name:,
                //         category:,
                //         quantity:,
                //     }
                // ]
                getAllProductsByOrderId(order.id)
                .then(products => {
                    return {
                        id: order.id,
                        orderDate: order.orderDate,
                        orderRef: order.orderRef,
                        products: products
                    }
                    //   {
                    //     id:,
                    //     orderDate:,
                    //     orderRef:,
                    //     products: [
                    //         {
                    //             id:,
                    //             name:,
                    //             category:,
                    //             quantity:,
                    //         },
                    //         {
                    //             id:,
                    //             name:,
                    //             category:,
                    //             quantity:,
                    //         },
                    //         {
                    //             id:,
                    //             name:,
                    //             category:,
                    //             quantity:,
                    //         }
                    //     ]
                    //   }
                });

                return ordersList;
                //  [
                    //   {
                    //     id:,
                    //     orderDate:,
                    //     orderRef:,
                    //     products: [
                    //         {
                    //             id:,
                    //             name:,
                    //             category:,
                    //             quantity:,
                    //         },
                    //         {
                    //             id:,
                    //             name:,
                    //             category:,
                    //             quantity:,
                    //         },
                    //         {
                    //             id:,
                    //             name:,
                    //             category:,
                    //             quantity:,
                    //         }
                    //     ]
                    //   },
                    //   {
                    //     id:,
                    //     orderDate:,
                    //     orderRef:,
                    //     products: [
                    //         {
                    //             id:,
                    //             name:,
                    //             category:,
                    //             quantity:,
                    //         },
                    //         {
                    //             id:,
                    //             name:,
                    //             category:,
                    //             quantity:,
                    //         },
                    //         {
                    //             id:,
                    //             name:,
                    //             category:,
                    //             quantity:,
                    //         }
                    //     ]
                    //   }
                //  ]

        })
        return 
        })
    }

    //
    // const orders = await selectOrders()
    
    // orders.map(order => {
    //     const member = await getMember(order.memberId);
    //     // {
    //     //     id:,
    //     //     name:,
    //     //     email:,
    //     //     phoneNumber:,
    //     //     address: {
    //     //         addressLine1:,
    //     //         addressLine2:,
    //     //         postcode:,
    //     //         city:,
    //     //         county:,
    //     //         country:,
    //     //     }
    //     // }

    //     const product = await getProduct(order.productId);

    //     return {

    //     }
    // })
 }