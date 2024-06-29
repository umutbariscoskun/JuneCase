import 'package:flutter/material.dart';

class DataConstants {
  static const String baseUrl = "https://667eae13f2cb59c38dc6ab05.mockapi.io/";
  static const String messagesEndpoint = "/api/v1/messages";
  static const int paginationLimit = 5;

  //Localization Constants

  static const String trLanguageCode = 'tr';
  static const String trCountryCode = 'TR';
  static const trLocale = Locale(trLanguageCode, trCountryCode);

  static const String enLanguageCode = 'en';
  static const String enCountryCode = 'US';
  static const enLocale = Locale(enLanguageCode, enCountryCode);

  static const String translationsFilePath = 'assets/translations';

  static const String dateFormat = 'dd.MM.yyyy';
}
