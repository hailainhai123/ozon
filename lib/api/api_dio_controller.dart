import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:ozon/model/device_model.dart';

import '../constant/api_url.dart';
import 'custom_log.dart';

const int kDefaultTimeOut = 60 * 1000;

class ApiDioController {
  static const _baseUrl = 'http://103.237.145.184:3000';

  static BaseOptions options = BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: kDefaultTimeOut,
    receiveTimeout: kDefaultTimeOut,
  );

  // Contruction to use multiple project
  static Future<T?> getData<T>({
    required String url,
    required Dio dio,
    Map<String, dynamic>? query,
    required Function(dynamic) asModel,
  }) async {
    try {
      print(url);
      // dio.options.headers['Authorization'] =
      // "Bearer ${Get.find<GlobalController>().accessToken.value}";
      Response<Map<String, dynamic>> response = await dio.get(
        url,
        queryParameters: query,
      );
      if (response.statusCode == 200) {
        if (response.data!['message'] == "success") {
          if (response.data!['data'] != null) {
            return asModel(response.data!['data']);
          } else {
            return asModel(response.data!);
          }
        }
      }
      return null;
    } on DioError catch (e) {
      CustomLog.log(e);
      return null;
    } catch (e) {
      CustomLog.log(e);
      Get.defaultDialog(
          barrierDismissible: false,
          title: 'Có lỗi xảy ra! Vui lòng thử lại.',
          onConfirm: () {
            Get.back();
          });
      return null;
    }
  }

  static Future<T?> postMethods<T>({
    required String url,
    required Dio dio,
    dynamic body,
    required Function(Map<String, dynamic>) asModel,
  }) async {
    try {
      print(body);
      print(url);
      // dio.options.headers['Authorization'] =
      // "Bearer ${Get.find<GlobalController>().accessToken.value}";

      Response<Map<String, dynamic>> response = await dio.post(
        url,
        data: body,
      );
      CustomLog.log(response);
      if (response.statusCode == 200) {
        if (response.data!['message'] == "success") {
          return asModel(response.data!);
        }
      }
      return null;
    } on DioError catch (e) {
      CustomLog.log(e);
      return null;
    } catch (e) {
      CustomLog.log(e);
      return null;
    }
  }

  static Future<T?> putMethods<T>({
    required String url,
    required Dio dio,
    dynamic body,
    required Function(Map<String, dynamic>) asModel,
  }) async {
    try {
      // dio.options.headers['x-access-token'] =
      //     Get.find<GlobalController>().accessToken.value;

      Response<Map<String, dynamic>> response = await dio.put(url, data: body);

      CustomLog.log(response.data);

      if (response.statusCode == 200) {
        if (response.data!['message']) {
          return asModel(response.data!);
        }
      } else if (response.statusCode == 403) {
        return null;
      }

      return null;
    } on DioError catch (e) {
      CustomLog.log(e);
      return null;
    } catch (e) {
      CustomLog.log(e);
      return null;
    }
  }

  static Future<T?> pathMethods<T>({
    required String url,
    required Dio dio,
    dynamic body,
    required Function(Map<String, dynamic>) asModel,
  }) async {
    try {
      // dio.options.headers['x-access-token'] =
      //     Get.find<GlobalController>().accessToken.value;

      Response<Map<String, dynamic>> response =
      await dio.patch(url, data: body);

      CustomLog.log(response);

      if (response.statusCode == 200) {
        if (response.data!['message'] == "success") {
          return asModel(response.data!);
        }
      } else if (response.statusCode == 403) {
        // Get.find<GlobalController>().refreshToken();
        return null;
      }

      return null;
    } on DioError catch (e) {
      CustomLog.log(e);
      return null;
    } catch (e) {
      CustomLog.log(e);
      return null;
    }
  }

  static Future<T?> deleteMethod<T>({
    required String url,
    required Dio dio,
    Map<String, dynamic>? body,
    required Function(Map<String, dynamic>) asModel,
  }) async {
    try {
      // dio.options.headers['x-access-token'] =
      //     Get.find<GlobalController>().accessToken.value;

      Response<Map<String, dynamic>> response = await dio.delete(
        url,
        data: body,
      );

      // CustomLog.log(response.data);

      if (response.statusCode == 200) {
        if (response.data!['message']) {
          return asModel(response.data!);
        }
      }

      return null;
    } on DioError catch (e) {
      CustomLog.log(e);
      return null;
    } catch (e) {
      CustomLog.log(e);
      return null;
    }
  }

  // static Future<bool> getAndSaveToken(String tokenFireBase) async {
  //   try {
  //     Dio dio = Dio(options);
  //
  //     Response response = await dio.post('$_baseUrl/api/auth/verify',
  //         options:
  //         Options(headers: {'Authorization': 'Bearer $tokenFireBase'}));
  //     if (response.statusCode == 200) {
  //       UserInformation info = UserInformation.fromJson(response.data['data']);
  //       info.firebaseToken = tokenFireBase;
  //       UserPref().setUser(info);
  //       Get.find<GlobalController>().setToken(tokenFireBase);
  //     }
  //     return true;
  //   } on DioError catch (e) {
  //     // The request was made and the server responded with a status code
  //     // that falls out of the range of 2xx and is also not 304.
  //     if (e.response != null) {
  //       CustomLog.log('Dio error!');
  //       CustomLog.log('STATUS: ${e.response?.statusCode}');
  //       CustomLog.log('DATA: ${e.response?.data}');
  //       CustomLog.log('HEADERS: ${e.response?.headers}');
  //     } else {
  //       // Error due to setting up or sending the request
  //       CustomLog.log('Error sending request!');
  //       CustomLog.log(e.message);
  //     }
  //     return false;
  //   }
  // }
  //
  static Future<List<DeviceModel>> getDevice() async {
    Dio dio = Dio(options);

    List<DeviceModel> listDevice = [];
    await getData<List<DeviceModel>>(
      url: ApiURL.bannerUrl,
      dio: dio,
      asModel: (map) {
        final responseList = map as List;
        listDevice = responseList.map((e) => DeviceModel.fromJson(e)).toList();
      },
    );
    return listDevice;
  }
}
