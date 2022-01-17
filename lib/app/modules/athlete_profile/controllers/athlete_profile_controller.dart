import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:treinif/app/modules/athlete_profile/data/dtos/data_point_of_athlete_historic_dto.dart';
import '/app/modules/athlete_profile/domain/usecases/add_historic_of_athlete_usecase.dart';
import '/app/core/components/custom_toast.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/athlete_profile/domain/entities/data_point_of_%20athlete_historic_entity.dart';
import "/app/modules/athlete_profile/domain/usecases/get_athlete's_history_usecase.dart";

class AthleteProfileController extends GetxController{
  AthleteProfileController({required this.getAthletesHistoryUseCase, required this.addHistoricOfAthleteUseCase});
  GetAthletesHistoryUseCase getAthletesHistoryUseCase;
  AddHistoricOfAthleteUseCase addHistoricOfAthleteUseCase;
 @override
  void onInit() { 
    getHistoricOfAthlete(Get.arguments.id);
    super.onInit();
  }
  
  var currentIndex = 0.obs;
  var dataPoints = <DataPointOfAthleteHistoricEntity>[].obs;
  var isLoading = false.obs;
  PageController pageController = PageController();
  changePage(int page){
    currentIndex.value = page;
    pageController.jumpToPage(page);
  }
  getHistoricOfAthlete(athleteID) async {
    isLoading.value = true;
    final response = await getAthletesHistoryUseCase(athleteID);
    if(!response.success){
      isLoading.value = false;
      return CustomToast.showToast("Ocorreu um erro ao pegar o historico do atleta!", backgroundColor: AppColors.red);
    }
    dataPoints.value = response.data!;
    isLoading.value = false;
  }
  addHistoricOfAthlete(DataPointOfAthleteHistoricEntity dataPoint) async{
    final response = await addHistoricOfAthleteUseCase(Get.arguments.id, dataPoint);
  } 
}