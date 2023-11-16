class Dashboard {
  String result;
  String selectedActivityType;
  String duration;
  String calories;
  String selectedFoodType;
  String selectedExerciseType;
  bool saveToLog;

  Dashboard({
    required this.selectedActivityType,
    required this.selectedExerciseType,
    required this.selectedFoodType,
    required this.duration,
    required this.calories,
    required this.result,
    this.saveToLog = false;
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) {
    return Dashboard(
      selectedActivityType: json["selectedActivityType"],
      selectedExerciseType: json["selectedExerciseType"],
      selectedFoodType: json["selectedFoodType"],
      duration: json["duration"],
      calories: json["calories"],
      result: json["result"],
      saveToLog: json["saveToLog"],
    );
  }

  double calculateCalories() {
    double met;

    // Convert height to inches and weight to lbs
    double heightInInches = double.parse(heightInput);
    double weightInLbs = double.parse(weightInput);

    // Convert activity duration to hours
    double durationInHours = double.parse(durationInput.split(' ')[0]) / 60;

    // Calculate BMR based on gender
    double bmr = (selectedGender.toLowerCase() == 'male')
        ? (13.75 * (weightInLbs / 2.20462)) +
        (5 * heightInInches) -
        (6.76 * double.parse(ageInput)) +
        66
        : (9.56 * (weightInLbs / 2.20462)) +
        (1.85 * heightInInches) -
        (4.68 * double.parse(ageInput)) +
        655;

    // Assign MET based on selected exercise type
    String activity = selectedExerciseType.toLowerCase();
    switch (activity) {
      case 'running':
        met = 11.5;
        break;
      case 'walking':
        met = 5;
        break;
      case 'cycling':
        met = 8;
        break;
      case 'swimming':
        met = 9.5;
        break;
      default:
        met = 0;
    }

  @override
  String result() {
    if (selectedActivityType == 'Exercise') {
      // Handle exercise activity
      double burnedCalories = calculateCalories();
      String exerciseResult =
          'Exercise Type: $selectedExerciseType\nDuration: $duration\nBurned Calories: ${burnedCalories.toStringAsFixed(2)} calories';
      print(exerciseResult);
    } else {
      // Handle food activity
      String foodResult =
          'Food Type: $selectedFoodType\nCalories: ${calories}';
      print(foodResult);
    }
}
