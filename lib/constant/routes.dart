import 'package:get/get.dart';
import 'package:ozon/modules/device/device_page.dart';
import 'package:ozon/modules/device_detail/device_detail_page.dart';
import 'package:ozon/modules/device_detail/widget/edit_device_page.dart';
import 'package:ozon/modules/query/pages/custom_table.dart';
import 'package:ozon/modules/user/pages/profile_page.dart';
import 'package:ozon/modules/user/user_page.dart';

import '../binding/app_binding.dart';
import '../modules/bottom_app_bar/main_page.dart';
import '../modules/contact/contact_page.dart';
import '../modules/home/home_page.dart';
import '../modules/login/login_page.dart';
import '../modules/query/pages/line_chart_ozon.dart';
import '../modules/query/query_page.dart';
import '../modules/register/register_page.dart';
import '../modules/splash/splash.dart';
import '../modules/station/add_station_page.dart';

const kSplash = "/splash";
const kRouteIndex = "/";
const kHomePage = '/home';
const kAddStationPage = '/add_station_page';
const kAddDevicePage = '/add_device_page';
const kqueryPage = '/department_page';
const kCustomTablePage = '/custom_table_page';
const kChartPage = '/chart_page';
const kUserPage = '/user_page';
const kInforPage = '/infor_page';
const kContactPage = '/contact_page';
const kDevicePage = '/device_page';
const kDeviceDetailPage = '/device_detail_page';
const kEditDevicePage = '/edit_device_page';
const kLoginPage = '/login';
const kRegisterPage = '/register';

final splashPage = GetPage(name: kSplash, page: () => SplashPage(), bindings: []);

final indexPage = GetPage(
    name: kRouteIndex,
    page: () => MainPage(),
    bindings: [GlobalBinding(), HomeBinding()]);

final homePage = GetPage(name: kHomePage, page: () => HomePage(), bindings: [HomeBinding()]);

final queryPage = GetPage(name: kqueryPage, page: () => QueryPage(), bindings: []);

final tablePage = GetPage(name: kCustomTablePage, page: () => CustomTable(), bindings: []);

final chartPage = GetPage(name: kChartPage, page: () => LineChartOzonPage(), bindings: []);

final userPage = GetPage(name: kUserPage, page: () => UserPage(), bindings: []);

final inforPage = GetPage(name: kInforPage, page: () => ProfilePage(), bindings: []);

final contactPage = GetPage(name: kContactPage, page: () => ContactPage(), bindings: []);

final devicePage = GetPage(
    name: kDevicePage, page: () => DevicePage(), bindings: [DeviceBinding()]);

final deviceDetailPage = GetPage(
    name: kDeviceDetailPage,
    page: () => DeviceDetailPage(),
    bindings: [DeviceDetailBinding()]);

final editDevicePage = GetPage(name: kEditDevicePage, page: () => EditDevicePage(), bindings: []);

final loginPage = GetPage(
    name: kLoginPage, page: () => const LoginPage(), binding: LoginBinding());

final addStationPage = GetPage(
    name: kAddStationPage,
    page: () => AddStationPage(),
    bindings: [StationBinding()]);

final registerPage = GetPage(
    name: kRegisterPage,
    page: () => const RegisterPage(),
    bindings: [RegisterBinding()]);

final List<GetPage> pages = [
  splashPage,
  indexPage,
  homePage,
  queryPage,
  tablePage,
  chartPage,
  userPage,
  inforPage,
  contactPage,
  devicePage,
  deviceDetailPage,
  editDevicePage,
  loginPage,
addStationPage,
  registerPage,
];
