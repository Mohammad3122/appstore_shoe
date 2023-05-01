import 'package:appstore_shoe/animations/fade_animations.dart';
import 'package:appstore_shoe/data/dummy_data.dart';
import 'package:appstore_shoe/models/models.dart';
import 'package:appstore_shoe/theme/custom_app_theme.dart';
import 'package:appstore_shoe/utils/app_methods.dart';
import 'package:appstore_shoe/utils/constants.dart';
import 'package:appstore_shoe/view/bag/components/empty_state.dart';
import 'package:flutter/material.dart';


class BagView extends StatefulWidget {
  const BagView({super.key});

  @override
  State<BagView> createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  int lengthOfItemsOnBag = itemsOnBag.length;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          width: width,
          height: height,
          child: Column(
            children: [
              _bagAppBar(width, height),
              // Here is our main ListView Widget which the product Will be here
              itemsOnBag.isEmpty
                  ? const EmptyState()
                  : Column(
                      children: [
                        _mainProductList(width, height),
                        _bottomInfos(width, height),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomInfos(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.13,
      child: Column(
        children: [
          FadeAnimation(
            delay: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: AppThemes.bagProductPrice,
                ),
                Text(
                  "\$${AppMethods.allTheItemsOnBag()}",
                  style: AppThemes.bagSumOfItemOnBag,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          materialButton(width, height),
        ],
      ),
    );
  }

  Widget materialButton(width, height) {
    return FadeAnimation(
      delay: 3,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minWidth: width / 1.2,
        height: height / 15,
        color: AppConstantsColor.materialButtonColor,
        onPressed: () {},
        child: const Text(
          "Next",
          style: TextStyle(
            color: AppConstantsColor.lightTextColor,
          ),
        ),
      ),
    );
  }

  Widget _mainProductList(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.68,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: itemsOnBag.length,
        itemBuilder: (context, index) {
          ShoeModel currentBagItem = itemsOnBag[index];
          return FadeAnimation(
            delay: 1.5 * (index / 4),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              width: width,
              height: height * 0.2,
              child: Row(
                children: [
                  /// item Image
                  SizedBox(
                    width: width * 0.4,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          width: width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: currentBagItem.modelColor.withOpacity(0.4),
                          ),
                        ),
                        Positioned(
                          right: 2,
                          left: 15,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(-40 / 360),
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: Image(
                                image: AssetImage(
                                  currentBagItem.imgAddress,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentBagItem.model,
                        style: AppThemes.bagProductModel,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "\$${currentBagItem.price}",
                        style: AppThemes.bagProductPrice,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              /// We will remove item from List
                              setState(() {
                                itemsOnBag.remove(currentBagItem);
                                lengthOfItemsOnBag = itemsOnBag.length;
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child:
                                Text("1", style: AppThemes.bagProductNumOfShoe),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox _bagAppBar(double width, double height) {
    return SizedBox(
      width: width,
      height: height / 14,
      child: FadeAnimation(
        delay: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("My Bag", style: AppThemes.bagTitle),
            Text(
              "Total $lengthOfItemsOnBag Items",
              style: AppThemes.bagTotalPrice,
            ),
          ],
        ),
      ),
    );
  }
}
