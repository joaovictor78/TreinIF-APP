import 'package:get/get.dart';
import '/app/modules/manage_workouts_by_team/controllers/add_exercise_controller.dart';
import '/app/modules/manage_workouts_by_team/controllers/manage_workout_controller.dart';

class ManageWorkoutsByTeamBiding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ManageWorkoutController());
    Get.lazyPut(() => AddExerciseController(), fenix: true);
   }
}