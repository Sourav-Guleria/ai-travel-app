import 'package:ai_travel_app/app/config/routes/app_navigator/onboarding_navigator.dart';
import 'package:ai_travel_app/app/features/domain/usecase/existing_user_usecase.dart';
import 'package:ai_travel_app/app/features/domain/usecase/social_login_usecase.dart';
import 'package:ai_travel_app/app/features/presentation/bloc/onboarding/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final SocialLoginUseCase _socialLoginUseCase;
  final OnboardingNavigator navigator;
  final CheckForExistingUserUseCase _checkForExistingUserUseCase;

  OnboardingCubit(
    this.navigator,
    this._socialLoginUseCase,
    this._checkForExistingUserUseCase,
  ) : super(OnboardingState.initial());

  onInit() {
    emit(state.copyWith(isLoading: true));
    _checkForExistingUserUseCase.execute().then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(isLoading: false));
            },
            (r) {
              emit(state.copyWith(isLoading: false));
              return navigator.openHomeMaster();
            },
          ),
        );
  }

  void onTapGoogleSignIn() {
    emit(state.copyWith(isLoading: true));
    _socialLoginUseCase.execute().then(
          (value) => value.fold(
            (l) => null,
            (user) {
              emit(state.copyWith(isLoading: false));
              return navigator.openHomeMaster();
            },
          ),
        );
  }
}
