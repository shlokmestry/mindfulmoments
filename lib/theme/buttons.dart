import 'package:flutter/material.dart';
import 'colors.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
    minimumSize: const Size(250, 55),
    backgroundColor: AppColors.blackColor ,
    elevation: 0,
    shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)));
