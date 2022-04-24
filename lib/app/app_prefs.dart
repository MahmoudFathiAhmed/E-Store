import '../../presentation/resources/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG="PREFS_KEY_LANG";
const String PREFS_KEY_ONBOARDING_SCREEN_VIEWED="PREFS_KEY_ONBOARDING_SCREEN_VIEWED";
const String PREFS_KEY_IS_USER_LOGGED_IN="PREFS_KEY_IS_USER_LOGGED_IN";
class AppPreferences{
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);
  Future<String> getAppLanguage()async{
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if( language != null && language.isNotEmpty){
      return language;
    }else{
      //return default language
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> changeAppLanguage()async{
    String currentLang = await getAppLanguage();
    if(currentLang == LanguageType.ARABIC.getValue()){
      //set to english
      _sharedPreferences.setString(PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    }else{
      //set to arabic
      _sharedPreferences.setString(PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }

  Future<Locale> getLocal()async{
    String currentLang = await getAppLanguage();
    if(currentLang == LanguageType.ARABIC.getValue()){
      //set to english
      return ARABIC_LOCAL;
    }else{
      //set to arabic
      return ENGLISH_LOCAL;
    }
  }

  //on boarding
  Future<void> setOnBoardingScreenViewed()async{
    _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED, true);
  }
Future<bool> isOnBoardingScreenViewed()async{
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED)?? false;
  }
//Login
  Future<void> setUserLoggedIn()async{
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }
Future<bool> isUserLoggedIn()async{
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN)?? false;
  }

  Future<void>logout()async{
    _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
  }
}