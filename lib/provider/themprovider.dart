import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemChanger extends ChangeNotifier{
  ThemeMode selectthemmode=ThemeMode.light;
  void changeThemMode(ThemeMode themeMode){

    selectthemmode=themeMode;
    notifyListeners();


  }




}