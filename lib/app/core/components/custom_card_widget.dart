import 'package:flutter/material.dart';
import 'package:treinif/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';

class CustomListTileWidget extends StatelessWidget {
  CustomListTileWidget({this.onTap, Key? key}) : super(key: key);
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mediumGrey.withAlpha(250),
      ),
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 8, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    backgroundColor: AppColors.lightGrey,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        'https://img.r7.com/imag/afp-presidente-jair-bolsonaro-02122021180916996?dimensions=771x420',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (context, object, trace) {
                          return Center(
                            child: CustomTextWidget(text: "A"),
                          );
                        },
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(text: "Ana Julia"),
                      CustomTextWidget(
                        text: "Equipe: C",
                        fontSize: 10,
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomTextWidget(
                      text: "Modalidade: Atletismo", fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
