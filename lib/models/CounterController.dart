import 'package:get/get.dart';
import 'package:totofood/models/Cart.dart';
import 'package:totofood/models/Product.dart';
import 'package:totofood/screens/details/components/address.dart';

class CounterController extends GetxController {
  RxInt count = demoCarts.length.obs;
  RxInt countItem = 1.obs;
  RxDouble totalCartPrice=0.00.obs;
  RxString address="".obs;
  void increment() {
    count++;
  }
  void delete() {
    count--;
  }
  void updateCartCount(int newCount) {
    count.value = newCount;
  }
  void updateTotalCartPrice() {
    totalCartPrice.value = calculateTotalCartPrice().value;
  }
  void updatePrice(double discount) {
    totalCartPrice.value = totalCartPrice.value-((totalCartPrice.value*discount)/100);
  }
  void updateOneCartPrice(Cart cart) {
    totalCartPrice.value = cart.product.giaBan * cart.numOfItem;
  }
  RxDouble calculateTotalCartPrice() {
    return demoCarts.fold(0.00.obs, (previousValue, cart) {
      return (previousValue.value + (cart.product.giaBan * cart.numOfItem)).obs;
    });
  }

}