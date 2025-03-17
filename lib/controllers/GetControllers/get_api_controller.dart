import 'package:dio/dio.dart' as myDio;
import 'package:get/get.dart';
import '../../utils/api_exception.dart';

class GetApiController extends GetxController {
  final myDio.Dio dio = myDio.Dio();

  @override
  void onInit() {
    super.onInit();
    dio.options = myDio.BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
  }

  Future<myDio.Response> getControllers(String url) async {
    try {
      final response = await dio.get(url);

      // ✅ Check Response Status
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ApiException('Failed to fetch data', response.statusCode ?? 0);
      }
    } on myDio.DioException catch (e) {
      // ✅ Handle Dio-specific errors
      if (e.response != null) {
        throw ApiException('API Error: ${e.response?.data}', e.response?.statusCode ?? 0);
      } else if (e.type == myDio.DioExceptionType.connectionTimeout) {
        throw ApiException('Connection timed out. Please try again.', 408);
      } else if (e.type == myDio.DioExceptionType.receiveTimeout) {
        throw ApiException('Server took too long to respond.', 408);
      } else {
        throw ApiException('Unexpected error: ${e.message}', 0);
      }
    } catch (e) {
      // ✅ Catch unexpected errors
      throw ApiException('Something went wrong: $e', 0);
    }
  }
}
