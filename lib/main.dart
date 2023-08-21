import 'package:ecom/utils/colors_constants/colors.dart';
import 'package:ecom/screens/home/home.dart';
import 'package:ecom/utils/routes/routerConfig.dart';
import 'package:ecom/utils/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(ProviderScope(child: EcommerceApp()));

class EcommerceApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routing = ref.read(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: routing,
    );
  }
}
