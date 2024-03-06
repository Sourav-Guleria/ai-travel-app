part of 'index.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme() {
    return FlexThemeData.light(
      scheme: FlexScheme.indigo,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 20,
      appBarOpacity: 0.95,
      appBarBackground: CustomColors.appColor,
      textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontSize:
                  widgetSize(desktop: 14.sp, tablet: 15.sp, mobile: 16.sp),
              color: CustomColors.rgba0001,
              fontWeight: FontWeight.w700,
              fontFamily: 'JioType',
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none),
          bodyMedium: TextStyle(
              fontSize:
                  widgetSize(desktop: 14.sp, tablet: 15.sp, mobile: 16.sp),
              color: CustomColors.rgba0001,
              fontWeight: FontWeight.w500,
              fontFamily: 'JioType',
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none),
          bodySmall: TextStyle(
              fontSize:
                  widgetSize(desktop: 14.sp, tablet: 15.sp, mobile: 16.sp),
              color: CustomColors.rgba0001,
              fontWeight: FontWeight.w300,
              fontFamily: 'JioType',
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none),
          displayLarge: TextStyle(
              fontSize:
                  widgetSize(desktop: 14.sp, tablet: 15.sp, mobile: 16.sp),
              color: CustomColors.appColor,
              fontWeight: FontWeight.w700,
              fontFamily: 'JioType',
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none),
          displayMedium: TextStyle(
              fontSize:
                  widgetSize(desktop: 14.sp, tablet: 15.sp, mobile: 16.sp),
              color: CustomColors.appColor,
              fontWeight: FontWeight.w500,
              fontFamily: 'JioType',
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none),
          displaySmall: TextStyle(
              fontSize:
                  widgetSize(desktop: 14.sp, tablet: 15.sp, mobile: 16.sp),
              color: CustomColors.appColor,
              fontWeight: FontWeight.w300,
              fontFamily: 'JioType',
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none)),

      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        blendOnColors: false,
      ),
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
        keepPrimary: true,
        keepSecondary: true,
        keepTertiary: true,
        keepPrimaryContainer: true,
        keepSecondaryContainer: true,
        keepTertiaryContainer: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      //useMaterial3: true,
      // To use the playground font, add GoogleFonts package and uncomment
    );
  }

  static ThemeData darkTheme() {
    return FlexThemeData.dark(
      scheme: FlexScheme.indigo,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 15,
      appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0.90,
      textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontSize:
                  widgetSize(desktop: 14.sp, tablet: 15.sp, mobile: 16.sp),
              color: CustomColors.whiteColor,
              fontWeight: FontWeight.w700,
              fontFamily: 'JioType',
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none),
          bodyMedium: TextStyle(
              fontSize:
                  widgetSize(desktop: 14.sp, tablet: 15.sp, mobile: 16.sp),
              color: CustomColors.whiteColor,
              fontWeight: FontWeight.w500,
              fontFamily: 'JioType',
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none),
          bodySmall: TextStyle(
              fontSize:
                  widgetSize(desktop: 14.sp, tablet: 15.sp, mobile: 16.sp),
              color: CustomColors.whiteColor,
              fontWeight: FontWeight.w300,
              fontFamily: 'JioType',
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none),
          displayLarge: TextStyle(
              fontSize:
                  widgetSize(desktop: 14.sp, tablet: 15.sp, mobile: 16.sp),
              color: CustomColors.textGrey,
              fontWeight: FontWeight.w700,
              fontFamily: 'JioType',
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none),
          displayMedium: TextStyle(
              fontSize:
                  widgetSize(desktop: 14.sp, tablet: 15.sp, mobile: 16.sp),
              color: CustomColors.textGrey,
              fontWeight: FontWeight.w500,
              fontFamily: 'JioType',
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none),
          displaySmall: TextStyle(
              fontSize:
                  widgetSize(desktop: 14.sp, tablet: 15.sp, mobile: 16.sp),
              color: CustomColors.textGrey,
              fontWeight: FontWeight.w300,
              fontFamily: 'JioType',
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none)),
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 30,
      ),
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      //useMaterial3: true,
      // To use the playground font, add GoogleFonts package and uncomment
    );
  }
}
