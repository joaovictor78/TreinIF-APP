import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/components/custom_input_widget.dart';
import '/app/modules/manage_workouts_by_team/controllers/list_workouts_by_team_controller.dart';
import '/app/core/components/custom_back_button_widget.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/components/custom_workout_check_card_widget.dart';
import '/app/core/styles/app_colors.dart';

class ListWorkoutsByTeamPage extends GetView<ListWorkoutsOfTeamController> {
  const ListWorkoutsByTeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: CustomBackButtonWidget()),
      bottomSheet: Container(
        color: AppColors.darkGrey,
        height: 80,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
          child: CustomButtonWidget(
              text: "ADICIONAR UM NOVO TREINO",
              onPressed: () {
                showDialog(context);
              }),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CustomTextWidget(text: "Equipe: Name1", fontSize: 20),
              SizedBox(
                width: 10,
              ),
              CustomTextWidget(
                text: "#dasdAA",
                fontSize: 19,
              ),
            ],
          ),
          CustomTextWidget(text: "Treinos Cadastrados", fontSize: 17),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.separated(
                shrinkWrap: true,
                itemCount: 2,
                separatorBuilder: (BuildContext context, int index) =>
                    Padding(padding: EdgeInsets.all(7)),
                itemBuilder: (context, index) {
                  return CustomWorkoutCheckCardWidget(
                    onTap: (){
                      Get.toNamed("/manage_workout");
                    },
                  );
                }),
          ))
        ]),
      ),
    );
  }
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
            color: Colors.transparent,
            child: Container(
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 16, bottom: 10),
                      child:
                          CustomTextWidget(text: "Novo Treino", fontSize: 19),
                    ),
                    CustomInputWidget(
                      hintText: "Informe o nome do treino",
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
