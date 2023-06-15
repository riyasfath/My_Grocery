import 'package:get/get.dart';
import 'package:my_grocery/route/app_route.dart';
import 'package:my_grocery/view/account/auth/sign_in_screen.dart';
import 'package:my_grocery/view/dashboard/dashboard_binding.dart';
import 'package:my_grocery/view/xscreens/splash.dart';

import '../view/dashboard/dashboard_screen.dart';

class AppPage{
    static  List<GetPage> list =[
    GetPage(
        name: AppRoute.dashboard,
        page: ()=> const SplashScreen(),
        binding: DashboardBinding()
    ),
  ];
}