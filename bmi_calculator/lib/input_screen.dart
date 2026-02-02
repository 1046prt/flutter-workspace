import 'package:flutter/material.dart';
import 'result_screen.dart';
import 'calculator.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String selectedGender = '';
  int height = 170;
  int weight = 70;
  int age = 20;

  Widget buildGenderCard({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF1D1E33) : Color(0xFF111328),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 80, color: Colors.white),
              SizedBox(height: 15),
              Text(
                label,
                style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildValueCard({
    required String label,
    required int value,
    required VoidCallback onMinus,
    required VoidCallback onPlus,
    required String minusTag,
    required String plusTag,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCircleButton(
                  heroTag: minusTag,
                  icon: Icons.remove,
                  onPressed: onMinus,
                ),
                SizedBox(width: 10),
                buildCircleButton(
                  heroTag: plusTag,
                  icon: Icons.add,
                  onPressed: onPlus,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCircleButton({
    required String heroTag,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      backgroundColor: Color(0xFF4C4F5E),
      mini: true,
      child: Icon(icon, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                buildGenderCard(
                  label: 'MALE',
                  icon: Icons.male,
                  isSelected: selectedGender == 'male',
                  onTap: () {
                    setState(() {
                      selectedGender = 'male';
                    });
                  },
                ),
                buildGenderCard(
                  label: 'FEMALE',
                  icon: Icons.female,
                  isSelected: selectedGender == 'female',
                  onTap: () {
                    setState(() {
                      selectedGender = 'female';
                    });
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Colors.purple,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Row(
              children: [
                buildValueCard(
                  label: 'WEIGHT',
                  value: weight,
                  minusTag: 'weight-minus',
                  plusTag: 'weight-plus',
                  onMinus: () {
                    setState(() {
                      if (weight > 1) weight--;
                    });
                  },
                  onPlus: () {
                    setState(() {
                      weight++;
                    });
                  },
                ),
                buildValueCard(
                  label: 'AGE',
                  value: age,
                  minusTag: 'age-minus',
                  plusTag: 'age-plus',
                  onMinus: () {
                    setState(() {
                      if (age > 1) age--;
                    });
                  },
                  onPlus: () {
                    setState(() {
                      age++;
                    });
                  },
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              double bmi = calculateBMI(height, weight);
              String category = getBMICategory(bmi);
              String message = getHealthMessage(bmi);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    bmi: bmi,
                    category: category,
                    message: message,
                  ),
                ),
              );
            },
            child: Container(
              color: Colors.purple,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80,
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
