import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/src/features/content/analyze_emotion/widget/title_step.dart';
import 'package:getoutofthebox/src/features/drawer/custom_drawer.dart';
import 'package:getoutofthebox/src/features/widgets/custom_back_button.dart';
import 'package:getoutofthebox/src/features/widgets/custon_next_button.dart';

/// страница с заголовком и кнопками внизу
class WrapPage extends StatefulWidget {
  final Widget content;
  final String title;
  final Function() onNext;
  final bool isNextButtonVisible;
  final String? titleButton;

  const WrapPage({
    super.key,
    required this.content,
    required this.title,
    required this.onNext,
    this.isNextButtonVisible = true,
    this.titleButton,
  });

  @override
  State<WrapPage> createState() => _WrapPageState();
}

class _WrapPageState extends State<WrapPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: SvgPicture.asset('assets/icons/hamburger.svg'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const CustomDrawer(),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),

          Positioned(
            top: 46,
            right: 16,
            left: 200,
            child: TitleSimple(title: widget.title),
          ),
          Positioned.fill(
            top: 140,
            right: 16,
            bottom: 100,
            left: 16,
            child: widget.content,
          ),

          /// bottom navigation bar
          Positioned(
            bottom: 10,
            left: 16,
            right: 16,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomBackButton(),
                  widget.isNextButtonVisible
                      ? CustomNextButton(
                          title: widget.titleButton,
                          onPressed: () {
                            widget.onNext();
                          },
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
