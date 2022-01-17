import 'package:get/get.dart';
import '/app/modules/manage_workouts_by_team/models/day_of_week_model.dart';

class AddExerciseController extends GetxController{
 var daysOfWeek = <DayOfWeekModel>[DayOfWeekModel(name: "Segunda", isActive: false), DayOfWeekModel(name: "Terça", isActive: false), DayOfWeekModel(name: "Quarta", isActive: false), DayOfWeekModel(name: "Quinta", isActive: false), DayOfWeekModel(name: "Sexta", isActive: false), DayOfWeekModel(name: "Sabado", isActive: false), DayOfWeekModel(name: "Domingo", isActive: false)].obs;
}