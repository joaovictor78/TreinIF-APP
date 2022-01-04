import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:treinif/app/core/styles/app_colors.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/modules/start/submodules/home/domain/entities/athletes_entity.dart';
import '/app/modules/start/submodules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          //buildMap(),
          // buildBottomNavigationBar(),
          buildFloatingSearchBar(context),
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search...',
      hintStyle: GoogleFonts.poppins(color: Colors.white),
      scrollPadding: const EdgeInsets.only(top: 0, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        controller.searchAthletes(query);
      },
      transition: CircularFloatingSearchBarTransition(),
      automaticallyImplyBackButton: false,
      leadingActions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search_sharp),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      actions: [],
      builder: (context, transition) {
        return Obx(
          () => Material(
            color: Colors.transparent,
            child: ListView.builder(
              itemCount: controller.athletes.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                AthleteEntity athlete = controller.athletes[index];
                return ListTile(
                  tileColor: AppColors.lightGrey,
                  title: CustomTextWidget(text: athlete.name ?? ""),
                  subtitle: CustomTextWidget(text: athlete.email ?? ""),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
