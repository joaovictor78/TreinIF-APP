import 'package:get/get.dart';
import '/app/core/components/custom_toast.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/manage_exercicies_types/domain/usecases/add_exercise_type_usecase.dart';
import '/app/modules/manage_exercicies_types/domain/usecases/get_exercises_types_usecase.dart';
import '/app/modules/manage_exercicies_types/domain/usecases/remove_exercise_type_usecase.dart';
import '/app/modules/manage_exercicies_types/domain/usecases/update_exercise_type_usecase.dart';

class ManageExercisesTypesController extends GetxController {
  ManageExercisesTypesController(
      {required this.getExercisesTypesUseCase,
      required this.addExerciseTypeUseCase,
      required this.removeExerciseTypeUseCase,
      required this.updateExerciseTypeUseCase});
  GetExercisesTypesUseCase getExercisesTypesUseCase;
  AddExerciseTypeUseCase addExerciseTypeUseCase;
  UpdateExerciseTypeUseCase updateExerciseTypeUseCase;
  RemoveExerciseTypeUseCase removeExerciseTypeUseCase;

  getExercisesTypes() async {
    final response = await getExercisesTypesUseCase();
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao pegar os tipos de exercicio",
          backgroundColor: AppColors.red);
    }
  }

  addExerciseType() async {
    final response = await addExerciseTypeUseCase();
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao adicionar o tipo de exercicio",
          backgroundColor: AppColors.red);
    }
  }

  updateExerciseType() async {
    final response = await updateExerciseTypeUseCase();
    if(!response.success) {
      return CustomToast.showToast("Ocorreu um erro ao atualizar o tipo de exercicio!", backgroundColor: AppColors.red);
    }
  }

  removeExerciseType() async {}
}
