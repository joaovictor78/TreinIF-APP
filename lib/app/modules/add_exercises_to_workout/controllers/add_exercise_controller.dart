import 'package:get/get.dart';
import '/app/core/components/custom_toast.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/manage_individual_workout/controllers/manage_individual_workout_controller.dart';
import '/app/domain/entitities/exercise_entity.dart';
import '/app/modules/add_exercises_to_workout/domain/usecases/add_exercise_usecase.dart';
import '/app/modules/manage_workouts_by_team/models/day_of_week_model.dart';

class AddExerciseController extends GetxController{
 AddExerciseController({required this.addExerciseUseCase});
 var daysOfWeek = <DayOfWeekModel>[DayOfWeekModel(name: "Segunda", isActive: false), DayOfWeekModel(name: "Terça", isActive: false), DayOfWeekModel(name: "Quarta", isActive: false), DayOfWeekModel(name: "Quinta", isActive: false), DayOfWeekModel(name: "Sexta", isActive: false), DayOfWeekModel(name: "Sabado", isActive: false), DayOfWeekModel(name: "Domingo", isActive: false)].obs;
 AddExerciseUseCase addExerciseUseCase;
 ManageIndividualWorkoutController _manageIndividualWorkoutController = Get.find<ManageIndividualWorkoutController>();
  @override
  void onInit() {
    super.onInit();
  }
 addExercise(int workoutID, int type, ExerciseEntity exercise) async {
   final response = await addExerciseUseCase(workoutID, type, exercise);
   if(!response.success){
     return CustomToast.showToast("Ocorreu um erro ao adicionar o exercicio, tente novamente!", backgroundColor: AppColors.red);
   }
  _manageIndividualWorkoutController.exercises.add(response.data!);
 }
}