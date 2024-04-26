import 'package:dio/dio.dart' as myDio;
import 'package:get/get.dart';
import '../../utils/api_exception.dart';

class GetApiController extends GetxController {
  final dio = myDio.Dio();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<myDio.Response> getControllers(String url) async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw ApiException(
            'Failed to fetch data from $url', response.statusCode!);
      }
    } catch (e) {
      // Handle Dio errors, network issues, or other exceptions here.
      throw ApiException('An error occurred: $e', 0);
    }
  }
}