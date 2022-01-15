import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/components/custom_input_widget.dart';
import '/app/core/styles/app_colors.dart';
import '/app/core/components/custom_text_widget.dart';
import "/app/modules/athlete_profile/presentation/components/athlete's_history_data_point_card_component.dart";
import '/app/core/components/custom_back_button_widget.dart';

class HistoricOfAthletePage extends StatelessWidget {
  const HistoricOfAthletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: CustomBackButtonWidget()),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
              child: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                showDialog(context);
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              CustomTextWidget(text: "Historico do Atleta", fontSize: 18),
              CustomTextWidget(text: "Data 00/00/0000"),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return AthletesHistoryDataPointCard();
                }),
              )
            ],
          ),
        ));
  }

  void showDialog(BuildContext context) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "",
      context: context,
      pageBuilder: (_, __, ___) {
        return Container(
            padding: EdgeInsets.all(40),
            alignment: Alignment.center,
            child: Material(
              color: AppColors.primaryColor.withAlpha(3),
              child: Container(
                  height: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 16),
                        child: CustomTextWidget(
                            text: "Adicionar novo dado",
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, top: 5, bottom: 10),
                        child: CustomTextWidget(
                            text: "Informe o tipo e o valor: ", fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: CustomTextWidget(text: "Tipo:", fontSize: 14),
                      ),
                      CustomInputWidget(
                        hintText: "Ex: Pressão",
                        icon: Icons.text_fields_rounded,
                      ),
                       Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: CustomTextWidget(text: "Valor:", fontSize: 14),
                      ),
                      CustomInputWidget(
                        icon: Icons.assignment,
                        hintText: "8mmHg",
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomButtonWidget(
                              text: "Adicionar",
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
}
