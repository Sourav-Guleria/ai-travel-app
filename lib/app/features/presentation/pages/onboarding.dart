import 'package:ai_travel_app/app/core/responsive/responsive_sizer/responsive_sizer.dart';
import 'package:ai_travel_app/app/core/responsive/responsive_width.dart';
import 'package:ai_travel_app/app/core/utils/colors.dart';
import 'package:ai_travel_app/app/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                    'https://cdn.iconscout.com/icon/premium/png-512-thumb/travel-app-9011816-7340874.png?f=webp&w=512'),
                SizedBox(
                  height: 2.h,
                ),
                Text('Welcome to AI Travel App',
                    style: Theme.of(context).textTheme.labelLarge),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        onPressed: () {},
                        child: const Text('Continue with Google')),
                  ),
                )
              ],
            ),
          );
        },
        context: context);
  }
}
