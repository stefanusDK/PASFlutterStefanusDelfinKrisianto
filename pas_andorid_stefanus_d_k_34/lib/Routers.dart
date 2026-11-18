import 'package:get/get.dart';
import 'pages/login_page.dart';
import 'pages/main_menu_page.dart';
import 'pages/transaction_page.dart';

class Routers {
  static const String login = '/login';
  static const String mainMenu = '/main_menu';
  static const String transaction = '/transaction';

  static final pages = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: mainMenu, page: () => MainMenuPage()),
    GetPage(name: transaction, page: () => TransactionPage()),
  ];
}
