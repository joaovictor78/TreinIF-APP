import 'package:get/get.dart';
import '/app/modules/add_exercises_to_workout/controllers/add_exercise_controller.dart';

class AddExercisesToWorkoutBiding implements Bindings{
  @override
  void dependencies() {
     Get.lazyPut(() => AddExerciseController());
  }
}