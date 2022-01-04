import 'package:get/get.dart';
import 'package:treinif/app/core/network/custom_dio/custom_dio.dart';
import 'package:treinif/app/modules/register/controllers/register_user_controller.dart';
import 'package:treinif/app/modules/register/repositories/register_user_repository.dart';

class RegisterUserBiding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterUserRepository(Get.find<CustomDio>()));
    Get.lazyPut(() => RegisterUserController(Get.find()));
  }

}