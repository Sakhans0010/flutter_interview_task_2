import 'package:flutter/material.dart';
import 'package:flutter_interview_task_2/Constants/colors.dart';
import 'package:get/get.dart';

class DialogBoxes {
  //show error dialog
  static void showErroDialog(
      {String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.headline4,
              ),
              Text(
                description ?? '',
                // style:  Theme.of(context!).textTheme.bodyMedium!.copyWith(
                //                   fontWeight: FontWeight.bold,
                //                 ),,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                  // Navigator.of(Get.context!).pop();
                },
                child: const Text(
                  'Okay',
                  style: TextStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show toast
  //show snack bar
  //show loading
  static Future<void> showLoading([String? message]) async {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
    Navigator.of(Get.context!).pop();
  }

  static Future<void> openLoadingDialog() async {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Color(0xFF4990E1),
              color: AppColors.kSecondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
