import 'package:health_care/utils/const.dart';
import 'package:flutter/material.dart';

TextField InputField(BuildContext context,String s,TextInputType type,TextEditingController controller) {
    return TextField(
      keyboardType:type,
      controller: controller,
                  style: const TextStyle(fontSize: 20),
                  onTapOutside:(event) => FocusScope.of(context).requestFocus(FocusNode()),
                  decoration: InputDecoration(
                    focusColor: Constants.lightBlue,
                      hintText: s,
                      hintStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),),
                      labelText: s,
                      labelStyle: const TextStyle(color: Colors.black)),
                );
  }