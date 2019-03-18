import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter_clean_architecture/res/strings-en.dart';
import 'package:flutter_clean_architecture/res/strings-pt.dart';
import 'package:flutter_clean_architecture/res/strings.dart';

class AppStrings {

  AppStrings(this.locale);

  final Locale locale;

  static Strings of(BuildContext context){
    var strings = Localizations.of<AppStrings>(context, AppStrings);
    return strings._localizedValues[strings.locale.languageCode];
  }

  Map<String, Strings> _localizedValues = {
    'en': StringsEN(),
    'pt': StringsPT(),
  };
}

class StringsDelegate extends LocalizationsDelegate<AppStrings> {

  const StringsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pt'].contains(locale.languageCode);

  @override
  Future<AppStrings> load(Locale locale) => SynchronousFuture<AppStrings>(AppStrings(locale));

  @override
  bool shouldReload(StringsDelegate old) => false;

}
