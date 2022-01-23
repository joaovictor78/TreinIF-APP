import 'package:flutter/material.dart';
import 'package:treinif/app/core/components/custom_text_widget.dart';
import 'package:treinif/app/core/styles/app_colors.dart';

class SquareWithRoundedBorderCardComponent extends StatelessWidget {
  SquareWithRoundedBorderCardComponent({this.iconData, this.title, this.onTap});
  IconData? iconData;
  String? title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    double cardSize = orientation != Orientation.landscape
        ? (size.height / size.width) * 90
        : (size.width / size.height) * 90;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: cardSize,
        width: cardSize,
        child: Card(
          elevation: 7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Icon(iconData,
                      color: AppColors.secondaryColor,
                      size: orientation != Orientation.landscape
                          ? (size.height / size.width) * 30
                          : (size.width / size.height) * 30),
                ),
                CustomTextWidget(
                    text: title ?? "",
                    textAlign: TextAlign.center)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
