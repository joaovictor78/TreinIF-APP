import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:treinif/app/core/components/custom_calendar.dart';
import 'package:treinif/app/core/components/custom_workout_card_widget.dart';
import '/app/core/components/custom_card_widget.dart';
import '/app/modules/manage_workouts_by_team/controllers/manage_workout_controller.dart';
import '/app/core/components/custom_tab_item_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/components/custom_back_button_widget.dart';
import '/app/core/styles/app_colors.dart';

class ManageWorkoutPage extends GetView<ManageWorkoutController> {
  const ManageWorkoutPage({Key? key}) : super(key: key);

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
                child: Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(text: "Equipe: Name", fontSize: 20),
                        CustomTextWidget(text: "Código: #####:", fontSize: 15),
                        Obx(() => Padding(
                              padding: const EdgeInsets.only(top: 18),
                              child: Row(
                                children: [
                                  CustomTabItemWidget(
                                      "Equipe",
                                      controller.currentIndex.value,
                                      0, (index) {
                                    controller.changePage(index);
                                  }),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  CustomTabItemWidget(
                                      "Atletas",
                                      controller.currentIndex.value,
                                      1, (index) {
                                    controller.changePage(index);
                                  }),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: PageView(
                        controller: controller.pageController,
                        onPageChanged: (index) {
                          controller.changePage(index);
                        },
                        children: [
                          trainingListByTeam(),
                          RefreshIndicator(
                            color: AppColors.lightBlue,
                            onRefresh: () async {},
                            child:
                                ListView.builder(itemBuilder: (context, index) {
                              return CustomListTileWidget();
                            }),
                          ),
                        ],
                      ),
                    ),
                  )
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
                onPressed: () {},
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
            onDateSelected: (DateTime data) => {},
            dateTileBuilder: dateTileBuilder,
            iconColor: Colors.black,
            monthNameWidget: _monthNameWidget,
          ),
        ),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => CustomWorkoutWidget(),
                separatorBuilder: (context, index) =>
                    Padding(padding: EdgeInsets.all(10)),
                itemCount: 6))
      ]));
}
