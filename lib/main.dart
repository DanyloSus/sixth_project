import "dart:async";

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sixth_project/cookie_clicker_model.dart';
import 'package:sixth_project/widgets/footer.dart';
import 'package:sixth_project/widgets/slider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CookieClickerModel(),
      child: const MyWidget(),
    ),
  );
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _footerIndex = 0;

  late PageController _pageController;
  // ignore: unused_field
  late Timer _timer;

  void changePageBySwipe(int newPage) {
    setState(() {
      _footerIndex = newPage;
      _pageController.animateToPage(
        newPage,
        duration: Durations.short4,
        curve: Curves.easeInOut,
      );
    });
  }

  void changePageByFooter(int newPage) {
    setState(() {
      _footerIndex = newPage;
      _pageController.jumpToPage(
        newPage,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      (timer) {
        setState(
          () {
            Provider.of<CookieClickerModel>(context, listen: false)
                .addCookiePerSec();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Tahoma",
      ).copyWith(
        textTheme: const TextTheme()
            .apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            )
            .copyWith(
              displayLarge: const TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    color: Colors.black,
                  ),
                ],
              ),
              displaySmall: const TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    color: Colors.black,
                  ),
                ],
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: Scaffold(
        body: PageSlider(
          pageController: _pageController,
          changePage: changePageBySwipe,
        ),
        bottomNavigationBar: Footer(
          selectedIndex: _footerIndex,
          onItemTapped: changePageByFooter,
        ),
      ),
    );
  }
}
