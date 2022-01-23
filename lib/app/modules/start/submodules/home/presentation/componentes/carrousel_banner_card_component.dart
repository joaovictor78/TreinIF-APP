import 'package:flutter/material.dart';
import 'package:treinif/app/core/styles/app_colors.dart';

class CarrouselBannerCardComponent extends StatefulWidget {
  const CarrouselBannerCardComponent({Key? key}) : super(key: key);

  @override
  _CarrouselBannerCardComponentState createState() =>
      _CarrouselBannerCardComponentState();
}

class _CarrouselBannerCardComponentState
    extends State<CarrouselBannerCardComponent> {
  var listSlide = [{ "id": 1, "image": "afjsdçlk"}, {  "id": 2, "image": "çlkjdfsçalkf"}, { "id": 3, "image": "ldkjasçf"}];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      color: AppColors.primaryColor,
      width: double.infinity,
      height:  orientation != Orientation.landscape
          ? (size.height / size.width) * 80
          : (size.width / size.height) * 80,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: listSlide.length,
                itemBuilder: (context, currentIndex) {
                  return Container(child: Card());
                }),
          ),
          _buildBollets()
        ],
      ),
    );
  }
  Widget _buildBollets(){
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listSlide.map((element) =>    Container(
            width: 10,
            height: 10,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(30)
            ),
          )).toList()
      ),
    );
  }
}
