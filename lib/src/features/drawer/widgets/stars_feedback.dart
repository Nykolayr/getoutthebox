import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StarsFeedback extends StatefulWidget {
  final Function(int) onRatingChanged; // Коллбэк для передачи рейтинга
  const StarsFeedback({super.key, required this.onRatingChanged});

  @override
  State<StarsFeedback> createState() => _StarsFeedbackState();
}

class _StarsFeedbackState extends State<StarsFeedback> {
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(10, (index) {
        return GestureDetector(
          child: SvgPicture.asset(
            index < selectedRating
                ? 'assets/icons/star_green.svg' // Активная звезда
                : 'assets/icons/star_gray.svg', // Неактивная звезда
          ),
          onTap: () {
            setState(() {
              selectedRating = index + 1;
            });
            widget.onRatingChanged(selectedRating); // Передаем кол-во звезд
          },
        );
      }),
    );
  }
}
