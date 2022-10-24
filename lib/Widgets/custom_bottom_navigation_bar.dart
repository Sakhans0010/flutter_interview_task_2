import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Constants/colors.dart';
import '../Controllers/main_controller.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.put(
      MainController(),
      permanent: false,
    );
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => mainController.changeTabIndex(0),
            icon: Icon(
              Icons.location_on,
              color: mainController.tabIndex.value == 0
                  ? AppColors.kSecondaryColor
                  : Colors.grey.shade500,
            ),
          ),
          MaterialButton(
            onPressed: () => mainController.changeTabIndex(1),
            shape: CircleBorder(
              side: BorderSide(
                color: mainController.tabIndex.value == 1
                    ? AppColors.kSecondaryColor
                    : Colors.grey,
                width: 8,
              ),
            ),
          ),
          IconButton(
            onPressed: () => mainController.changeTabIndex(2),
            icon: Icon(
              Icons.settings,
              color: mainController.tabIndex.value == 2
                  ? AppColors.kSecondaryColor
                  : Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
