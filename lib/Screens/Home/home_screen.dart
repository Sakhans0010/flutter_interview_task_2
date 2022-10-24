import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../Config/size_config.dart';
import '../../Constants/colors.dart';
import '../../Controllers/home_controller.dart';
import '../../Providers/home_data_provider.dart';
import '../../Widgets/spacers.dart';
import 'components/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final home = Get.put(HomeController());

  Position? _position;

  bool _isLoading = false;
  bool _hasGotError = false;

  @override
  void initState() {
    // fetchData();
    super.initState();
  }

  Future fetchData() async {
    try {
      await getUserCurrentLocation();

      var response = await
          // Provider.of<HomeDataProvider>(context, listen: false)
          home.fetchAndSetData(
              // context: context,
              // latitude: _position!.latitude,
              // longitude: _position!.longitude,
              );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getUserCurrentLocation() async {
    // print('object');
    if (await Permission.location.serviceStatus.isEnabled) {
    } else {
      openAppSettings();
    }
    var status = await Permission.location.status;

    if (status.isPermanentlyDenied) return;
    status = await Permission.location.request();

    var position = await Geolocator.getCurrentPosition(
        // desiredAccuracy: LocationAccuracy.high,
        );
    home.setUserPosition(position);
    // Provider.of<HomeDataProvider>(context, listen: false)
    //     .setUserPosition(position);

    _position = position;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _loaderWidget();
          }
          if (snapshot.hasError) {
            return _errorWidget();
          }

          return HomeBody();
        });
  }

  Center _loaderWidget() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.kSecondaryColor,
      ),
    );
  }

  Center _errorWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'An Error Occurred. Please Check your internet connection and Try again.',
            ),
            verticalSpacer(20),
            MaterialButton(
              onPressed: () {},
              color: AppColors.kSecondaryColor,
              textColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Try Again',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
