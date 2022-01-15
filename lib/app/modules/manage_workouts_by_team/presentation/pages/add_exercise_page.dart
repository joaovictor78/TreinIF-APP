import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/components/custom_drop_down_widget.dart';
import '/app/core/components/custom_input_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/modules/manage_workouts_by_team/controllers/add_exercise_controller.dart';
import '/app/core/components/custom_back_button_widget.dart';
import '/app/core/styles/app_colors.dart';

class AddExercisePage extends GetView<AddExerciseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: CustomBackButtonWidget()),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextWidget(text: "Novo exercicio", fontSize: 18)),
                  SizedBox(
                    height: 20,
                  ),
                  CustomDropdownButton(
                    margin: EdgeInsets.only(left: 30, right: 200, top: 10),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.sports_kabaddi_rounded,
                          color: Colors.white),
                    ),
                    dropdownColor: Colors.yellow,
                    value: null,
                    onPressed: () {
                      log("çlkfjasçdlfkjasd");
                      Get.toNamed("/manage_exercises_types");
                    },
                    onChanged: (String? blood) {},
                    style: GoogleFonts.poppins(fontSize: 14),
                    isDense: true,
                    hint: Text("Exercicios"),
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "A+",
                        ),
                        value: "A+",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "A+",
                        ),
                        value: "A+",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "A+",
                        ),
                        value: "A+",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "A+",
                        ),
                        value: "A+",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "A+",
                        ),
                        value: "A+",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "A-",
                        ),
                        value: "A-",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "B+",
                        ),
                        value: "B+",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "B-",
                        ),
                        value: "B-",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomInputWidget(
                    horizontalPadding: 0,
                    hintText: "Numero de Séries",
                  ),
                  CustomInputWidget(
                    horizontalPadding: 0,
                    hintText: "Tempo de repetição",
                  ),
                  CustomInputWidget(
                    horizontalPadding: 0,
                    hintText: "Variação do exercicio",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(
                        width: 10,
                      ),
                      CustomTextWidget(
                          text:
                              "Selecione os dias da semana que\nocorrerá o exercício:")
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                        children: controller.daysOfWeek
                            .map((element) => _dayOfWeekComponent(
                                element.isActive!, element.name!))
                            .toList()),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonWidget(
                      text: "Adicionar",
                      color: AppColors.mediumGreen,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                    ),
                    CustomButtonWidget(
                      text: "Cancelar",
                      color: AppColors.red,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

Widget _dayOfWeekComponent(bool isSelected, String dayOfWeek) {
  return Container(
    width: 110,
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 1),
    child: Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color:
                    isSelected ? AppColors.mediumGreen : AppColors.mediumGrey,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(width: 10),
        CustomTextWidget(text: dayOfWeek)
      ],
    ),
  );
}
