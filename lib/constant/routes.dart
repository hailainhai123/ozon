import 'package:get/get.dart';
import 'package:ozon/modules/department/department_page.dart';
import 'package:ozon/modules/user/user_page.dart';

import '../binding/app_binding.dart';
import '../modules/bottom_app_bar/main_page.dart';
import '../modules/home/home_page.dart';
import '../modules/login/login_page.dart';

const kRouteIndex = "/";
const kHomePage = '/home';
const kDepartmentPage = '/department_page';
const kUserPage = '/user_page';
// const kBookDetails = '/book_details/:id';
// const kReadingPage = '/reading/:id';
// const kListChapPage = '/list_chap/:id';
const kLoginPage = '/login';
// const kRegisterPage = '/register';
// const kCommentsPage = '/comments/:id';
// const kNotificationPage = '/notification';
// const kGridNovelPage = '/grid_novel';
// const kEditPage = '/edit';
//
final indexPage = GetPage(
    name: kRouteIndex,
    page: () => MainPage(),
    bindings: [GlobalBinding(), HomeBinding()]);

final homePage = GetPage(name: kHomePage, page: () => const HomePage(), bindings: []);

final departmentPage = GetPage(name: kDepartmentPage, page: () => DepartmentPage(), bindings: []);

final userPage = GetPage(name: kUserPage, page: () => UserPage(), bindings: []);

// //Book details
// final detailsPage = GetPage(
//     name: kBookDetails,
//     page: () => BookDetailsPage(),
//     binding: BookDetailsBinding());
//
// final readingPage = GetPage(
//     name: kReadingPage,
//     page: () => ReadingPage(),
//     binding: BookDetailsBinding());
//
// final commentsPage = GetPage(
//     name: kCommentsPage,
//     page: () => CommentsPage(),
//     binding: CommentsBinding());
//
// //Search
// final searchPage = GetPage(
//     name: kSearchPage,
//     page: () => const SearchPage(),
//     bindings: [SearchBinding()]);
//
// //List Chapter
// final listChapPage = GetPage(name: kListChapPage, page: () => ListChapPage());
//
//Login, register
final loginPage = GetPage(name: kLoginPage, page: () => const LoginPage());

// final registerPage = GetPage(name: kRegisterPage, page: () => RegisterPage());
//
// //Notification
// final notificationPage =
//     GetPage(name: kNotificationPage, page: () => const NotificationsPage());
//
// //Notification
// final girdNovelPage = GetPage(
//   name: kGridNovelPage,
//   page: () => const GridNovelPage(),
//   maintainState: true,
//   // binding: GridPageBinding()
// );
//
// final editPage = GetPage(
//     name: kEditPage,
//     page: () => EditProfilePage(),
//     binding: BindingsBuilder(() {
//       Get.lazyPut(() => EditProfileController());
//     }));
//
final List<GetPage> pages = [
  indexPage,
  homePage,
  departmentPage,
  userPage,
  // listChapPage,
  // detailsPage,
  // readingPage,
  loginPage,
  // registerPage,
  // commentsPage,
  // notificationPage,
  // girdNovelPage,
  // editPage
];
