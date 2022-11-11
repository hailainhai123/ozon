import 'package:get/get.dart';
import 'package:ozon/modules/device/device_page.dart';
import 'package:ozon/modules/device/widget/add_device_page.dart';
import 'package:ozon/modules/device_detail/device_detail_page.dart';
import 'package:ozon/modules/user/user_page.dart';

import '../binding/app_binding.dart';
import '../modules/bottom_app_bar/main_page.dart';
import '../modules/contact/contact_page.dart';
import '../modules/home/home_page.dart';
import '../modules/insurance/insurance_page.dart';
import '../modules/login/login_page.dart';
import '../modules/register/register_page.dart';
import '../modules/station/add_station_page.dart';

const kRouteIndex = "/";
const kHomePage = '/home';
const kAddStationPage = '/add_station_page';
const kAddDevicePage = '/add_device_page';
const kDepartmentPage = '/department_page';
const kUserPage = '/user_page';
const kContactPage = '/contact_page';
const kDevicePage = '/device_page';
const kDeviceDetailPage = '/device_detail_page';
const kLoginPage = '/login';
const kRegisterPage = '/register';


final indexPage = GetPage(
    name: kRouteIndex,
    page: () => MainPage(),
    bindings: [GlobalBinding(), HomeBinding()]);

final homePage = GetPage(name: kHomePage, page: () => HomePage(), bindings: [HomeBinding()]);

final departmentPage = GetPage(name: kDepartmentPage, page: () => InsurancePage(), bindings: []);

final userPage = GetPage(name: kUserPage, page: () => UserPage(), bindings: []);

final contactPage = GetPage(name: kContactPage, page: () => ContactPage(), bindings: []);

final devicePage = GetPage(
    name: kDevicePage, page: () => DevicePage(), bindings: [DeviceBinding()]);

final deviceDetailPage = GetPage(
    name: kDeviceDetailPage,
    page: () => DeviceDetailPage(),
    bindings: [DeviceDetailBinding()]);

final loginPage = GetPage(
    name: kLoginPage, page: () => const LoginPage(), binding: LoginBinding());

final addStationPage = GetPage(
    name: kAddStationPage,
    page: () => AddStationPage(),
    bindings: [StationBinding()]);

final addDevicePage = GetPage(
    name: kAddDevicePage,
    page: () => AddDevicePage(),
    bindings: [DeviceBinding()]);

final registerPage = GetPage(
    name: kRegisterPage,
    page: () => const RegisterPage(),
    bindings: [RegisterBinding()]);

final List<GetPage> pages = [
  indexPage,
  homePage,
  departmentPage,
  userPage,
  contactPage,
  devicePage,
  deviceDetailPage,
  loginPage,
addStationPage,
addDevicePage,
  registerPage,
];
