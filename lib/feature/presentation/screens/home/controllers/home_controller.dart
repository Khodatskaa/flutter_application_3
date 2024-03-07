import 'package:flutter_application_3/feature/data/local/local_data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString selectedLocation = 'New York'.obs;

  RxBool isLoading = false.obs;

  RxList<String> popularPlaces = <String>[].obs;

  RxMap buttonTextMap = {}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPopularPlaces();
  }

  void fetchPopularPlaces() {
    isLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      popularPlaces.assignAll(LocalData.getPopularPlaces());
      isLoading.value = false;
    });
  }

  void changeButtonState(String buttonText) {
    buttonTextMap.update(buttonText, (value) => !value, ifAbsent: () => true);
  }
}
