import 'package:flutter/material.dart';
import 'calculator.dart';
import 'button.dart';

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({super.key});

  @override
  State<CalculatorUI> createState() {
    return CalculatorUIState();
  }
}

class CalculatorUIState extends State<CalculatorUI> {
  CalculatorLogic logic = CalculatorLogic();

  List<List<Map<String, dynamic>>> buttonData = [
    [
      {'label': 'AC', 'color': Colors.orange.shade600},
      {'label': '%', 'color': Colors.purple.shade600},
      {'label': '÷', 'value': '/', 'color': Colors.purple.shade600},
      {'label': '×', 'value': '*', 'color': Colors.purple.shade600},
    ],
    [
      {'label': '7'},
      {'label': '8'},
      {'label': '9'},
      {'label': '-', 'color': Colors.purple.shade600},
    ],
    [
      {'label': '4'},
      {'label': '5'},
      {'label': '6'},
      {'label': '+', 'color': Colors.purple.shade600},
    ],
    [
      {'label': '1'},
      {'label': '2'},
      {'label': '3'},
    ],
    [
      {'label': '0'},
      {'label': '.'},
      {'label': 'CE', 'color': Colors.orange.shade600},
    ],
  ];

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.purple.shade600,
      ),
    );
  }

  void onButtonPress(String value) {
    setState(() {
      String oldText = logic.text;

      if (value == 'CE') {
        if (logic.text.length > 1) {
          logic.text = logic.text.substring(0, logic.text.length - 1);
        } else {
          logic.text = '0';
        }
        return;
      }

      if (value == '%') {
        if (logic.text.endsWith(' ') || logic.text == '0') {
          return;
        }
        logic.text = '${logic.text} % ';
        return;
      }

      logic.press(value);

      if (value == '=') {
        if (logic.text == 'Error') {
          showMessage('Error: Invalid calculation or division by zero!');
        } else if (logic.text == oldText && oldText != '0') {
          showMessage('Error: Invalid expression!');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.purple.shade700,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Spacer(),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.purple.shade200),
                  ),
                  child: Text(
                    logic.text.replaceAll('*', '×').replaceAll('/', '÷'),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.purple.shade800,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Column(
                  children: [
                    Row(
                      children: buttonData[0].map((buttonInfo) {
                        return Expanded(
                          child: CalculatorButton(
                            label: buttonInfo['label'],
                            backgroundColor:
                                buttonInfo['color'] ?? Colors.white,
                            textColor: buttonInfo['color'] != null
                                ? Colors.white
                                : Colors.black,
                            fontSize: 18,
                            height: 50,
                            onPressed: () => onButtonPress(
                              buttonInfo['value'] ?? buttonInfo['label'],
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    Row(
                      children: buttonData[1].map((buttonInfo) {
                        return Expanded(
                          child: CalculatorButton(
                            label: buttonInfo['label'],
                            backgroundColor:
                                buttonInfo['color'] ?? Colors.white,
                            textColor: buttonInfo['color'] != null
                                ? Colors.white
                                : Colors.black,
                            fontSize: 20,
                            height: 50,
                            onPressed: () => onButtonPress(
                              buttonInfo['value'] ?? buttonInfo['label'],
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    Row(
                      children: buttonData[2].map((buttonInfo) {
                        return Expanded(
                          child: CalculatorButton(
                            label: buttonInfo['label'],
                            backgroundColor:
                                buttonInfo['color'] ?? Colors.white,
                            textColor: buttonInfo['color'] != null
                                ? Colors.white
                                : Colors.black,
                            fontSize: 20,
                            height: 50,
                            onPressed: () => onButtonPress(
                              buttonInfo['value'] ?? buttonInfo['label'],
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Row(
                                children: buttonData[3].map((buttonInfo) {
                                  return Expanded(
                                    child: CalculatorButton(
                                      label: buttonInfo['label'],
                                      backgroundColor: Colors.white,
                                      textColor: Colors.black,
                                      fontSize: 20,
                                      height: 50,
                                      onPressed: () => onButtonPress(
                                        buttonInfo['value'] ??
                                            buttonInfo['label'],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              Row(
                                children: buttonData[4].map((buttonInfo) {
                                  return Expanded(
                                    child: CalculatorButton(
                                      label: buttonInfo['label'],
                                      backgroundColor:
                                          buttonInfo['color'] ?? Colors.white,
                                      textColor: buttonInfo['color'] != null
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 20,
                                      height: 50,
                                      onPressed: () => onButtonPress(
                                        buttonInfo['value'] ??
                                            buttonInfo['label'],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: CalculatorButton(
                            label: '=',
                            backgroundColor: Colors.orange.shade600,
                            textColor: Colors.white,
                            fontSize: 28,
                            height: 108,
                            onPressed: () => onButtonPress('='),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
