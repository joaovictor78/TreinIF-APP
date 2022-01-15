import 'package:flutter/material.dart';
import 'package:treinif/app/core/components/custom_text_widget.dart';
import 'package:treinif/app/core/styles/app_colors.dart';

class CustomWorkoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [CustomTextWidget(text: "Nome do Exercicio"), CustomTextWidget(text: "Numero de serie"), CustomTextWidget(text: "Tempo de repetição"), CustomTextWidget(text: "Variação do exercicio")],
          ),
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColors.mediumGrey),
    );
  }
}
