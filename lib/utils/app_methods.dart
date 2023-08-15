import 'package:appstore_shoe/components/custom_snackbars.dart';
import 'package:appstore_shoe/data/dummy_data.dart';
import 'package:appstore_shoe/models/models.dart';
import 'package:flutter/material.dart';

class AppMethods {
  AppMethods._();

  static void addToCArt(ShoeModel data, BuildContext context) {
    // if its true, we have that item already , otherwise we will add it inside rhe List
    bool contains = itemsOnBag.contains(data);

    if (contains) {
      //we have it
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackBars.failedSnackBar());
    } else {
      itemsOnBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackBars.successSnackBar());
    }
  }

  static double allTheItemsOnBag() {
    double sumPrice = 0.0;
    for (ShoeModel item in itemsOnBag) {
      sumPrice = sumPrice + item.price;
    }
    return sumPrice;
  }
}
