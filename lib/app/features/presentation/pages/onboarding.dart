import 'package:ai_travel_app/app/features/presentation/bloc/onboarding/onboarding_bloc.dart';
import 'package:ai_travel_app/app/features/presentation/bloc/onboarding/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Onboarding extends StatefulWidget {
  final OnboardingCubit cubit;

  const Onboarding({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  OnboardingCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
    cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome to Travel AI App',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(' Enter Details, find Itenery, get booked!',
              style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                onPressed: cubit.onTapGoogleSignIn,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) {
                      state as OnboardingState;
                      if (state.isLoading) {
                        return SizedBox(
                          height: 25,
                          width: 25,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        );
                      }
                      return const Text('Continue with Google');
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
