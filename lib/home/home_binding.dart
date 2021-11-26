import 'package:get/get.dart';
import 'package:translate/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeControler());
    Get.put(HomeBodyController());
  }
}
