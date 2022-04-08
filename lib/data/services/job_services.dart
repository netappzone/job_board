import '../../helpers/dio_helper.dart';
import 'package:dio/dio.dart';

class JobsServices {
  static Future<List<dynamic>> getAllJobs() async {
    Response response = await DioHelper.getData(url: 'jobs');
    return response.data;
  }
}
