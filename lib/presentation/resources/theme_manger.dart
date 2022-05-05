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
      backgroundColor: ColorManager.white,
      iconTheme: IconThemeData(
        color: ColorManager.grey6,
      ),
      elevation: AppSize.s0,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(fontSize: FontSize.s16,color: ColorManager.grey5)
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
      displayLarge: getRegularStyle(color: ColorManager.onBlack1,fontSize: FontSize.s30),
      displayMedium: getRegularStyle(color: ColorManager.grey3,fontSize: FontSize.s25),
      displaySmall: getSemiBoldStyle(color: ColorManager.grey2, fontSize: FontSize.s22),
      headlineLarge: getRegularStyle(color: ColorManager.grey5,fontSize: FontSize.s22),
      headlineMedium: getSemiBoldStyle(color: ColorManager.white,fontSize: FontSize.s20),
      headlineSmall: getRegularStyle(color: ColorManager.primary,fontSize: FontSize.s20),
      titleLarge: getRegularStyle(color: ColorManager.onBlack,fontSize: FontSize.s18),
      titleMedium: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s18),
      titleSmall: getSemiBoldStyle(color: ColorManager.grey5,fontSize: FontSize.s16),
      labelLarge: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s16),
      labelMedium: getRegularStyle(color: ColorManager.primary,fontSize: FontSize.s16),
      labelSmall: getSemiBoldStyle(color: ColorManager.primary,fontSize: FontSize.s15),
      bodyLarge: getSemiBoldStyle(color: ColorManager.white,fontSize: FontSize.s14),
      bodyMedium: getRegularStyle(color: ColorManager.grey4,fontSize: FontSize.s14),
      bodySmall: getRegularStyle(color: ColorManager.primary,fontSize: FontSize.s10),
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