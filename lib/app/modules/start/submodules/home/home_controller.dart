import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '/app/core/components/custom_toast.dart';
import '/app/modules/start/submodules/home/domain/usecases/search_athletes_use_case.dart';

class HomeController extends GetxController {
  HomeController(this._searchAthletesUseCase);
  final SearchAthletesUseCase _searchAthletesUseCase;
  var athletes = [].obs;
  var isLoading = false.obs;
  searchAthletes(String term) async {
   final result = await  _searchAthletesUseCase(limit: 20, page: 1, searchTerm: term);
   if(!result.success){
     return CustomToast.showToast("Ocorreu um erro ao pesquisar por atletas", backgroundColor: Colors.red);
   }
   athletes.value = RxList.of(result.data!);
  }

}