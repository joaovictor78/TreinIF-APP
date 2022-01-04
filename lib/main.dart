import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/modules/register/register_user_biding.dart';
import '/app/modules/start/submodules/workouts/presentation/pages/create_team_page.dart';
import '/app/app_binding.dart';
import '/app/modules/manage_workouts_by_team/manage_workouts_by_team_biding.dart';
import '/app/modules/manage_workouts_by_team/pages/list_workouts_by_team_page.dart';
import '/app/modules/manage_workouts_by_team/pages/manage_workout_page.dart';
import 'app/modules/start/start_biding.dart';
import 'app/modules/start/start_page.dart';
import 'app/core/styles/app_colors.dart';
import 'app/modules/login/pages/forgot_password_page.dart';
import 'app/modules/login/pages/login_page.dart';
import 'app/modules/register/pages/register_account_page.dart';
import 'app/modules/register/pages/register_supplementary_data_page.dart';

void main() {
  AppBinding().dependencies();
  runApp(GetMaterialApp(
    theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        hintColor: AppColors.primaryColor,
        unselectedWidgetColor: Colors.white,
        disabledColor: Colors.white,
        brightness: Brightness.dark,
        backgroundColor: AppColors.primaryColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: AppColors.secondaryColor, elevation: 3),
        scaffoldBackgroundColor: AppColors.primaryColor),
    getPages: [
      GetPage(name: "/login", page: () => LoginPage()),
      GetPage(
          name: "/register_account",
          page: () => RegisterAccountPage(),
          binding: RegisterUserBiding()),
      GetPage(
          name: "/register_supplementary_data",
          page: () => RegisterSupplementaryDataPage()),
      GetPage(
        name: "/forgot_password",
        page: () => ForgotPasswordPage(),
      ),
      GetPage(name: "/start", page: () => StartPage(), binding: StartBiding()),
      GetPage(name: "/create_team", page: () => CreateTeamPage()),
      GetPage(
          name: "/list_workouts_by_team", page: () => ListWorkoutsByTeamPage()),
      GetPage(
          name: "/manage_workout",
          page: () => ManageWorkoutPage(),
          binding: ManageWorkoutsByTeamBiding())
    ],
    home: LoginPage(),
  ));
}
