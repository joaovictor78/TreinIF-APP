import 'package:get/get.dart';
import '/app/modules/athlete_profile/controllers/historic_of_athlete_controller.dart';
import '/app/modules/athlete_profile/data/datasources/add_value_data_point_of_historic_of_athlete_datasource.dart';
import '/app/modules/athlete_profile/data/repositories/add_value_data_point_of_historic_of_athlete_repository.dart';
import '/app/modules/athlete_profile/domain/usecases/add_value_data_point_of_historic_of_athlete_usecase.dart';
import '/app/core/network/custom_dio/custom_dio.dart';
import '/app/modules/athlete_profile/data/datasources/add_historic_of_athlete_datasource.dart';
import '/app/modules/athlete_profile/data/repositories/add_historic_of_athlete_repository.dart';
import '/app/modules/athlete_profile/domain/usecases/add_historic_of_athlete_usecase.dart';
import "/app/modules/athlete_profile/data/datasources/get_athlete's_history_datasource.dart";
import "/app/modules/athlete_profile/data/repositories/get_athlete's_history_usecase.dart";
import "/app/modules/athlete_profile/domain/usecases/get_athlete's_history_usecase.dart";
import '/app/modules/athlete_profile/controllers/athlete_profile_controller.dart';

class AthleteProfileBiding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => GetAthletesHistoryDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => GetAthletesHistoryRepository(Get.find<GetAthletesHistoryDataSource>()));
    Get.lazyPut(() => GetAthletesHistoryUseCase(Get.find<GetAthletesHistoryRepository>()));
    Get.lazyPut(() => AddHistoricOfAthleteDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => AddHistoricOfAthleteRepository(Get.find<AddHistoricOfAthleteDataSource>()));
    Get.lazyPut(() => AddHistoricOfAthleteUseCase(Get.find<AddHistoricOfAthleteRepository>()));
    Get.lazyPut(() => AthleteProfileController(getAthletesHistoryUseCase: Get.find(), addHistoricOfAthleteUseCase: Get.find()));
    Get.lazyPut(() => AddValueDataPointOfHistoricOfAthleteDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => AddValueDataPointOfHistoricOfAthleteRepository(Get.find<AddValueDataPointOfHistoricOfAthleteDataSource>()));
    Get.lazyPut(() => AddValueDataPointOfHistoricOfAthleteUseCase(Get.find<AddValueDataPointOfHistoricOfAthleteRepository>()));
    Get.lazyPut(() => HistoricOfAthleteController(addValueDataPointOfHistoricOfAthleteUseCase: Get.find()));
  }
}