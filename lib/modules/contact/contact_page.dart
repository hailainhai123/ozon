import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:ozon/utils/global_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../widget_custom/app_bar.dart';

class ContactPage extends StatelessWidget {
  ContactPage({Key? key}) : super(key: key);
  final GlobalController globalController = Get.find();

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Liên hệ',
        isBack: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_evn.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // PhysicalModel(
              //   color: globalController.colorBackground.value,
              //   elevation: 5,
              //   shadowColor: Colors.blue,
              //   borderRadius: BorderRadius.circular(20),
              //   child: Padding(
              //     padding: const EdgeInsets.all(16),
              //     child: Column(
              //       children: [
              //         deviceInfoItem('Công ty: ', 'EVN', Colors.green),
              //         deviceInfoItem('Email: ', 'evnhanoi@evnhanoi.vn', Colors.green),
              //         deviceInfoItem(
              //             'Số điện thoại: ', '0912345678', Colors.green),
              //         deviceInfoItem('Địa chỉ: ', '69 Đinh Tiên Hoàng, Hoàn Kiếm, Hà Nội', Colors.green),
              //       ],
              //     ),
              //   ),
              // ),
              Visibility(
                visible: true,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: globalController.colorBackground.value,
                  child: ListTile(
                    leading: const Icon(
                      Icons.home_filled,
                      size: 32,
                    ),
                    title: Text(
                      'Công ty',
                      style: TextStyle(
                        color: globalController.colorText.value,
                      ),
                    ),
                    subtitle: Text(
                      'EVN',
                      style: TextStyle(
                        color: globalController.colorText.value,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              Visibility(
                visible: true,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: globalController.colorBackground.value,
                  child: ListTile(
                    leading: const Icon(
                      Icons.email,
                      size: 32,
                    ),
                    title: Text(
                      'Email',
                      style: TextStyle(
                        color: globalController.colorText.value,
                      ),
                    ),
                    subtitle: Text(
                      'evnhanoi@evnhanoi.vn',
                      style: TextStyle(
                        color: globalController.colorText.value,
                      ),
                    ),
                    onTap: () {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'evnhanoi@evnhanoi.com',
                        query: encodeQueryParameters(<String, String>{
                          'subject': 'Tiêu đề',
                        }),
                      );
                      launchUrl(emailLaunchUri);
                    },
                  ),
                ),
              ),
              Visibility(
                visible: true,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: globalController.colorBackground.value,
                  child: ListTile(
                    leading: const Icon(
                      Icons.call,
                      size: 32,
                    ),
                    title: Text(
                      'Số điện thoại',
                      style: TextStyle(
                        color: globalController.colorText.value,
                      ),
                    ),
                    subtitle: Text(
                      '0912345678',
                      style: TextStyle(
                        color: globalController.colorText.value,
                      ),
                    ),
                    onTap: () async {
                      await launchUrlString('tel://0912345678');
                    },
                  ),
                ),
              ),
              Visibility(
                visible: true,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: globalController.colorBackground.value,
                  child: ListTile(
                    leading: const Icon(
                      Icons.location_on,
                      size: 32,
                    ),
                    title: Text(
                      'Địa chỉ',
                      style: TextStyle(
                        color: globalController.colorText.value,
                      ),
                    ),
                    subtitle: Text(
                      '69 Đinh Tiên Hoàng, Hoàn Kiếm, Hà Nội',
                      style: TextStyle(
                        color: globalController.colorText.value,
                      ),
                    ),
                    isThreeLine: true,
                    onTap: () async {
                      await _determinePosition();
                      print('open map');
                      Position position = await Geolocator.getCurrentPosition(
                          desiredAccuracy: LocationAccuracy.high);
                      List<Location> locations = [];
                      try {
                        locations = await locationFromAddress(
                            "69 Đinh Tiên Hoàng, Hoàn Kiếm, Hà Nội");
                      } catch (e) {
                        Get.snackbar(
                            'Lỗi', 'Lỗi hệ thống, xin vui lòng thử lại sau!');
                      }
                      final availableMaps = await MapLauncher.installedMaps;
                      print(availableMaps);
                      if (await MapLauncher.isMapAvailable(MapType.google) ==
                          true) {
                        MapLauncher.showDirections(
                            mapType: MapType.google,
                            destination: Coords(
                                locations[0].latitude, locations[0].longitude),
                            origin:
                                Coords(position.latitude, position.longitude),
                            originTitle: 'Vị trí hiện tại');
                      } else if (await MapLauncher.isMapAvailable(
                              MapType.apple) ==
                          true) {
                        MapLauncher.showDirections(
                            mapType: MapType.apple,
                            destination: Coords(
                                locations[0].latitude, locations[0].longitude),
                            origin:
                                Coords(position.latitude, position.longitude),
                            originTitle: 'Vị trí hiện tại');
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget deviceInfoItem(String label, String content, Color color) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: globalController.colorText.value,
            ),
          ),
          SizedBox(
            width: 250,
            child: Text(content,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                  fontWeight: FontWeight.bold,
                )),
          )
        ],
      ),
    );
  }
}
