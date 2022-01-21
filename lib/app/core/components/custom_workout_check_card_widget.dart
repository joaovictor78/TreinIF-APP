import 'package:flutter/material.dart';
import 'package:treinif/app/domain/entitities/individual_workout_entity.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';

class CustomWorkoutCheckCardWidget extends StatelessWidget {
  CustomWorkoutCheckCardWidget({this.onTap, this.onCheck, this.individualWorkout});
  void Function()? onTap;
  void Function()? onCheck;
  IndividualWorkoutEntity? individualWorkout;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColors.mediumGrey),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 10),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(text: individualWorkout?.name ?? ""),
                Row(
                  children: [
                    CustomTextWidget(text: "status do treino: ", fontWeight:
                            individualWorkout?.isActive ?? false ? FontWeight.normal: FontWeight.w300),
                    CustomTextWidget(
                        text: individualWorkout?.isActive ?? false ? "ativado" : "desativado",
                        color: individualWorkout?.isActive ?? false ? AppColors.green : AppColors.lightGrey,
                        fontWeight:
                            individualWorkout?.isActive ?? false ? FontWeight.w700 : FontWeight.w500)
                  ],
                )
              ],
            ),
            Spacer(),
           IconButton(
                onPressed: onCheck,
                  icon: Icon(individualWorkout?.isActive ?? false
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank_rounded,
                  color: individualWorkout?.isActive ?? false ? AppColors.green : AppColors.lightGrey)),
            
          ]),
        ),
      ),
    );
  }
}
