import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinif/app/modules/athlete_profile/domain/entities/data_point_of_%20athlete_historic_entity.dart';
import '/app/modules/athlete_profile/domain/usecases/remove_value_data_point_of_historic_of_athlete_usecase.dart';
import '/app/modules/athlete_profile/domain/usecases/update_value_data_point_of_historic_of_athlete_usecase.dart';
import '/app/core/components/custom_toast.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/athlete_profile/domain/entities/value_data_point_of_athlete_historic_entity.dart';
import '/app/modules/athlete_profile/controllers/athlete_profile_controller.dart';
import '/app/modules/athlete_profile/domain/usecases/add_value_data_point_of_historic_of_athlete_usecase.dart';

class HistoricOfAthleteController extends GetxController{
  HistoricOfAthleteController({required this.addValueDataPointOfHistoricOfAthleteUseCase, required this.updateValueDataPointOfHistoricOfAthleteUseCase, required this.removeValueDataPointOfHistoricOfAthleteUseCase });
  AddValueDataPointOfHistoricOfAthleteUseCase addValueDataPointOfHistoricOfAthleteUseCase;
  RemoveValueDataPointOfHistoricOfAthleteUseCase removeValueDataPointOfHistoricOfAthleteUseCase;
  UpdateValueDataPointOfHistoricOfAthleteUseCase updateValueDataPointOfHistoricOfAthleteUseCase;
  late AthleteProfileController _athleteProfileController;
  late TextEditingController newValueDataPointTypeTextController;
  late TextEditingController newValueDataPointValueTextController;
  late DataPointOfAthleteHistoricEntity dataPointSelected;
  @override 
  void onInit() {
    _athleteProfileController = Get.find<AthleteProfileController>();
    newValueDataPointTypeTextController = TextEditingController();
    newValueDataPointValueTextController = TextEditingController();
    dataPointSelected = Get.arguments["historic"];
    super.onInit();
  }
  @override
  void dispose() {
    newValueDataPointTypeTextController.dispose();
    newValueDataPointValueTextController.dispose();
    super.dispose();
  }

  addValueDataPoint(int athleteID, int dataPointID) async {
    ValueDataPointOfAthleteHistoricEntity valueDataPoint = ValueDataPointOfAthleteHistoricEntity(type: newValueDataPointTypeTextController.text, value: newValueDataPointValueTextController.text);
    final _response = await addValueDataPointOfHistoricOfAthleteUseCase(athleteID, dataPointID, valueDataPoint);
    if(!_response.success){
      return CustomToast.showToast("Ocorreu um erro ao adicionar o valor ao historico!", backgroundColor: AppColors.red);
    }
    //fazer logica pra adicionar o item a lista
  }
  updateValueDataPoint(int athleteID, int dataPointID, int valueDataPointID) async {
    ValueDataPointOfAthleteHistoricEntity valueDataPoint = ValueDataPointOfAthleteHistoricEntity(type: newValueDataPointTypeTextController.text, value: newValueDataPointValueTextController.text);
    final _response = await updateValueDataPointOfHistoricOfAthleteUseCase(athleteID, dataPointID, valueDataPointID, valueDataPoint);
    if(!_response.success){
      return CustomToast.showToast("Ocorreu um erro ao atualizar o dado do ponto de dados");
    }
    final valueDataPointSelected = dataPointSelected.values!.firstWhere((element) => element.id == valueDataPointID);
    valueDataPointSelected.type = valueDataPoint.type;
    valueDataPointSelected.value = valueDataPoint.value;

  }
  removeValueDataPoint(int athleteID, int dataPointID, int valueDataPointID) async {
    final _response = await removeValueDataPointOfHistoricOfAthleteUseCase(athleteID, dataPointID, valueDataPointID);
    if(!_response.success){
      return CustomToast.showToast("Ocorreu um erro ao remover o dado do ponto de dados");
    }
    dataPointSelected.values!.removeWhere((element) => element.id == valueDataPointID);
  }
} 