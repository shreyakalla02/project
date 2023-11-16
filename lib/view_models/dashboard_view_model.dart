import 'package:flutter/material.dart';
import 'package:project/models/dashboard.dart';

class DashBoardViewModel {
  final Dashboard dashboardDetails;

  DashBoardViewModel((required this.dashboardDetails));

  String get selectedActivityType()
  {
    return this.dashboardDetails.selectedActivityType;
  }

  String get duration()
  {
  return this.dashboardDetails.duration;
  }

  String get calories()
  {
  return this.dashboardDetails.calories;
  }

  String get selectedFoodType()
  {
  return this.dashboardDetails.selectedFoodType;
  }

  String get selectedExerciseType()
  {
  return this.dashboardDetails.selectedExerciseType;
  }

  String get result()
  {
  return this.dashboardDetails.result;
  }


}

