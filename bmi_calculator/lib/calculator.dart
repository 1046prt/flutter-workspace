double calculateBMI(int height, int weight) {
  double heightInMeters = height / 100.0;
  double bmi = weight / (heightInMeters * heightInMeters);
  return bmi;
}

String getBMICategory(double bmi) {
  if (bmi < 18.5) {
    return 'Underweight';
  } else if (bmi >= 18.5 && bmi < 25) {
    return 'Optimum Range';
  } else if (bmi >= 25 && bmi < 30) {
    return 'Overweight';
  } else if (bmi >= 30 && bmi < 35) {
    return 'Class I Obesity';
  } else if (bmi >= 35 && bmi < 40) {
    return 'Class II Obesity';
  } else {
    return 'Class III Obesity';
  }
}

String getHealthMessage(double bmi) {
  if (bmi < 18.5) {
    return 'Your body weight is below the recommended range. A balanced, nutrient-rich diet may help improve overall well-being.';
  } else if (bmi >= 18.5 && bmi < 25) {
    return 'Your body weight falls within the healthy range. Keep up the good work and maintain your current lifestyle.';
  } else if (bmi >= 25 && bmi < 30) {
    return 'Your body weight is slightly above the recommended range. Incorporating regular physical activity may be beneficial.';
  } else if (bmi >= 30 && bmi < 35) {
    return 'This falls under Class I obesity. Adopting sustainable lifestyle changes and seeking professional guidance is advisable.';
  } else if (bmi >= 35 && bmi < 40) {
    return 'This falls under Class II obesity. Consulting a healthcare professional is strongly recommended for personalized support.';
  } else {
    return 'This falls under Class III obesity. Medical guidance is essential to ensure proper care and long-term health management.';
  }
}
