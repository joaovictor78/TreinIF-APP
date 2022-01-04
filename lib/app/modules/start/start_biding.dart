import 'package:get/get.dart';
import '/app/modules/start/submodules/home/domain/usecases/search_athletes_use_case.dart';
import '/app/core/network/custom_dio/custom_dio.dart';
import '/app/modules/start/submodules/workouts/data/datasources/remotes/get_all_atheltes_by_individual_workouts_datasource.dart';
import '/app/modules/start/submodules/workouts/data/datasources/remotes/get_all_teams_by_workouts_datasource.dart';
import '/app/modules/start/submodules/workouts/data/repositories/get_all_athletes_by_individual_workouts_repository.dart';
import '/app/modules/start/submodules/workouts/data/repositories/get_all_teams_by_workouts_repository.dart';
import '/app/modules/start/submodules/workouts/domain/usecases/get_all_athletes_by_individual_workouts_usecase.dart';
import '/app/modules/start/submodules/workouts/domain/usecases/get_all_teams_by_workouts_usecase.dart';
import '/app/modules/start/submodules/home/data/datasources/remote/search_athletes_datasource.dart';
import '/app/modules/start/submodules/home/data/repositories/search_athletes_repository.dart';
import '/app/modules/start/submodules/home/home_controller.dart';
import '/app/modules/start/submodules/workouts/controllers/workouts_controller.dart';
import '/app/modules/start/start_controller.dart';

class StartBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartController());
    Get.lazyPut(() => SearchAthletesDataSource(Get.find<CustomDio>()));
    Get.lazyPut(
        () => SearchAthletesRepository(Get.find<SearchAthletesDataSource>()));
    Get.lazyPut(
        () => SearchAthletesUseCase(Get.find<SearchAthletesRepository>()));
    Get.lazyPut(() => HomeController(Get.find()));
    Get.lazyPut(() => GetAllAthletesByIndividualWorkoutsDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => GetAllAthletesByIndividualWorkoutsRepository(Get.find<GetAllAthletesByIndividualWorkoutsDataSource>()));
    Get.lazyPut(() => GetAllAthletesByIndividualWorkoutsUseCase(Get.find<GetAllAthletesByIndividualWorkoutsRepository>()));
    Get.lazyPut(() => GetAllTeamsByWorkoutsDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => GetAllTeamsByWorkoutsRepository(Get.find<GetAllTeamsByWorkoutsDataSource>()));
    Get.lazyPut(() => GetAllTeamsByWorkoutsUseCase(Get.find<GetAllTeamsByWorkoutsRepository>()));
    Get.lazyPut(() => WorkoutsController(
        getAllTeamsByWorkoutsUseCase: Get.find(),
        getAllAthletesByIndividualWorkoutsUseCase: Get.find()));
  }
}
