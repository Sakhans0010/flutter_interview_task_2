import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../Data Models/home_data_response_model.dart';
import '../Repositories/home_date_repository.dart';

class HomeController extends GetxController {
  HomeDataResponseModel? homeDataResponseModel;

  var airQuality = ''.obs;

  double? latitude;
  double? longitude;

  // @override
  // void onInit() {
  //   fetchAndSetData();
  //   super.onInit();
  // }

  Future fetchAndSetData() async {
    var response = await HomeDataRepository().getData(
      latitude: latitude,
      longitude: longitude,
    );
    // print(response);
    homeDataResponseModel = HomeDataResponseModel.fromJson(response['data']);

    var airQualityInFigure = homeDataResponseModel!.current!.pollution!.aqius;

    if (airQualityInFigure! < 50) {
      airQuality.value = 'Satisfactory';
    } else if (airQualityInFigure > 50 && airQualityInFigure < 100) {
      airQuality.value = 'harmful';
    } else {
      airQuality.value = 'Extremely Harmful';
    }

    return response;
  }

  setUserPosition(Position position) {
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
