import 'package:get/get.dart';

class MainController extends GetxController {
  var tabIndex = 1.obs;

  void changeTabIndex(int index) {
    print(index);
    tabIndex.value = index;
  }
}
