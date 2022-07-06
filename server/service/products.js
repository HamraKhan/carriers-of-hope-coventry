import { selectProductsByOrderId } from "../dal/productsDAL";

export function getAllProductsByOrderId(orderId) {
    return selectProductsByOrderId(orderId);
}
