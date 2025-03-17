import 'package:dio/dio.dart' as myDio;
import 'package:get/get.dart';
import '../../utils/api_exception.dart';

class PostApiController extends GetxController {
  final dio = myDio.Dio();

  @override
  void onInit() {
    super.onInit();
    dio.options.followRedirects = true;
    dio.options.validateStatus = (status) {
      return status != null && status < 500; // Accept status codes < 500
    };
    dio.options.connectTimeout = const Duration(seconds: 900);
    dio.options.receiveTimeout = const Duration(seconds: 900);
  }

  Future<myDio.Response> postControllers(String url, dynamic data) async {
    try {
      final response = await dio.post(url, data: data);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw ApiException(
            'Failed to fetch data from $url', response.statusCode!);
      }
    } catch (e) {
      print(e);
      throw ApiException('An error occurred: $e', 0);
    }
  }
}