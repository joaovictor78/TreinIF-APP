import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '/app/core/components/custom_tab_item_widget.dart';
import '/app/core/styles/app_images.dart';
import '/app/core/components/custom_card_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/start/submodules/workouts/controllers/workouts_controller.dart';

class WorkoutsPage extends GetView<WorkoutsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AppImages.logoLight),
          )
        ]
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add, color: Colors.white), onPressed: () {
            Get.toNamed('/create_team');
          }),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(text: "Treinos cadastrados", fontSize: 20),
            CustomTextWidget(text: "Selecionar treino por:", fontSize: 13),
            Obx(() => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                    children: [
                      CustomTabItemWidget("Equipe", controller.currentIndex.value, 0, (index) {
                        controller.changePage(index);
                        controller.getAllTeamsByWorkoutsUseCase();
                      }),
                      SizedBox(
                        width: 20,
                      ),
                      CustomTabItemWidget("Individual", controller.currentIndex.value, 1, (index) {
                        controller.changePage(index);
                        controller.getAllAthletesByIndividualWorkouts();
                      }),
                    ],
                  ),
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    controller.changePage(index);
                  },
                  children: [
                    RefreshIndicator(
                      color: AppColors.lightBlue,
                      onRefresh: ()async{},
                      child: ListView.builder(itemBuilder: (context, index) {
                        return CustomListTileWidget(
                          onTap: (){
                            Get.toNamed("/list_workouts_by_team");
                          },
                        );
                      }),
                    ),
                     RefreshIndicator(
                      color: AppColors.lightBlue,
                      onRefresh: ()async{},
                      child: ListView.builder(itemBuilder: (context, index) {
                        return CustomListTileWidget();
                      }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

