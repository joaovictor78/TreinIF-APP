import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinif/app/core/components/custom_input_widget.dart';
import '/app/domain/entitities/athlete_entity.dart';
import '/app/core/components/custom_back_button_widget.dart';
import '/app/core/components/custom_paint_widget.dart';
import '/app/core/styles/app_colors.dart';
import "/app/modules/athlete_profile/presentation/components/athlete's_history_component.dart";
import '/app/modules/athlete_profile/presentation/components/athlete_data_card_component.dart';
import '/app/modules/athlete_profile/presentation/components/athlete_workouts_component.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/modules/athlete_profile/controllers/athlete_profile_controller.dart';

class AthleteProfilePage extends GetView<AthleteProfileController> {
  AthleteEntity _athleteEntity = Get.arguments;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: controller.key,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: CustomBackButtonWidget(color: AppColors.primaryColor)),
        body: LayoutBuilder(builder: (context, constrains) {
          return Obx(() {
            return Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: constrains.maxHeight * .40,
                        child: CustomPaintWidget(
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.only(left: 28, top: 10),
                              alignment: Alignment.centerLeft,
                              child: CustomTextWidget(
                                  text: "Perfil do Atleta",
                                  fontSize: 19,
                                  color: AppColors.primaryColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff7c94b6),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            _athleteEntity.avatarUrl ?? ""),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50.0)),
                                      border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 4.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextWidget(
                                              text: _athleteEntity.name ?? "",
                                              color: AppColors.primaryColor),
                                          CustomTextWidget(
                                              text: _athleteEntity.email ?? "",
                                              color: AppColors.primaryColor),
                                        ]),
                                  )
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            AthleteDataCardComponent(_athleteEntity)
                          ]),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: constrains.maxHeight * 0.1,
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                OutlinedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              controller.currentIndex.value == 0
                                                  ? AppColors.lightBlue
                                                  : null),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0))),
                                    ),
                                    onPressed: () {
                                      controller.changePage(0);
                                    },
                                    child: CustomTextWidget(
                                        text: "Histórico do Atleta",
                                        color:
                                            controller.currentIndex.value == 0
                                                ? AppColors.primaryColor
                                                : Colors.white)),
                                SizedBox(width: 10),
                                OutlinedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              controller.currentIndex.value == 1
                                                  ? AppColors.lightBlue
                                                  : null),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0))),
                                    ),
                                    onPressed: () {
                                      controller.changePage(1);
                                    },
                                    child: CustomTextWidget(
                                        text: "Treinos",
                                        color:
                                            controller.currentIndex.value == 1
                                                ? AppColors.primaryColor
                                                : Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: constrains.maxHeight * .41,
                        child: PageView(
                          controller: controller.pageController,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            AthletesHistoryComponent(
                              onDeleted: (){

                              },
                              onEditable: (){
                                showDialogToAddDataPoint(context, true);
                              },
                            ),
                            AthleteWorkoutsComponent()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 85,
                    alignment: Alignment.bottomCenter,
                    color: Color(0xff3F414F),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: CustomButtonWidget(
                      onPressed: () {
                        if (controller.currentIndex.value == 0) {
                          showDialogToAddDataPoint(context);
                        } 
                        if(controller.currentIndex.value == 1){
                          showDialogToAddNewWorkout(context);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextWidget(
                            text: controller.currentIndex.value == 0
                                ? "Adicionar Novo Historico"
                                : "Adicionar Novo Treino",
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
        }));
  }
  void showDialogToAddNewWorkout(BuildContext context, [bool isEditable = false]) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "",
      context: context,
      pageBuilder: (_, __, ___) {
        if(!isEditable) controller.workoutNameTextController?.clear();
        return Container(
            padding: EdgeInsets.all(40),
            alignment: Alignment.center,
            child: Material(
              color: AppColors.primaryColor.withAlpha(3),
              child: Container(
                  height: isEditable ? 250 : 310,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 16),
                        child: CustomTextWidget(
                            text: isEditable
                                ? "Editar nome do treino"
                                : "Adicionar novo treino",
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: CustomTextWidget(text: "Nome :", fontSize: 14),
                      ),
                      CustomInputWidget(
                          controller: controller.workoutNameTextController,
                          hintText: "Ex: Treino1",
                          icon: Icons.sports_volleyball_sharp),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomButtonWidget(
                              text: isEditable ? "Confirmar" : "Adicionar",
                              onPressed: () {
                                //controller.addValueDataPoint(athleteID, _dataPoint.id!);
                              },
                              color: AppColors.mediumGreen,
                              padding: EdgeInsets.symmetric(horizontal: 25),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            CustomButtonWidget(
                              text: "Cancelar",
                              color: AppColors.red,
                              padding: EdgeInsets.symmetric(horizontal: 25),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(20),
                  )),
            ));
      },
    );
  }
  void showDialogToAddDataPoint(BuildContext context, [bool isEditable = false]) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "",
      context: context,
      pageBuilder: (_, __, ___) {
         if(!isEditable) controller.dateDataPointTextController?.clear();
        return Container(
            padding: EdgeInsets.all(40),
            alignment: Alignment.center,
            child: Material(
              color: AppColors.primaryColor.withAlpha(3),
              child: Container(
                  height: isEditable ? 250 : 310,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 16),
                        child: CustomTextWidget(
                            text: isEditable
                                ? "Editar ponto de dado"
                                : "Adicionar novo ponto de dado",
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, top: 5, bottom: 10),
                        child: isEditable
                            ? Container()
                            : CustomTextWidget(
                                text:
                                    "Atraves do ponto de dados, você poderá\ncontrolar a evolução de variaveis como peso, altura etc: ",
                                fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: CustomTextWidget(text: "Data :", fontSize: 14),
                      ),
                      CustomInputWidget(
                          controller: controller.dateDataPointTextController,
                          hintText: "Ex: 00/00/0000",
                          icon: Icons.date_range_outlined),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomButtonWidget(
                              text: isEditable ? "Confirmar" : "Adicionar",
                              onPressed: () {
                                //controller.addValueDataPoint(athleteID, _dataPoint.id!);
                              },
                              color: AppColors.mediumGreen,
                              padding: EdgeInsets.symmetric(horizontal: 25),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            CustomButtonWidget(
                              text: "Cancelar",
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              color: AppColors.red,
                              padding: EdgeInsets.symmetric(horizontal: 25),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(20),
                  )),
            ));
      },
    );
  }
}
