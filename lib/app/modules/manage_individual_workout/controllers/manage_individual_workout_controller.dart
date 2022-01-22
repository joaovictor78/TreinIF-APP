import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '/app/domain/entitities/athlete_entity.dart';
import '/app/modules/manage_individual_workout/domain/usecases/remove_exercise_usecase.dart';
import '/app/core/components/custom_toast.dart';
import '/app/core/enums/exercise_classification_enum.dart';
import '/app/domain/entitities/exercise_entity.dart';
import '/app/modules/manage_individual_workout/domain/usecases/get_exercises_by_day_of_week_usecase.dart';

class ManageIndividualWorkoutController extends GetxController{
  ManageIndividualWorkoutController({required this.getExercisesByDayOfWeekUseCase, required this.removeExerciseUseCase});
  GetExercisesByDayOfWeekUseCase getExercisesByDayOfWeekUseCase;
  RemoveExerciseUseCase removeExerciseUseCase;
  var exercises = <ExerciseEntity>[].obs;
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 2));
  late AthleteEntity athleteEntity;
  late int workoutID;
  @override 
  onInit() {
    athleteEntity = Get.arguments["athlete_data"];
    workoutID = Get.arguments["workout_id"];
    getExercisesByDayOfWeek(workoutID, DateFormat('EEEE').format(selectedDate));
    print(DateFormat('EEEE').format(selectedDate));
    super.onInit();
  }
  getExercisesByDayOfWeek(int workoutID, String dayOfWeek) async {
    final response = await getExercisesByDayOfWeekUseCase(workoutID, dayOfWeek, ExerciseClassificationEnum.individual.value);
    if(!response.success){
      return CustomToast.showToast("Ocorreu um erro ao pegar os exercicios!", backgroundColor: Colors.red);
    }
    exercises.value = response.data;
  }
  removeExercise(int workoutID, int exerciseID, int index) async {
    final response = await removeExerciseUseCase(workoutID, exerciseID);
    if(!response.success){
      return CustomToast.showToast("Ocorreu um erro ao apagar o exercicio, tente novamente!", backgroundColor: Colors.red);
    }
    exercises.removeAt(index);
  }
}