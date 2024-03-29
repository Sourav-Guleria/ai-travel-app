import 'package:ai_travel_app/app/config/theme/index.dart';
import 'package:ai_travel_app/app/core/boot_up/injection_container.dart';
import 'package:ai_travel_app/app/core/responsive/responsive_sizer/responsive_sizer.dart';
import 'package:ai_travel_app/app/features/data/models/travel_model.dart';
import 'package:ai_travel_app/app/features/presentation/bloc/theme/theme_switcher_bloc.dart';
import 'package:ai_travel_app/app/features/presentation/bloc/theme/theme_switcher_event.dart';
import 'package:ai_travel_app/app/features/presentation/bloc/travel/travel_bloc.dart';
import 'package:ai_travel_app/app/features/presentation/pages/home.dart';
import 'package:ai_travel_app/app/features/presentation/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setUpLocator();
  TravelModel travelModel = TravelModel(
      destination: "", startDate: "", endDate: "", budget: "", activities: []);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) =>
            TravelBloc(travelUsecase: serviceLocator())..onInit(travelModel),
      ),
      BlocProvider(
        create: (context) => ThemeSwitcherBloc()..add(SetInitialTheme()),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitcherBloc, ThemeData>(builder: (context, state) {
      return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state,
            darkTheme: AppTheme.darkTheme(),
            debugShowCheckedModeBanner: false,
            home: Onboarding(
              cubit: serviceLocator(),
            ),
          );
        },
        context: context,
      );
    });
  }
}

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // This is the theme of your application.

//         colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.appColor),
//         useMaterial3: true,
//       ),
//       home: Home(),
//     );
//   }
// }
