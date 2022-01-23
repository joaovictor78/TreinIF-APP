import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/modules/start/submodules/home/home_controller.dart';
import '/app/core/styles/app_colors.dart';

class CarrouselBannerCardComponent extends StatelessWidget {
  HomeController controller = Get.find<HomeController>();
  var listSlide = [
    {"id": 1, "image": "afjsdçlk"},
    {"id": 2, "image": "çlkjdfsçalkf"},
    {"id": 3, "image": "ldkjasçf"}
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      color: AppColors.primaryColor,
      width: double.infinity,
      height: orientation != Orientation.landscape
          ? (size.height / size.width) * 80
          : (size.width / size.height) * 80,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: listSlide.length,
                controller: controller.pageController,
                onPageChanged: (value) {
                  controller.animationController.forward();
                },
                itemBuilder: (context, currentIndex) {
                  var banner = listSlide[currentIndex];
                  return Obx(() {
                    bool isSelected = banner["id"] ==
                        controller.carrouselBannerCurrentPage.value;
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      height: isSelected ? 20 : 5,
                      color: isSelected ? Colors.blue : Colors.black,
                    );
                  });
                }),
          ),
          _buildBollets()
        ],
      ),
    );
  }

  Widget _buildBollets() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Obx(() {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listSlide.map((element) {
              bool isActivetedBollet =
                  controller.carrouselBannerCurrentPage.value ==
                      ((element["id"] as int) - 1);
              return Container(
                width: isActivetedBollet ? 20 : 10,
                height: isActivetedBollet ? 20 : 10,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: isActivetedBollet
                        ? AppColors.mediumGreen
                        : AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(30)),
              );
            }).toList());
      }),
    );
  }
}
