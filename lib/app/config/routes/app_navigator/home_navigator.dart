import 'package:ai_travel_app/app/config/routes/app_navigator/app_navigator.dart';
import 'package:ai_travel_app/app/features/presentation/pages/home.dart';
import 'package:flutter/material.dart';


class HomeMasterNavigator {}

mixin HomeMasterRoute {
  openHomeMaster() {
    navigator.push(
      context,
     const Home(),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}