import 'package:get/get.dart';

import '../view/home_view/home_view.dart';
import 'routes_name.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RoutesName.homeView,
      page: () => const HomeView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),



  ];
}
