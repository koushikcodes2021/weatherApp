import 'package:get/get.dart';
import 'package:weatherapp/src/ui/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(city: 'London'));
  }
}
