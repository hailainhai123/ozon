import 'dart:ui';

final double defaultZoom = 10.8746;
final double newZoom = 15.8746;

//type of add
const int ADD_DEPARTMENT = 0;
const int ADD_ROOM = 1;
const int ADD_DEVICE = 2;

const int EDIT_HOME = 0;
const int EDIT_ROOM = 1;
const int EDIT_DEVICE = 2;

final String defaultMarkerId = "1";

const Color PRIMARY_COLOR = Color(0xff222831);
const Color BACKGROUND_COLOR = Color(0xffeeeeee);
const Color FOREGROUND_COLOR = Color(0xffC94D49);
const Color PRICE_COLOR_PRIMARY = FOREGROUND_COLOR;
const Color PRICE_COLOR_ON_FORE = Color(0xfffbd46d);
const Color PRIMARY_TEXT_COLOR = PRIMARY_COLOR;
const Color FORE_TEXT_COLOR = BACKGROUND_COLOR;

final String server_uri_key = 'serverUri';

final String serverUri = "103.237.145.184";

final int port = 1884;
const GET_DEVICE = 'gettbid';
final String login_topic = "loginuser";
final String patient_login_topic = "loginbenhnhan";
final String home_status = "statusnha";

final String room_status = "statusphong";
final String device_status = "statusphong";
// String mac = "02:00:00:00:00:00";
String mac = "";

const one_signal_app_id = '2b8a51c6-9a40-4978-88b5-7a89d2a5b9cb';

const UPDATE_USER = 'updateuser';
const UPDATE_PARENT = 'updateph';
const DELETE_PARENT = 'deleteph';
const DELETE_USER = 'deleteuser';
const CHANGE_PASSWORD_USER = 'updatepass';
const CHANGE_PASSWORD_PARENT = 'updatepassph';
const GET_INFO_USER = 'getinfouser';
const GET_INFO_PARENT = 'getinfoph';
const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

class ViewConstants {
  static const double defaultBorderRadiusBtn = 8;
  static const double defaultBorderRadiusTextInput = 8;
  static const double defaultBorderRadiusHeader = 0;
}

class Constants {

  /// http headers
  static Map<String, String> apiHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static String convertPhone(String phone) {
    if (phone[0] == '0') {
      return '+84' + phone.substring(1);
    } else {
      return phone;
    }
  }

  /// e.t.c.
  static String playerId = "playerId";
  static String userId = "userId";
  static String userIdOneSignal = "userIdOneSignal";
  static String pass = "pass";
  static String user = "user";
  static String signedIn = "signedIn";
}

