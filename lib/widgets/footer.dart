import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/bgBlue.jpg",
            ),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -10),
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ]),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.transparent,
              Colors.transparent,
              Colors.black,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.25),
          onTap: onItemTapped,
          items: const [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.cookie),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.shopping_bag),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.upgrade),
            ),
          ],
        ),
      ),
    );
  }
}
