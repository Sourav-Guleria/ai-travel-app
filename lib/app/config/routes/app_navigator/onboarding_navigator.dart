import 'package:ai_travel_app/app/config/routes/app_navigator/app_navigator.dart';
import 'package:ai_travel_app/app/config/routes/app_navigator/home_navigator.dart';
import 'package:ai_travel_app/app/core/boot_up/injection_container.dart';
import 'package:ai_travel_app/app/features/presentation/pages/onboarding.dart';
import 'package:flutter/material.dart';

class OnboardingNavigator with HomeMasterRoute {
  OnboardingNavigator(this.navigator);

  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin OnboardingRoute {
  openOnboarding() {
    navigator.push(
      context,
      Onboarding(cubit: serviceLocator(),),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}