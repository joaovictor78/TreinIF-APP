import 'package:get/get.dart';
import '/app/modules/athlete_profile/controllers/athlete_profile_controller.dart';

class AthleteProfileBiding extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut(() => AthleteProfileController());
  }
}