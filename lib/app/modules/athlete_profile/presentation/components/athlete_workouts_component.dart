import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/components/custom_workout_check_card_widget.dart';
import '/app/modules/athlete_profile/controllers/athlete_profile_controller.dart';
import '/app/core/components/custom_text_widget.dart';

class AthleteWorkoutsComponent extends StatelessWidget {
  AthleteProfileController _athleteProfileController = Get.find<AthleteProfileController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 20),
          child: CustomTextWidget(text: "Treinos do Atleta"),
        ),
        Expanded(
          child: _athleteProfileController.isLoading.value ? Center(child: CircularProgressIndicator()) : _athleteProfileController.dataPoints.isEmpty ? Center(child: CustomTextWidget(text: "Nenhum ponto de dado encontrado,\nadicione-os ao historico!")) : ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemBuilder: (_, __) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: CustomWorkoutCheckCardWidget(
              onTap: () {
              Get.toNamed("/manage_individual_workout");
            }),
          );
        }))
      ],
    );
  }
}
