import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/athlete_profile/controllers/athlete_profile_controller.dart';
import '/app/modules/athlete_profile/presentation/components/athlete_data_point_indicator_component.dart';
import '/app/core/components/custom_text_widget.dart';

class AthletesHistoryComponent extends StatelessWidget {
  AthleteProfileController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 20),
          child: CustomTextWidget(text: "Histórico do Atleta"),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                  
                return InkWell(
                  onTap: (){
                     if(controller.currentIndex.value == 0) {
                  Get.toNamed("/athlete_profile/historic");
                  }
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 60, child: AthleteDataPointIndicatorComponent()),
                      SizedBox(width: 7),
                      Container(
                        height: 130,
                        width: 20,
                        child: Stack(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                                margin: index == 0
                                    ? EdgeInsets.only(top: 10)
                                    : EdgeInsets.zero,
                                height: 200,
                                color: Colors.white),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: ShapeDecoration(
                                shape: CircleBorder(),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 250,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: AppColors.lightGrey))),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                CustomTextWidget(text: "Data 00/00/0000"),
                                SizedBox(height: 10),
                                CustomTextWidget(text: "pressão 0000"),
                                CustomTextWidget(text: "peso 67kg"),
                                CustomTextWidget(text: "altura 1.78m"),
                                CustomTextWidget(
                                  text: "ver mais + 9 items",
                                  fontWeight: FontWeight.w600,
                                )
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.chevron_right_rounded)
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        ))
      ],
    );
  }
}
