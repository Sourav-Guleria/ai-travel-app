import 'package:ai_travel_app/app/features/presentation/bloc/theme/theme_switcher_bloc.dart';
import 'package:ai_travel_app/app/features/presentation/bloc/theme/theme_switcher_event.dart';
import 'package:ai_travel_app/app/features/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => ThemeSwitcherBloc()..add(SetInitialTheme()),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitcherBloc, ThemeData>(builder: (context, state) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: state,
        debugShowCheckedModeBanner: false,

        //         colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.appColor),
//         useMaterial3: true,
        home: const Home(),
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
