import 'package:flutter/material.dart';
import 'package:getoutofthebox/src/features/content/wrap_page.dart';
import 'package:getoutofthebox/src/models/therapeutic_games_response_model.dart';

class ExampleCards extends StatelessWidget {
  final TherapeuticGame game;
  const ExampleCards({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return WrapPage(
      title: 'Example\nCards',
      onNext: () {},
      isNextButtonVisible: true,
      content: Container(),
      titleButton: 'Done',
    );
  }
}
