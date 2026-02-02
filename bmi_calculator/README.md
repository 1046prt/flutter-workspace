# BMI Calculator App 🏥

A simple and beginner-friendly Flutter app to calculate Body Mass Index (BMI).

## 📁 Project Structure

```
lib/
├── main.dart           # App entry point with dark theme
├── input_screen.dart   # Main screen for user input
├── result_screen.dart  # Screen to display BMI results
└── calculator.dart     # BMI calculation functions
```

## 📱 Features

### Input Screen

- **Gender Selection**: Choose between Male or Female
- **Height Slider**: Adjust height from 120-220 cm
- **Weight Control**: Use +/- buttons to set weight in kg
- **Age Control**: Use +/- buttons to set age
- **Calculate Button**: Computes BMI and navigates to results

### Result Screen

- **BMI Value**: Shows calculated BMI (rounded to 1 decimal)
- **Category**: Displays health category with color coding
  - Underweight (< 18.5) - Blue
  - Normal (18.5-24.9) - Green
  - Overweight (25-29.9) - Orange
  - Obese (≥ 30) - Red
- **Health Message**: Friendly feedback based on BMI
- **Re-Calculate Button**: Returns to input screen

## 🎨 Design

- Dark theme interface
- Card-based layout
- Smooth interactions
- Mobile-friendly

## 🧮 BMI Formula

```
BMI = weight (kg) / (height (m))²
```

## 🚀 How to Run

1. Make sure Flutter is installed
2. Open terminal in project folder
3. Run: `flutter run`
4. Select your device (Chrome, Edge, or mobile device)

## 📚 Code Explanation

### calculator.dart

Simple functions for BMI calculations:

- `calculateBMI()` - Computes BMI from height and weight
- `getBMICategory()` - Returns category based on BMI value
- `getHealthMessage()` - Provides health feedback

### input_screen.dart

Main screen with user inputs:

- Uses `StatefulWidget` to track user selections
- `setState()` updates the UI when values change
- Simple navigation to result screen

### result_screen.dart

Displays BMI results:

- Uses `StatelessWidget` (no changing data)
- Receives BMI data from input screen
- Color-coded categories for easy understanding

### main.dart

App setup:

- Configures dark theme
- Sets input screen as home page

## 🎓 Beginner-Friendly Features

✅ Simple, easy-to-read code  
✅ Clear comments explaining each part  
✅ No complex state management  
✅ Basic Flutter widgets only  
✅ Step-by-step logic flow

Perfect for learning Flutter basics! 🚀
