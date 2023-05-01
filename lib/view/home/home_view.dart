import 'package:appstore_shoe/animations/fade_animations.dart';
import 'package:appstore_shoe/data/dummy_data.dart';
import 'package:appstore_shoe/models/models.dart';
import 'package:appstore_shoe/theme/custom_app_theme.dart';
import 'package:appstore_shoe/utils/constants.dart';
import 'package:appstore_shoe/view/details/components/details_view.dart';
import 'package:appstore_shoe/view/home/components/home_appbar.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndexOfCategory = 0;
  int selectedIndexOfFeatured = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: const HomeAppBar(),
        body: Column(
          children: <Widget>[
            _categoryView(size),
            SizedBox(
              height: size.height * 0.4,
              child: _mainShoesListView(size),
            ),
            _moreTextAndIcon(),
            _bottomsSideCategory(size),
          ],
        ),
      ),
    );
  }

  SizedBox _bottomsSideCategory(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.29,
      child: ListView.builder(
        itemCount: availableShoes.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          ShoeModel model = availableShoes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsView(
                      isComFromMoreSection: true,
                      model: model,
                    ),
                  ));
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              width: size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 4,
                    child: FadeAnimation(
                      delay: 1,
                      child: Container(
                        width: size.width / 13,
                        height: size.height / 10,
                        color: Colors.red,
                        child: const RotatedBox(
                          quarterTurns: -1,
                          child: Center(
                            child: FadeAnimation(
                              delay: 1.5,
                              child: Text(
                                "N E W",
                                style: AppThemes.homeGridNewText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 5,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: AppConstantsColor.darkTextColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    child: FadeAnimation(
                      delay: 1.5,
                      child: RotationTransition(
                        turns: const AlwaysStoppedAnimation(-13 / 360),
                        child: Hero(
                          tag: model.model,
                          child: Image(
                            image: AssetImage(model.imgAddress),
                            width: size.width * 0.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    child: FadeAnimation(
                      delay: 2,
                      child: Text(
                        '${model.name} ${model.model}',
                        style: AppThemes.homeGridNameAndModel,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: FadeAnimation(
                      delay: 2.2,
                      child: Text(
                        "\$${model.price.toStringAsFixed(2)}",
                        style: AppThemes.homeGridPrice,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _moreTextAndIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('More', style: AppThemes.homeMoreText),
          IconButton(
            onPressed: () {
              // by tapp on this icon you can navigate to your favorite more screen
            },
            icon: const Icon(
              CupertinoIcons.arrow_right,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }

  //main Shoes ListView
  Row _mainShoesListView(Size size) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          width: size.width / 16,
          height: size.height / 2.4,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: featured.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndexOfFeatured = index;
                    });
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Text(
                      featured[index],
                      style: TextStyle(
                        fontSize: selectedIndexOfFeatured == index ? 21 : 18,
                        color: selectedIndexOfFeatured == index
                            ? AppConstantsColor.darkTextColor
                            : AppConstantsColor.unSelectedTextColor,
                        fontWeight: selectedIndexOfFeatured == index
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.89,
          height: size.height * 0.4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: availableShoes.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              ShoeModel model = availableShoes[index];
              return GestureDetector(
                onTap: () {
                  // We will navigate to details screen later on by tapping on these items
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsView(
                          isComFromMoreSection: false,
                          model: model,
                        ),
                      ));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.005,
                      vertical: size.height * 0.01),
                  width: size.width / 1.5,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: size.width / 1.81,
                        decoration: BoxDecoration(
                          color: model.modelColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        child: FadeAnimation(
                          delay: 1,
                          child: Row(
                            children: [
                              Text(model.name,
                                  style: AppThemes.homeProductName),
                              SizedBox(
                                width: size.width * 0.3,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 10,
                        child: FadeAnimation(
                          delay: 1,
                          child: Text(
                            model.model,
                            style: AppThemes.homeProductModel,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 10,
                        child: FadeAnimation(
                          delay: 2,
                          child: Text("\$${model.price.toStringAsFixed(2)}",
                              style: AppThemes.homeProductPrice),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 50,
                        child: FadeAnimation(
                          delay: 2,
                          child: Hero(
                            tag: model.imgAddress,
                            child: RotationTransition(
                              turns: const AlwaysStoppedAnimation(-30 / 360),
                              child: SizedBox(
                                width: 250,
                                height: 230,
                                child: Image(
                                  image: AssetImage(model.imgAddress),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 170,
                        child: IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.circleArrowRight,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  // you can put this method in components folder later
  Widget _categoryView(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.04,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndexOfCategory = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: selectedIndexOfCategory == index ? 21 : 18,
                      color: selectedIndexOfCategory == index
                          ? AppConstantsColor.darkTextColor
                          : AppConstantsColor.unSelectedTextColor,
                      fontWeight: selectedIndexOfCategory == index
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
