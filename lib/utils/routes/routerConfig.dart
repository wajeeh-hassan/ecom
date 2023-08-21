import 'package:ecom/screens/category/categoryDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../screens/home/home.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

/// `[GoRouter configuration]` Class

/// Includes all of `[Navigator 2.0]` routing of the App
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteNames.homeScreen,

    routes: [
      GoRoute(
        name: RouteNames.homeScreen,
        path: RouteNames.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        name: RouteNames.categoryScreen,
        path: RouteNames.categoryScreen,
        builder: (context, state) => CategoryDetailScreen(),
      ),
      GoRoute(
        name: RouteNames.productDetailScreen,
        path: RouteNames.productDetailScreen,
        builder: (context, state) => CategoryDetailScreen(),
      ),

      // GoRoute(
      //   name: RouteNames.instance. aboutUs,
      //   path: RouteNames.instance. aboutUs,
      //   builder: (context, state) => const AboutUsScreen(),
      // ),
      // GoRoute(
      //   name: RouteNames.instance. aboutUs,
      //   path: RouteNames.instance. aboutUs,
      //   builder: (context, state) => const AboutUs`Screen(),
      // ),
      // GoRoute(
      //   name: RouteNames.instance. privacyPolicy,
      //   path: RouteNames.instance. privacyPolicy,
      //   builder: (context, state) => const PrivacyPolicyScreen(),
      // ),

      // Add more routes as needed
    ],
    // errorPageBuilder: (context, state) => HomeScreen(),

    redirect: (context, state) {
      print('calling redirect: ${state.fullPath}');
      print('calling redirect: ${state}');

      // For changing the Nav or Tab-bar add the ChangeNotifierProvider here first of all
      // final pageController = ref.read(Providers.instance.pageProvider);
      // switch (state.fullPath) {
      //   case RouteNames.homeScreen:
      //     pageController.seletedPage(0);
      //     break;
      // case RouteNames.downloadRedirect:
      //   pageController.seletedPage(1);
      //   break;
      // case RouteNames.reviewsAndRatings:
      //   pageController.seletedPage(2);
      //   break;
      // case RouteNames.faq:
      //   pageController.seletedPage(3);
      //   break;
      // case RouteNames.termsOfService:
      //   pageController.seletedPage(4);
      //   break;
      // case RouteNames.refundPolicy:
      //   pageController.seletedPage(5);
      //   break;
      // case RouteNames.aboutUs:
      //   pageController.seletedPage(6);
      //   break;
      // case RouteNames.privacyPolicy:
      //   pageController.seletedPage(7);
      //   break;
      // // case RouteNames.contactUs:
      // //   pageController.seletedPage(7);
      // //   break;
      // default:
      //   break;
      // }
    },
  );
});
