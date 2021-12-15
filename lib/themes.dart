import 'package:flutter/material.dart';

import 'constants.dart';

class Themes {
  ThemeData get lightTheme => ThemeData(
        fontFamily: 'NunitoSans',
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        primaryColor: AppColors.orange,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.orange,
        ),
        hintColor: AppColors.black40,
        unselectedWidgetColor: AppColors.black60,
        bottomAppBarColor: Colors.black,
        textTheme: const TextTheme(
          headline2: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
          headline3: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.black,
          ),
          // appbar title
          headline6: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
          subtitle1: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.black,
          ),
          bodyText1: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            height: 22 / 14,
            color: Colors.black,
          ),
        ).apply(
          decorationColor: Colors.black,
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.black,
          onPrimary: Colors.black,
          background: Colors.white,
          secondary: AppColors.black60,
          onSurface: AppColors.black40,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 24 / 16,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onPrimary: Colors.white,
            primary: AppColors.orange,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            onSurface: AppColors.black80,
            splashFactory: NoSplash.splashFactory,
          ),
        ),
        toggleableActiveColor: AppColors.orange,
        cardColor: AppColors.black10,
        dividerColor: AppColors.black10,
        dividerTheme: const DividerThemeData(
          color: AppColors.black10,
          thickness: 1,
          space: 32,
        ),
        chipTheme: const ChipThemeData(
          backgroundColor: AppColors.black10,
          shape: StadiumBorder(
            side: BorderSide(color: AppColors.black10),
          ),
          selectedColor: AppColors.orange20,
          disabledColor: AppColors.black40,
          padding: EdgeInsets.symmetric(horizontal: 6),
          labelStyle: TextStyle(
            color: AppColors.black60,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          brightness: Brightness.light,
          secondaryLabelStyle: TextStyle(color: AppColors.orange),
          secondarySelectedColor: AppColors.orange20,
          pressElevation: 0,
          elevation: 0,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
        ),
        hoverColor: Colors.transparent,
        indicatorColor: AppColors.orange,
        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: AppColors.black60,
          labelColor: AppColors.orange,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 16 / 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 16 / 12,
          ),
        ),
        focusColor: AppColors.orange,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      );
}
