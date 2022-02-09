import 'package:flutter/material.dart';
import '/app/core/components/custom_paint_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(builder: (context, constrains) {
          return  Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: constrains.maxHeight * .43,
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
                                  horizontal: 20, vertical: 2),
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
                                           ""),
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
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextWidget(
                                              text:  "",
                                              color: AppColors.primaryColor),
                                          CustomTextWidget(
                                              text:  "",
                                              color: AppColors.primaryColor),
                                        ]),
                                  )
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                           // AthleteDataCardComponent(controller.athleteEntity)
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
               
              ],
            );
          });
  }
}