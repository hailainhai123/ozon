import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:ozon/model/admin_model.dart';
import 'package:ozon/model/device_model.dart';
import 'package:ozon/model/station_model.dart';
import 'package:ozon/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/api_url.dart';
import '../constant/routes.dart';
import '../mqtt/constants.dart';
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

      print('ApiResponse: $response');

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
      print('Request body: $body');
      print('Request url: $url');
      // dio.options.headers['Authorization'] =
      // "Bearer ${Get.find<GlobalController>().accessToken.value}";
      Response<Map<String, dynamic>> response = await dio.post(
        url,
        data: body,
      );

      print('Response data: ${response.data}');

      CustomLog.log(response);
      if (response.statusCode == 200) {
        if (response.data!['message'] == "success") {
          return asModel(response.data!);
        }
      }
      return null;
    } on DioError catch (e) {
      CustomLog.log(e);
      Get.snackbar('Lỗi', 'Lỗi hệ thống, xin vui lòng thử lại sau!');
      return null;
    } catch (e) {
      CustomLog.log(e);
      Get.snackbar('Lỗi', 'Lỗi hệ thống, xin vui lòng thử lại sau!');
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
        if (response.data!['message'] == 'success') {
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
      Response<Map<String, dynamic>> response = await dio.delete(
        url,
        data: body,
      );
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

  static Future<List<DeviceModel>> getDevice() async {
    Dio dio = Dio(options);

    List<DeviceModel> listDevice = [];
    await getData<List<DeviceModel>>(
      url: ApiURL.getDevice,
      dio: dio,
      asModel: (map) {
        final responseList = map as List;
        listDevice = responseList.map((e) => DeviceModel.fromJson(e)).toList();
      },
    );
    return listDevice;
  }

  static Future<List<DeviceModel>> getDeviceForIdStation(String idStation) async {
    Dio dio = Dio(options);

    List<DeviceModel> listDevice = [];
    await postMethods(
      url: ApiURL.getDeviceForIdStation,
      dio: dio,
      body: {"stationId" : idStation},
      asModel: (map) {
        if (map['data'] != null) {
          final responseList = map['data'] as List;
          listDevice = responseList.map((e) => DeviceModel.fromJson(e)).toList();
        }
      },
    );
    return listDevice;
  }

  static Future<List<DeviceModel>> queryStation(String idStation, String time, String nguong) async {
    Dio dio = Dio(options);

    List<DeviceModel> listDevice = [];
    await postMethods(
      url: ApiURL.queryStation,
      dio: dio,
      body: {"stationId" : idStation, "day" : time, 'nguong' : nguong},
      asModel: (map) {
        if (map['data'] != null) {
          final responseList = map['data'] as List;
          listDevice = responseList.map((e) => DeviceModel.fromJson(e)).toList();
        }
      },
    );
    Get.toNamed(kCustomTablePage);
    return listDevice;
  }

  static Future<List<DeviceModel>> queryDetail(String idDevice, String time,) async {
    Dio dio = Dio(options);

    List<DeviceModel> listDevice = [];
    await postMethods(
      url: ApiURL.queryChiTiet,
      dio: dio,
      body: {"deviceId" : idDevice, "day" : time,},
      asModel: (map) {
        if (map['data'] != null) {
          final responseList = map['data'] as List;
          listDevice = responseList.map((e) => DeviceModel.fromJson(e)).toList();
        }
      },
    );
    return listDevice;
  }

  static Future<bool> registerAdmin(AdminModel adminModel) async {
    Dio dio = Dio(options);

    bool registerStatus = false;
    await postMethods(
      url: ApiURL.registerAdmin,
      dio: dio,
      body: adminModel.toJson(),
      asModel: (map) {
        if (map['message'] == 'success') {
          registerStatus = true;
          Get.snackbar('Đăng ký', 'Đăng ký thành công');
        } else {
          Get.snackbar('Đăng ký', 'Đăng ký thất bại');
          registerStatus = false;
        }
      },
    );
    return registerStatus;
  }

  static Future<UserModel> login(UserModel userModel) async {
    Dio dio = Dio(options);

    UserModel user = UserModel();
    List<UserModel> listUser = [];
    await postMethods(
      url: ApiURL.loginUser,
      dio: dio,
      body: userModel.toJson(),
      asModel: (map) {
        final message = map['message'] as String;
        if (message == 'success') {
          final responseList = map['data'] as List;
          listUser = responseList.map((e) => UserModel.fromJson(e)).toList();
          user = listUser[0];
          print(user);
        } else {
          Get.snackbar('Thông báo', 'Đăng nhập thất bại',
              snackPosition: SnackPosition.TOP);
        }
      },
    );
    return user;
  }

  static Future<UserModel> getAdmin(UserModel userModel) async {
    Dio dio = Dio(options);

    UserModel user = UserModel();
    List<UserModel> listUser = [];
    await postMethods(
      url: ApiURL.getUser,
      dio: dio,
      body: userModel.toJson(),
      asModel: (map) {
        final message = map['message'] as String;
        if (message == 'success') {
          final responseList = map['data'] as List;
          listUser = responseList.map((e) => UserModel.fromJson(e)).toList();
          user = listUser[0];
          print(user);
        }
      },
    );
    return user;
  }

  static Future<List<AdminModel>> updateAdmin(AdminModel adminModel) async {
    Dio dio = Dio(options);

    List<AdminModel> adminModels = [];
    await postMethods(
      url: ApiURL.updateAdmin,
      dio: dio,
      body: adminModel.toJson(),
      asModel: (map) {
        final responseList = map as List;
        adminModels = responseList.map((e) => AdminModel.fromJson(e)).toList();
      },
    );
    return adminModels;
  }

  static Future<List<AdminModel>> updatePassAdmin(AdminModel adminModel) async {
    Dio dio = Dio(options);

    List<AdminModel> adminModels = [];
    await postMethods(
      url: ApiURL.updatePassAdmin,
      dio: dio,
      body: adminModel.toJson(),
      asModel: (map) {
        final responseList = map as List;
        adminModels = responseList.map((e) => AdminModel.fromJson(e)).toList();
      },
    );
    return adminModels;
  }

  static Future<List<AdminModel>> deleteAdmin(AdminModel adminModel) async {
    Dio dio = Dio(options);

    List<AdminModel> adminModels = [];
    await postMethods(
      url: ApiURL.deleteAdmin,
      dio: dio,
      body: adminModel.toJson(),
      asModel: (map) {
        final responseList = map as List;
        adminModels = responseList.map((e) => AdminModel.fromJson(e)).toList();
      },
    );
    return adminModels;
  }

  static Future<List<DeviceModel>> registerUser(UserModel userModel) async {
    Dio dio = Dio(options);

    List<DeviceModel> listDevice = [];
    await postMethods(
      url: ApiURL.registerUser,
      dio: dio,
      body: userModel.toJson(),
      asModel: (map) {},
    );
    return listDevice;
  }

  static Future<bool> registerStation(StationModel stationModel) async {
    Dio dio = Dio(options);

    bool registerStationStatus = false;
    await postMethods(
      url: ApiURL.registerStation,
      dio: dio,
      body: stationModel.toJson(),
      asModel: (map) {
        if (map['message'] == 'success') {
          registerStationStatus = true;
          Get.snackbar('Thêm trạm', 'Thêm trạm thành công');
        } else {
          Get.snackbar('Thêm trạm', 'Thêm trạm thất bại');
          registerStationStatus = false;
        }
      },
    );
    return registerStationStatus;
  }

  static Future<List<StationModel>> getStation(
      StationModel stationModel) async {
    Dio dio = Dio(options);

    List<StationModel> stations = [];
    await postMethods(
      url: ApiURL.getStation,
      dio: dio,
      body: stationModel.toJson(),
      asModel: (map) {
        final responseList = map as List;
        stations = responseList.map((e) => StationModel.fromJson(e)).toList();
      },
    );
    return stations;
  }

  static Future<List<StationModel>> getAllStation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    UserModel userModel = UserModel();
    userModel.userId = await prefs.getString(Constants.userId);
    Dio dio = Dio(options);

    List<StationModel> stations = [];
    await postMethods(
      url: ApiURL.getAllStation,
      dio: dio,
      body: userModel.toJson(),
      asModel: (map) {
        final responseList = map['data'] as List;
        stations = responseList.map((e) => StationModel.fromJson(e)).toList();
      },
    );
    return stations;
  }

  static Future<List<StationModel>> updateStation(
      StationModel stationModel) async {
    Dio dio = Dio(options);

    List<StationModel> stations = [];
    await postMethods(
      url: ApiURL.updateStation,
      dio: dio,
      body: stationModel.toJson(),
      asModel: (map) {
        final responseList = map as List;
        stations = responseList.map((e) => StationModel.fromJson(e)).toList();
      },
    );
    return stations;
  }

  static Future<List<StationModel>> deleteStation(
      StationModel stationModel) async {
    Dio dio = Dio(options);

    List<StationModel> stations = [];
    await postMethods(
      url: ApiURL.deleteStation,
      dio: dio,
      body: stationModel.toJson(),
      asModel: (map) {
        final responseList = map as List;
        stations = responseList.map((e) => StationModel.fromJson(e)).toList();
      },
    );
    return stations;
  }

  static Future<bool> registerDevice(
      DeviceModel deviceModel) async {
    Dio dio = Dio(options);

    bool registerDeviceStatus = false;
    await postMethods(
      url: ApiURL.registerDevice,
      dio: dio,
      body: deviceModel.toJson(),
      asModel: (map) {
        if (map['message'] == 'success') {
          registerDeviceStatus = true;
          Get.snackbar('Thêm trạm', 'Thêm trạm thành công');
        } else {
          Get.snackbar('Thêm trạm', 'Thêm trạm thất bại');
          registerDeviceStatus = false;
        }
      },
    );
    return registerDeviceStatus;
  }

  static Future<DeviceModel> updateDevice(DeviceModel deviceModel) async {
    Dio dio = Dio(options);

    bool updateDeviceStatus = false;
    List<DeviceModel> listDevice = [];
    DeviceModel device = DeviceModel();
    await putMethods(
      url: ApiURL.updateDevice,
      dio: dio,
      body: deviceModel.toJson(),
      asModel: (map) {
        if (map['message'] == 'success' || map['message'] == 'true') {
          updateDeviceStatus = true;
        } else {
          updateDeviceStatus = false;
        }
        final responseList = map as List;
        listDevice = responseList.map((e) => DeviceModel.fromJson(e)).toList();
        device = listDevice[0];
      },
    );
    return device;
  }

  static Future<List<DeviceModel>> deleteDevice(DeviceModel deviceModel) async {
    Dio dio = Dio(options);

    List<DeviceModel> devices = [];
    await postMethods(
      url: ApiURL.deleteStation,
      dio: dio,
      body: deviceModel.toJson(),
      asModel: (map) {
        final responseList = map as List;
        devices = responseList.map((e) => DeviceModel.fromJson(e)).toList();
      },
    );
    return devices;
  }
}
