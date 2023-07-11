import 'package:get/get.dart';
import 'package:uaspmobile/app/data/student_provider.dart';
import 'package:uaspmobile/app/data/student_provider.dart';

class HomeController extends GetxController {
  RxList<Map<String, dynamic>> listData = <Map<String, dynamic>>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    listData.clear();
    isLoading.value = true;
    try {
      final response = await StudentProvider().getAll();
      final List<dynamic> jsonResponse = response.body;

      listData.assignAll(jsonResponse.map((value) {
        return {
          "nama": value['nama'],
          "tinggi_meter": value['tinggi_meter'],
        };
      }).toList());
    } catch (error) {
      print('Error fetching data: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
