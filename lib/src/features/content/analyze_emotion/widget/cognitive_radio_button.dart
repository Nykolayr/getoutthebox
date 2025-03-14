import 'package:flutter/material.dart';
import 'package:getoutofthebox/core/common/styles.dart';

class CognitiveRadioButton extends StatefulWidget {
  const CognitiveRadioButton({super.key});

  @override
  State<CognitiveRadioButton> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CognitiveRadioButton> {
  int? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Первый RadioButton
        Column(
          children: [
            Transform.scale(
              scale: 1.67,
              child: Radio<int>(
                value: 1,

                groupValue: _selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                activeColor: StyleManager.mainColor, // Зеленый цвет
              ),
            ),
            Text("Never"),
          ],
        ),

        // Второй RadioButton
        Column(
          children: [
            Transform.scale(
              scale: 1.67,
              child: Radio<int>(
                value: 2,

                groupValue: _selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                activeColor: StyleManager.mainColor, // Зеленый цвет
              ),
            ),
            Text("Rarely"),
          ],
        ),

        // Третий RadioButton
        Column(
          children: [
            Transform.scale(
              scale: 1.67,
              child: Radio<int>(
                value: 3,

                groupValue: _selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                activeColor: StyleManager.mainColor, // Зеленый цвет
              ),
            ),
            Text("Sometimes"),
          ],
        ),
        Column(
          children: [
            Transform.scale(
              scale: 1.67,
              child: Radio<int>(
                value: 4,

                groupValue: _selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                activeColor: StyleManager.mainColor, // Зеленый цвет
              ),
            ),
            Text("Often"),
          ],
        ),

        Column(
          children: [
            Transform.scale(
              scale: 1.67,
              child: Radio<int>(
                value: 5,

                groupValue: _selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                activeColor: StyleManager.mainColor, // Зеленый цвет
              ),
            ),
            Text("Constantly"),
          ],
        ),
      ],
    );
  }
}
