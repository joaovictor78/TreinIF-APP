import 'package:treinif/app/core/utils/return_data.dart';
import 'package:treinif/app/modules/start/submodules/profile/domain/entities/user_entity.dart';

abstract class IUpdateDataUserDataSource{
  Future<ReturnData> call(UserEntity user);
}