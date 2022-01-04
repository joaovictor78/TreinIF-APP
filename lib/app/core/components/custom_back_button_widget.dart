import 'package:flutter/material.dart';
import 'package:treinif/app/core/components/custom_text_widget.dart';

class CustomBackButtonWidget extends StatelessWidget {
  const CustomBackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
        child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          decoration:
              BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white)),
          child: ClipOval(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(Icons.arrow_back, size: 25,),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        CustomTextWidget(text: "Voltar", fontSize: 15,)
      ],
    ));
  }
}
