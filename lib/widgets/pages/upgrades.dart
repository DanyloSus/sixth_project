import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:sixth_project/widgets/pages/pages_wrapper.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../cookie_clicker_model.dart';
import '../../data/upgrade_data.dart';

class UpgradesPage extends StatefulWidget {
  const UpgradesPage({super.key});

  @override
  State<UpgradesPage> createState() => _UpgradesPageState();
}

class _UpgradesPageState extends State<UpgradesPage> {
  @override
  Widget build(BuildContext context) {
    return PagesWrapper(
      child: Column(
        children: [
          Text(
            "Upgrades",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 8,
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
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: upgradeList.length,
                  itemBuilder: (context, index) {
                    final category = upgradeList.keys.toList()[index];

                    return StickyHeader(
                      header: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://orteil.dashnet.org/cookieclicker/img/panelHorizontal.png?v=2",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Text(
                          category,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      content: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.transparent,
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 6,
                          primary: false,
                          children: [
                            ...upgradeList[category]!
                                .where((e) => !e.active)
                                .map(
                                  (e) => TextButton(
                                    onPressed: () {
                                      if (value.cookies >= e.price &&
                                          !e.active) {
                                        setState(() {
                                          e.buy();
                                          value.cookies -= e.price;
                                        });
                                      }
                                    },
                                    child: Image.network(
                                      e.image,
                                      opacity: AlwaysStoppedAnimation(
                                        value.cookies >= e.price && !e.active
                                            ? 1
                                            : 0.5,
                                      ),
                                      width: 64,
                                      height: 64,
                                    ),
                                  ),
                                ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
