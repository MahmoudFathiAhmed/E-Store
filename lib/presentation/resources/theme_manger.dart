import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/font_manager.dart';
import '../../presentation/resources/styles_manger.dart';
import '../../presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,//ripple effect color

    //cardView colors
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(fontSize: FontSize.s16,color: ColorManager.white)
    ),

    //button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),

    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s17),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),


    //text theme
    textTheme: TextTheme(
      displayLarge: getRegularStyle(color: ColorManager.onBlack1, fontSize: FontSize.s30),
      displayMedium: getRegularStyle(color: ColorManager.onBlack2, fontSize: FontSize.s25),
      displaySmall: getRegularStyle(color: ColorManager.grey3, fontSize: FontSize.s24),
      headlineLarge: getSemiBoldStyle(color: ColorManager.grey2, fontSize: FontSize.s22),
      headlineMedium: getRegularStyle(color: ColorManager.grey5, fontSize: FontSize.s22),
      headlineSmall: getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s20),
      titleLarge: getSemiBoldStyle(color: ColorManager.onBlack, fontSize: FontSize.s20),
      titleMedium: getRegularStyle(color: ColorManager.grey2,fontSize: FontSize.s20),
      titleSmall: getRegularStyle(color: ColorManager.primary,fontSize: FontSize.s20),
      labelLarge: getSemiBoldStyle(color: ColorManager.onBlack,fontSize: FontSize.s18),
      labelMedium: getRegularStyle(color: ColorManager.grey2,fontSize: FontSize.s18),
      labelSmall: getRegularStyle(color: ColorManager.onBlack,fontSize: FontSize.s18),
      headline1: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s18),
      headline2: getRegularStyle(color: ColorManager.grey6,fontSize: FontSize.s17),
      headline3: getSemiBoldStyle(color: ColorManager.grey5,fontSize: FontSize.s16),
      headline4: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s16),
      headline5: getRegularStyle(color: ColorManager.grey5,fontSize: FontSize.s16),
      headline6: getRegularStyle(color: ColorManager.primary,fontSize: FontSize.s16),
      subtitle1: getSemiBoldStyle(color: ColorManager.primary,fontSize: FontSize.s15),
      subtitle2: getSemiBoldStyle(color: ColorManager.white,fontSize: FontSize.s14),
      bodyText1: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s14),
      bodyText2: getRegularStyle(color: ColorManager.grey6,fontSize: FontSize.s14),
      caption: getSemiBoldStyle(color: ColorManager.white,fontSize: FontSize.s10),
      button: getRegularStyle(color: ColorManager.primary,fontSize: FontSize.s10),
    ),

    //inputDecoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      labelStyle: getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),

      //enabledBorder style
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //focusedBorder style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //focused error border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),



  );
}