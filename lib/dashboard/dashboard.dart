import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String selectedActivityType = 'Food'; // Default selection
  String selectedExerciseType = 'Running'; // Default exercise type
  String selectedFoodType = ''; // Default food type
  String durationInput = ''; // Default duration
  String caloriesInput = ''; // Default calories
  bool saveToLog = false; // Default log saving option
  bool showResults = false; // Flag to control the visibility of results
  List<String> results = []; // List to store multiple results

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            Text(
              "Dashboard",
              style: GoogleFonts.adamina(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Text(
                  'Select Activity Type:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'BeautifulFont'),
                ),
                SizedBox(width: 30),
                DropdownButton<String>(
                  value: selectedActivityType,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedActivityType = newValue!;
                    });
                  },
                  items: <String>['Food', 'Exercise']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(fontFamily: 'BeautifulFont')),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (selectedActivityType == 'Exercise') ...[
              Row(
                children: [
                  Text(
                    'Select Exercise Type:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'BeautifulFont'),
                  ),
                  SizedBox(width: 20),
                  DropdownButton<String>(
                    value: selectedExerciseType,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedExerciseType = newValue!;
                      });
                    },
                    items: <String>['Running', 'Cycling', 'Walking', 'Jogging']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(fontFamily: 'BeautifulFont')),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Enter Duration:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'BeautifulFont'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      initialValue: durationInput,
                      onChanged: (value) {
                        setState(() {
                          // Ensure the ' minutes' suffix is always present
                          durationInput = value.isEmpty ? '' : '$value minutes';
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'e.g., 30',
                        suffixText: ' minutes',
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      keyboardType: TextInputType.number, // This restricts input to numbers only
                      style: TextStyle(fontFamily: 'BeautifulFont'),
                    ),
                  ),
                ],
              ),
            ],
            if (selectedActivityType == 'Food') ...[
              Row(
                children: [
                  Text(
                    'Enter Food Type:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'BeautifulFont'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      initialValue: selectedFoodType,
                      onChanged: (value) {
                        setState(() {
                          selectedFoodType = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'e.g., Pizza',
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      style: TextStyle(fontFamily: 'BeautifulFont'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Enter Calories:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'BeautifulFont'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      initialValue: caloriesInput,
                      onChanged: (value) {
                        setState(() {
                          caloriesInput = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'e.g., 300 calories',
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      keyboardType: TextInputType.number, // This restricts input to numbers only
                      style: TextStyle(fontFamily: 'BeautifulFont'),
                    ),
                  ),
                ],
              ),
            ],
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Save calculation to Log',
                  style: TextStyle(fontSize: 16, fontFamily: 'BeautifulFont'),
                ),
                Checkbox(
                  value: saveToLog,
                  onChanged: (bool? value) {
                    setState(() {
                      saveToLog = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 2),
            ElevatedButton(
              onPressed: () {
                // Perform actions based on the selected activity type
                if (selectedActivityType == 'Exercise') {
                  // Handle exercise activity
                  String exerciseResult =
                      'Exercise Type: $selectedExerciseType, Duration: $durationInput';
                  print(exerciseResult);
                  results.add(exerciseResult); // Save result to the list
                } else {
                  // Handle food activity
                  String foodResult =
                      'Food Type: $selectedFoodType, Calories: $caloriesInput';
                  print(foodResult);
                  results.add(foodResult); // Save result to the list
                }

                // Save to log if the checkbox is checked
                if (saveToLog) {
                  saveToLogFunction(results);
                }

                // Show the results under the button
                setState(() {
                  showResults = true;
                });
              },
              child: Text('Submit', style: TextStyle(fontFamily: 'BeautifulFont')),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 180, 140, 255),
              ),
            ),
            if (showResults) ...[
              SizedBox(height: 5),
              Text(
                'Results:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'BeautifulFont'),
              ),
              SizedBox(height: 10),
              for (String result in results) ...[
                Text(
                  result,
                  style: TextStyle(fontFamily: 'BeautifulFont'),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  void saveToLogFunction(List<String> results) {
    // Implement your logic to save the calculation results to the log
    print('Saving to log...');
    for (String result in results) {
      print(result);
    }
  }
}
