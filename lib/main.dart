import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sample_task/config/preference.dart';
import 'package:sample_task/views/form_screen/form_screen_view.dart';
import 'package:sample_task/views/home_screen/home_screen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  SharedPreferenceHelper.clearPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Title',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const FormScreenView(),
      getPages: [
        GetPage(name: FormScreenView.routeName, page: () => const FormScreenView()),
      ],
    );
  }
}
