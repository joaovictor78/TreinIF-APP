import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '/app/modules/manage_individual_workout/controllers/manage_individual_workout_controller.dart';
import '/app/core/components/custom_calendar.dart';
import '/app/core/components/custom_workout_card_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/components/custom_back_button_widget.dart';
import '/app/core/styles/app_colors.dart';

class ManageIndividualWorkoutPage
    extends GetView<ManageIndividualWorkoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: CustomBackButtonWidget()),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 27),
                        child: CustomTextWidget(
                            text: "Treino Individual", fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 27),
                        child: CustomTextWidget(
                            text: "Atleta: Joao Victor", fontSize: 15),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      trainingListByTeam()
                    ]))));
  }
}

Widget trainingListByTeam() {
  DateTime startDate = DateTime.now().subtract(Duration(days: 360));
  DateTime endDate = DateTime.now().add(Duration(days: 360));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 2));

  _monthNameWidget(monthName) {
    return Container(
      child: Text(
        monthName,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontStyle: FontStyle.italic,
        ),
      ),
      padding: EdgeInsets.only(top: 8, bottom: 4),
    );
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.white : Colors.white;
    TextStyle normalStyle =
        TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: 17, fontWeight: FontWeight.w800, color: Colors.black);
    TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);
    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
          color: !isSelectedDate ? Colors.transparent : AppColors.lightBlue,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: _children,
      ),
    );
  }

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(
                text: "Treino", fontSize: 15, fontWeight: FontWeight.w600),
            OutlinedButton(
                child: CustomTextWidget(text: "Adicionar exercícios"),
                onPressed: () {
                  Get.toNamed("/add_exercise");
                },
                style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1.0, color: Colors.white))),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: CalendarStrip(
            containerHeight: 100,
            startDate: startDate,
            endDate: endDate,
            selectedDate: selectedDate,
            onDateSelected: (DateTime data) => {
               print(DateFormat('EEEE').format(data))
            },
            dateTileBuilder: dateTileBuilder,
            iconColor: Colors.black,
            monthNameWidget: _monthNameWidget,
          ),
        ),
        ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => CustomWorkoutWidget(),
            separatorBuilder: (context, index) =>
                Padding(padding: EdgeInsets.all(10)),
            itemCount: 2)
      ]));
}
