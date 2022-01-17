import 'package:get/get.dart';
import 'package:treinif/app/modules/add_exercises_to_workout/controllers/add_exercise_controller.dart';

class ManageIndividualWorkoutBiding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddExerciseController());
  }
}