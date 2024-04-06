import 'package:flutter/material.dart';
import 'package:sixth_project/data/upgrade_data.dart';

import 'data/shop_data.dart';

class CookieClickerModel extends ChangeNotifier {
  double cookies = 99999999;

  int get click =>
      1 + 2 * upgradeList["Clicks"]!.where((element) => element.active).length;

  double get cps =>
      (shopElements["Cursor"]!.level * 0.1 * (upgradeList["Cursors"]!.where((element) => element.active).length + 1) +
          shopElements["Grandma"]!.level *
              1 *
              (upgradeList["Grandma"]!.where((element) => element.active).length +
                  1) +
          shopElements["Farm"]!.level *
              8 *
              (upgradeList["Farm"]!.where((element) => element.active).length +
                  1) +
          shopElements["Mine"]!.level *
              47 *
              (upgradeList["Mine"]!.where((element) => element.active).length +
                  1) +
          shopElements["Factory"]!.level *
              260 *
              (upgradeList["Factory"]!.where((element) => element.active).length +
                  1) +
          shopElements["Bank"]!.level *
              1400 *
              (upgradeList["Bank"]!.where((element) => element.active).length +
                  1) +
          shopElements["Temple"]!.level *
              7800 *
              (upgradeList["Temple"]!.where((element) => element.active).length +
                  1) +
          shopElements["Wizard Tower"]!.level *
              44000 *
              (upgradeList["Wizard Tower"]!
                      .where((element) => element.active)
                      .length +
                  1) +
          shopElements["Shipment"]!.level *
              260000 *
              (upgradeList["Shipment"]!.where((element) => element.active).length +
                  1) +
          shopElements["Alchemy Lab"]!.level *
              1600000 *
              (upgradeList["Alchemy Lab"]!.where((element) => element.active).length +
                  1) +
          shopElements["Portal"]!.level *
              10000000 *
              (upgradeList["Portal"]!.where((element) => element.active).length +
                  1) +
          shopElements["Time Machine"]!.level *
              65000000 *
              (upgradeList["Time Machine"]!.where((element) => element.active).length + 1) +
          shopElements["Antimatter Condenser"]!.level * 430000000 * (upgradeList["Antimatter Condenser"]!.where((element) => element.active).length + 1) +
          shopElements["Prism"]!.level * 2900000000 * (upgradeList["Prism"]!.where((element) => element.active).length + 1) +
          shopElements["Chancemaker"]!.level * 21000000000 * (upgradeList["Chancemaker"]!.where((element) => element.active).length + 1) +
          shopElements["Fractal Engine"]!.level * 150000000000 * (upgradeList["Fractal Engine"]!.where((element) => element.active).length + 1) +
          shopElements["Flutter Console"]!.level * 1100000000000 * (upgradeList["Flutter Console"]!.where((element) => element.active).length + 1)) *
      (upgradeList["Kitten"]!.where((element) => element.active).length + 1);

  void addCookie() {
    cookies += click;
    notifyListeners();
  }

  void addCookiePerSec() {
    cookies += cps;
    notifyListeners();
  }
}
