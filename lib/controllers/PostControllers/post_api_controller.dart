import 'package:dio/dio.dart' as myDio;
import 'package:get/get.dart';
import '../../utils/api_exception.dart';

class PostApiController extends GetxController {
  final dio = myDio.Dio();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dio.options.followRedirects = true;
    dio.options.maxRedirects = 3;
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
      // Handle Dio errors, network issues, or other exceptions here.
      throw ApiException('An error occurred: $e', 0);
    }
  }
}
