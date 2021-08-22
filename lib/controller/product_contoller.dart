import 'package:callapi/controller/product_retrofit.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ProductControler extends GetxController {
  ProductRepostiory productRepostiory = ProductRepostiory();
  RxBool loading = false.obs;
  List product = [].obs;
  var showGird = false.obs;
  ProductControler() {
    loadProductIsFromAPI();
  }
  loadProductIsFromAPI() async {
    loading(true);
    product = await productRepostiory.loadProductIsFromAPI();
    loading(false);
  }

  toggleGirl() {
    showGird(!showGird.value);
    print(showGird);
  }
}
