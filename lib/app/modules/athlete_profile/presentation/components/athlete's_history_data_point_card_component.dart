import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/app/core/styles/app_colors.dart';
import '/app/core/components/custom_text_widget.dart';

class AthletesHistoryDataPointCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.mediumGrey, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          CustomTextWidget(text: "Pressão"),
          SizedBox(width: 6),
          CustomTextWidget(text: "0000"),
          Spacer(),
          IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.edit_rounded)),
          IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
