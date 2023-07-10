import 'package:get/get.dart';

class StudentProvider extends GetConnect {
  Future<Response<dynamic>> getAll() async {
    return get('https://indonesia-public-static-api.vercel.app/api/volcanoes');
  }
}
