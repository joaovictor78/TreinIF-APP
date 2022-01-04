import 'package:flutter/material.dart';
import 'package:treinif/app/core/components/custom_text_widget.dart';
import 'package:treinif/app/core/styles/app_colors.dart';

class CustomWorkoutCheckCardWidget extends StatelessWidget {
  CustomWorkoutCheckCardWidget({this.onTap, Key? key}) : super(key: key);
  bool isActive = true;
  void Function()? onTap;
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
                CustomTextWidget(text: "Treino1"),
                Row(
                  children: [
                    CustomTextWidget(text: "status do treino: ", fontWeight:
                            isActive ? FontWeight.normal: FontWeight.w300),
                    CustomTextWidget(
                        text: isActive ? "ativado" : "desativado",
                        color: isActive ? AppColors.green : AppColors.lightGrey,
                        fontWeight:
                            isActive ? FontWeight.w700 : FontWeight.w500)
                  ],
                )
              ],
            ),
            Spacer(),
           IconButton(
                onPressed: (){},
                  icon: Icon(isActive
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank_rounded,
                  color: isActive ? AppColors.green : AppColors.lightGrey)),
            
          ]),
        ),
      ),
    );
  }
}
