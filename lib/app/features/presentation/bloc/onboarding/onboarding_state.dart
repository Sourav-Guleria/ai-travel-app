class OnboardingState {
  final bool isLoading;

  const OnboardingState({required this.isLoading});

  factory OnboardingState.initial() => const OnboardingState(
        isLoading: false,
      );

  OnboardingState copyWith({bool? isLoading}) => OnboardingState(
        isLoading: isLoading ?? this.isLoading,
      );
}
