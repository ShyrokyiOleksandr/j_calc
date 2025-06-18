import 'package:flutter/material.dart';
import 'package:j_calc/app_service_locator.dart';
import 'package:j_calc/presentation/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServiceLocator.init();

  runApp(MyApp());
}

//Yarik
