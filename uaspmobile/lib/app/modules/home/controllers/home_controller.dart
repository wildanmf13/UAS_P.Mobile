import 'package:get/get.dart';
import 'package:uaspmobile/app/data/student_provider.dart';

class HomeController extends GetxController {
  RxList<Map<String, dynamic>> listData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      final response = await StudentProvider().getAll();
      final List<dynamic> jsonResponse = response.body;

      listData.assignAll(jsonResponse.map((value) {
        return {
          "nama": value['nama'],
          "tinggi_meter": value['tinggi_meter'],
        };
      }));
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
}
