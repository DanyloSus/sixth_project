import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:sixth_project/cookie_clicker_model.dart';
import 'package:sixth_project/widgets/pages/pages_wrapper.dart';
import 'package:sixth_project/widgets/shop_element.dart';

import '../../classes/shop_element.dart';
import '../../data/shop_data.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return PagesWrapper(
      child: Row(
        children: [
          OctoImage(
            image: const NetworkImage(
              "https://orteil.dashnet.org/cookieclicker/img/panelVertical.png?v=2",
            ),
            height: double.infinity,
            fit: BoxFit.contain,
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
          Expanded(
            child: Column(
              children: [
                Text(
                  "Store",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SimpleShadow(
                  offset: const Offset(0, 0),
                  sigma: 10,
                  child: OctoImage(
                    image: const NetworkImage(
                      "https://orteil.dashnet.org/cookieclicker/img/panelHorizontal.png?v=2",
                    ),
                    width: double.infinity,
                    fit: BoxFit.contain,
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
                Expanded(
                  child: Consumer<CookieClickerModel>(
                    builder: (BuildContext context, CookieClickerModel value,
                        Widget? child) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: shopElements.length,
                        itemBuilder: (context, index) {
                          final ShopElement shopElement =
                              shopElements[shopElements.keys.toList()[index]]!;

                          return ShopElementWidget(
                              image: shopElement.image,
                              name: shopElement.name,
                              price: shopElement.price,
                              level: shopElement.level,
                              canBuy: value.cookies >= shopElement.price,
                              onPressed: () {
                                setState(() {
                                  if (value.cookies >= shopElement.price) {
                                    value.cookies -= shopElement.price;
                                    shopElement.buy();
                                  }
                                });
                              });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          OctoImage(
            image: const NetworkImage(
              "https://orteil.dashnet.org/cookieclicker/img/panelVertical.png?v=2",
            ),
            height: double.infinity,
            fit: BoxFit.contain,
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
        ],
      ),
    );
  }
}
