import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sample_task/config/pref_constant.dart';
import 'package:sample_task/config/preference.dart';
import 'package:stacked/stacked.dart';

enum GendertCharacter { male, female }

class FormScreenViewModel extends BaseViewModel {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  List formList = [
    // {
    //   "id": 1,
    //   "name": "Vishant",
    //   "type": "form",
    //   "email": "vishant.jawallia@gmail.com",
    //   "gender": GendertCharacter.male,
    // },
    // {
    //   "id": 2,
    //   "name": "",
    //   "type": "form",
    //   "email": "",
    //   "gender": GendertCharacter.female,
    // },
  ];

  final formKey = GlobalKey<FormState>();
  final Map? singleRoom;
  FormScreenViewModel(this.singleRoom) {
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    //Write your models loading codes here
    var list = SharedPreferenceHelper.getString(Preferences.addFields);
    log(list.toString());
    List temp = (list != "null" && list.isNotEmpty) ? jsonDecode(list) : [];

    formList.addAll(temp);

    //Let other views to render again
    setBusy(false);
    notifyListeners();
  }

  void onAppHandler() {
    formList.add({
      "id": formList.length + 1,
      "name": "",
      "type": "form",
      "email": "",
      "gender": GendertCharacter.female,
    });
    notifyListeners();
  }

  validatorhandler(String? value, String input, int i) {
    switch (input) {
      case "name":
        if (value!.isEmpty) {
          return 'Field ID:${formList[i]['id']} is Invaild Name';
        } else {
          return;
        }

      case "email":
        if (value!.isEmpty) {
          return 'Field ID:${formList[i]['id']} is Invaild Email';
        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email address';
        } else {
          return;
        }
      default:
    }
  }

  void senderChange(int index, value) {
    formList[index]['gender'] = value;
    log(value.toString());
    notifyListeners();
    // rebuildUi();
  }

  void submitHandler() async {
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      for (var element in formList) {
        element["type"] = "card";
      }
      notifyListeners();
      await SharedPreferenceHelper.setString(Preferences.addFields, jsonEncode(formList));
      onRefresh();
    }
  }

  void onEditHandler(i) {
    formList[i]['type'] = "form";
    notifyListeners();
  }

  Future<void> onRefresh() async {
    var list = SharedPreferenceHelper.getString(Preferences.addFields);
    log(list.toString());
    List temp = (list != "null" && list.isNotEmpty) ? jsonDecode(list) : [];
    formList.clear();
    formList.addAll(temp);
    notifyListeners();
  }

  void onChangedHandler(String value, String s, int index) {
    formList[index][s] = value;
    notifyListeners();
  }

  void onDeleteHandler(int i) async {
    formList.removeAt(i);
    notifyListeners();
    await SharedPreferenceHelper.setString(Preferences.addFields, jsonEncode(formList));
  }
}
