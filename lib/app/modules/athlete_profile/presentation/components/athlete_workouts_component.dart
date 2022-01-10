import 'package:flutter/cupertino.dart';
import 'package:treinif/app/core/components/custom_workout_check_card_widget.dart';
import '/app/core/components/custom_text_widget.dart';

class AthleteWorkoutsComponent extends StatelessWidget {
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
          child: ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemBuilder: (_, __) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: CustomWorkoutCheckCardWidget(onTap: () {}),
          );
        }))
      ],
    );
  }
}
