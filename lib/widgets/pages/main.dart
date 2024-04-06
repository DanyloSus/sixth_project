import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:sixth_project/cookie_clicker_model.dart';
import 'package:provider/provider.dart';
import 'package:sixth_project/data/upgrade_data.dart';

import 'pages_wrapper.dart';

String milkLink =
    switch (upgradeList["Kitten"]!.where((element) => element.active).length) {
  0 =>
    "https://static.wikia.nocookie.net/cookieclicker/images/4/45/MilkPlain.png/revision/latest?cb=20180416134613",
  1 =>
    "https://static.wikia.nocookie.net/cookieclicker/images/4/45/MilkPlain.png/revision/latest?cb=20180416134613",
  int() => throw UnimplementedError(),
};

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PagesWrapper(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Consumer<CookieClickerModel>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "${value.cookies.toStringAsFixed(value.cookies.truncateToDouble() == value.cookies ? 0 : 1)} ${value.cookies == 1 ? "cookie" : "cookies"}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                        "CPS: ${value.cps.toStringAsFixed(value.cps.truncateToDouble() == value.cps ? 0 : 1)}")
                  ],
                ),
                const SizedBox(
                  height: 64,
                ),
                TextButton(
                  onPressed: value.addCookie,
                  child: SimpleShadow(
                    opacity: 0.6,
                    offset: const Offset(0, 10),
                    sigma: 10,
                    child: OctoImage(
                      image: const NetworkImage(
                        "https://static.wikia.nocookie.net/cookieclicker/images/5/5a/PerfectCookie.png/revision/latest/scale-to-width-down/250?cb=20130827014912",
                      ),
                      height: 256,
                      fit: BoxFit.contain,
                      progressIndicatorBuilder: (context, progress) {
                        double? value;
                        var expectedBytes = progress?.expectedTotalBytes;
                        if (progress != null && expectedBytes != null) {
                          value =
                              progress.cumulativeBytesLoaded / expectedBytes;
                        }
                        return CircularProgressIndicator(value: value);
                      },
                      errorBuilder: (context, error, stacktrace) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                Expanded(
                  child: OctoImage(
                    image: NetworkImage(
                      switch (upgradeList["Kitten"]!
                          .where((element) => element.active)
                          .length) {
                        0 =>
                          "https://static.wikia.nocookie.net/cookieclicker/images/4/45/MilkPlain.png/revision/latest?cb=20180416134613",
                        1 =>
                          "https://static.wikia.nocookie.net/cookieclicker/images/4/4a/MilkChocolate.png/revision/latest?cb=20180416134634",
                        2 =>
                          "https://static.wikia.nocookie.net/cookieclicker/images/c/c0/MilkRaspberry.png/revision/latest?cb=20180416134645",
                        3 =>
                          "https://static.wikia.nocookie.net/cookieclicker/images/1/1b/MilkOrange.png/revision/latest?cb=20180416134656",
                        4 =>
                          "https://static.wikia.nocookie.net/cookieclicker/images/c/cc/MilkCaramel.png/revision/latest?cb=20180416134706",
                        5 =>
                          "https://static.wikia.nocookie.net/cookieclicker/images/d/da/MilkBlueFire.png/revision/latest?cb=20160209224015",
                        int() => throw UnimplementedError(),
                      },
                    ),
                    width: double.infinity,
                    fit: BoxFit.fill,
                    progressIndicatorBuilder: (context, progress) {
                      double? value;
                      var expectedBytes = progress?.expectedTotalBytes;
                      if (progress != null && expectedBytes != null) {
                        value = progress.cumulativeBytesLoaded / expectedBytes;
                      }
                      return CircularProgressIndicator(value: value);
                    },
                    errorBuilder: (context, error, stacktrace) =>
                        const Icon(Icons.error),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
