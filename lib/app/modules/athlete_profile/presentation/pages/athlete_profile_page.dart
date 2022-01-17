import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinif/app/domain/entitities/athlete_entity.dart';
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
    return Obx(() {
      return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          bottomNavigationBar: Container(
            color: Color(0xff3F414F),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: CustomButtonWidget(
              onPressed: (){
             
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
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: CustomBackButtonWidget(color: AppColors.primaryColor)),
          body: LayoutBuilder(builder: (context, constrains) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: constrains.maxHeight * .45,
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
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                backgroundColor: MaterialStateProperty.all(
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
                                  text: "Histórico do Atleta", color: controller.currentIndex.value == 0
                                        ? AppColors.primaryColor
                                        : Colors.white)),
                          SizedBox(width: 10),
                          OutlinedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
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
                              child: CustomTextWidget(text: "Treinos", color: controller.currentIndex.value == 1
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
                      AthletesHistoryComponent(),
                      AthleteWorkoutsComponent()
                    ],
                  ),
                )
              ],
            );
          }));
    });
  }
}
