import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinif/app/modules/athlete_profile/domain/entities/data_point_of_%20athlete_historic_entity.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/athlete_profile/controllers/athlete_profile_controller.dart';
import '/app/modules/athlete_profile/presentation/components/athlete_data_point_indicator_component.dart';
import '/app/core/components/custom_text_widget.dart';

class AthletesHistoryComponent extends StatelessWidget {
  AthleteProfileController _athleteProfileController = Get.find<AthleteProfileController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20),
            child: CustomTextWidget(text: "Histórico do Atleta"),
          ),
          Expanded(
              child: _athleteProfileController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: 10),
                          itemCount: _athleteProfileController.dataPoints.length,
                          itemBuilder: (context, index) {
                            DataPointOfAthleteHistoricEntity _dataPoint = _athleteProfileController.dataPoints[index];
                            return InkWell(
                              onTap: () {
                                if (_athleteProfileController
                                        .currentIndex.value ==
                                    0) {
                                  Map _data = {};
                                  _data["id"] = Get.arguments.id;
                                  _data["historic"] = _dataPoint;
                                  Get.toNamed("/athlete_profile/historic", arguments: _data);
                                }
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 60,
                                      child:
                                          AthleteDataPointIndicatorComponent()),
                                  SizedBox(width: 7),
                                  Container(
                                    height: 130,
                                    width: 20,
                                    child: Stack(children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
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
                                            bottom: BorderSide(
                                                color: AppColors.lightGrey))),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 20),
                                            CustomTextWidget(
                                                text: "Data ${_dataPoint.date}"),
                                            SizedBox(height: 10),
                                          ((){
                                            if(_dataPoint.values!.length > 3){
                                              return   CustomTextWidget(
                                              text: "ver mais + ${_dataPoint.values!.length - 3} items",
                                              fontWeight: FontWeight.w600,
                                            );
                                            }
                                            return CustomTextWidget(
                                                text: "pressão 0000");
                                          }())
                                          
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
    });
  }
}
