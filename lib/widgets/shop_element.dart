import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopElementWidget extends StatelessWidget {
  const ShopElementWidget({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.level,
    required this.onPressed,
    required this.canBuy,
  });

  final String image;
  final String name;
  final int price;
  final int level;
  final bool canBuy;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/storeTile1.jpg",
          ),
          fit: BoxFit.fill,
        ),
      ),
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(
            canBuy ? 0 : 0.3,
          ),
        ),
        child: Opacity(
          opacity: canBuy ? 1 : 0.5,
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(
                      image,
                      width: 64,
                      height: 64,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.merriweather(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              letterSpacing: -1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Image.network(
                              "https://static.wikia.nocookie.net/cookieclicker/images/5/59/Money.png/revision/latest?cb=20130901231119",
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              price.toString(),
                              style: TextStyle(
                                color: canBuy
                                    ? const Color.fromRGBO(
                                        102,
                                        255,
                                        102,
                                        1,
                                      )
                                    : const Color.fromRGBO(
                                        255,
                                        102,
                                        102,
                                        1,
                                      ),
                                shadows: const [
                                  Shadow(
                                    offset: Offset(
                                      0,
                                      0,
                                    ),
                                    color: Colors.black,
                                    blurRadius: 4,
                                  ),
                                  Shadow(
                                    offset: Offset(
                                      0,
                                      1,
                                    ),
                                    color: Colors.black,
                                    blurRadius: 0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  level.toString(),
                  style: GoogleFonts.merriweather(
                    textStyle: const TextStyle(
                      color: Color.fromRGBO(
                        0,
                        0,
                        0,
                        0.2,
                      ),
                      fontSize: 40,
                      shadows: <Shadow>[
                        Shadow(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          offset: Offset(0, 0),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
