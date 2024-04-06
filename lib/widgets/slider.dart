import 'package:flutter/material.dart';
import 'package:sixth_project/widgets/pages/main.dart';
import 'package:sixth_project/widgets/pages/store.dart';
import 'package:sixth_project/widgets/pages/upgrades.dart';

class PageSlider extends StatefulWidget {
  const PageSlider({
    super.key,
    required this.pageController,
    required this.changePage,
  });

  final PageController pageController;
  final void Function(int) changePage;

  @override
  State<PageSlider> createState() => _PageSliderState();
}

class _PageSliderState extends State<PageSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: PageView(
        controller: widget.pageController,
        onPageChanged: widget.changePage,
        children: const [
          MainPage(),
          StorePage(),
          UpgradesPage(),
        ],
      ),
    );
  }
}
