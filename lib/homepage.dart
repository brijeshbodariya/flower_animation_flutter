import 'dart:async';

import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flower_animation_flutter/flower_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cart_items_screen.dart';
import 'model/local_model/homepage_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with FlareController {
  double rockAmount = 0.5;
  double speed = 0.5;
  double rockTime = 0.0;
  bool isPaused = false;
  ActorAnimation? rock;
  AnimationController? animationController;
  double listFlowerLeftAnimation = 180.0;
  double popularFlowerNameListLeftAnimation = 120.0;
  double flowerNameTopAnimated = 0.0;
  double animationTopAppNAme = 0.0;
  double animationTopAppNameWidth = 0.0;
  double animationTopAppNameHeight = 0.0;
  double animatedTopBarActionsButtonsRight = 2.0;
  double animationBottomNavigationBarHeight = 0.0;
  double animationTopAppNAmeBouquet = 10.0;
  double animatedAppNameBouquetTop = 0.0;
  double animatedPopularFlowerNameListHorizontal = 0.0;
  double flowerNameTopAnimated_2 = 0.0;
  double flowerNameTopAnimated_3 = 0.0;
  double flowerNameTopAnimated_4 = 0.0;
  double animatedPopularFlowerTextHeight = 0.0;
  double animatedLeafRight = 20.0;
  double animationTopLeaf = 0.0;
  bool invisibleContainerView = false;
  Duration listOfFlowerCardDuration = const Duration(milliseconds: 1000);
  bool animatePropertiesOrNot = true;
  String selectedListType = "Basket";
  double animatedSelectedBarTop = 373.0;
  ScrollController? scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController(initialScrollOffset: 0);

    /* animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 1),
    );

    animationController.forward();*/
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (animatePropertiesOrNot == true) {
      animateProperties();
    }
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBar(size),
        //   backgroundColor: Colors.blue,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: size.width,
                    height: size.height / 1.5,
                  ),
                  backgroundImage(size),
/*                  AnimatedPositioned(
                    duration: Duration(milliseconds: 600),
                    top: animationTopLeaf,
                    right: animatedLeafRight,
                   child:  AnimatedBuilder(
                     animation: animationController,
                       child: Image.asset("assets/images/leaf.png",height: 150,width: 60,fit:BoxFit.cover,),
                       builder: (BuildContext context, Widget _widget) {
                         return new Transform.rotate(

                           angle: animationController.value -1.6 ,
                           child: _widget,
                         );
                     }),
                    )*/

// leaf animation
                  Positioned(
                    //  duration: Duration(milliseconds: 600),
                    top: -100,
                    right: -50,
                    child: SizedBox(
                      height: 450,
                      width: 200,
                      child: FlareActor("assets/images/dark_leaf_anim.flr",
                          alignment: Alignment.center,
                          isPaused: isPaused,
                          fit: BoxFit.fitHeight,
                          animation: "success",
                          controller: this),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 800),
                    top: animatedSelectedBarTop,
                    left: 45,
                    child: tabBaRSelected(),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.decelerate,
                    left: 0,
                    top: flowerNameTopAnimated,
                    child: InkWell(
                      onTap: () => animateListCartProperties(size, "Basket"),
                      child: flowerName(size),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.decelerate,
                    left: 0,
                    top: flowerNameTopAnimated_2,
                    child: InkWell(
                      onTap: () => animateListCartProperties(size, "Wedding"),
                      child: weddingText(
                        size,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.decelerate,
                    duration: const Duration(milliseconds: 800),
                    left: 0,
                    top: flowerNameTopAnimated_3,
                    child: InkWell(
                      onTap: () => animateListCartProperties(size, "Rose"),
                      child: roseText(size),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.decelerate,
                    duration: const Duration(milliseconds: 1000),
                    left: 0,
                    top: flowerNameTopAnimated_4,
                    child: InkWell(
                      onTap: () => animateListCartProperties(size, "Bouquet"),
                      child: bouquetText(size),
                    ),
                  ),
                  AnimatedPositioned(
                      // duration: listOfFlowerCardDuration,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOutBack,
                      left: listFlowerLeftAnimation,
                      top: size.height / 5,
                      child: listFlower(size)),
                  AnimatedPositioned(
                    left: 27,
                    top: animationTopAppNAme,
                    duration: const Duration(milliseconds: 400),
                    child: AnimatedContainer(
                      width: animationTopAppNameWidth,
                      height: animationTopAppNameHeight,
                      duration: const Duration(milliseconds: 600),
                      child: Text("Specialty",
                          style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  AnimatedPositioned(
                    left: 27,
                    top: animatedAppNameBouquetTop,
                    duration: const Duration(milliseconds: 600),
                    child: AnimatedContainer(
                      width: animationTopAppNameWidth,
                      height: 50,
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.easeInOutBack,
                      child: Text("Bouquet",
                          style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),

                  AnimatedPositioned(
                    right: animatedTopBarActionsButtonsRight,
                    top: 20.0,
                    duration: const Duration(milliseconds: 400),
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 24,
                            )),
                        Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Image.asset(
                              "assets/images/menu_icon.png",
                              height: 18,
                              width: 18,
                              fit: BoxFit.fill,
                            )),
                      ],
                    ),
                  )
                ],
              ),
              popularFlowers(size),
            ],
          ),
        ),
      ),
    );
  }

  backgroundImage(size) {
    return ClipPath(
        clipper: TopBackgroundImageClipper(),
        child: SizedBox(
          height: 260,
          width: size.width,
          child: Image.asset(
            "assets/images/back_groundImage.png",
            fit: BoxFit.fill,
          ),

//          decoration: BoxDecoration(
//              gradient: LinearGradient(
//                  begin: Alignment.centerLeft,
//                  end: Alignment.centerRight,
//                  colors: [Color(0xff6CA62A), Color(0xff315D47)])
//
//          ),
        ));
  }

  bottomNavigationBar(size) => AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        height: animationBottomNavigationBarHeight,
        curve: Curves.easeInOutBack,
        width: size.width,
        decoration: const BoxDecoration(
          color: Color(0xffF2A510),
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(40, 35),
            topRight: Radius.elliptical(40, 35),
          ),
        ),
        // margin: EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                "assets/images/home.png",
                height: 20,
                width: 20,
                fit: BoxFit.cover,
                color: Colors.white,
              ),
              Image.asset(
                "assets/images/like.png",
                height: 20,
                width: 20,
                fit: BoxFit.cover,
                color: Colors.white,
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartItemsScreen())),
                child: Image.asset(
                  "assets/images/shopping_cart.png",
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover,
                  color: Colors.white,
                ),
              ),
              Image.asset(
                "assets/images/man.png",
                height: 20,
                width: 20,
                fit: BoxFit.cover,
                color: Colors.white,
              ),
            ],
          ),
        ),
      );

  flowerName(Size size) => Container(
        margin: const EdgeInsets.only(top: 60, left: 10),
        child: Transform.rotate(
          angle: 300,
          child: textViewVertical("Basket", Colors.grey),
        ),
      );

  textViewVertical(String s, var color) => AnimatedDefaultTextStyle(
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOutBack,
        style: GoogleFonts.lato(fontStyle: FontStyle.normal, color: color),
        child: Text(
          s,
        ),
      );

  listFlower(Size size) => SizedBox(
        width: size.width * 0.85,
        height: 300,
        child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return flowerCardView(index, size);
            }),
      );

  flowerCardView(int index, Size size) => Card(
        elevation: 2.0,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 200,
          color: Colors.white,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FlowerViewScreen(
                          index: index,
                          photo: selectedItemListProvider(
                              selectedListType, index))));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 10, top: 10),
                  child: Text("From",
                      style: GoogleFonts.lato(
                          fontStyle: FontStyle.normal, color: Colors.grey)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topRight,
                      margin:
                          const EdgeInsets.only(top: 0, bottom: 0, right: 2),
                      child: Text("\$",
                          style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              color: Colors.grey,
                              fontSize: 12)),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      margin:
                          const EdgeInsets.only(top: 0, right: 10, bottom: 2),
                      child: Text(
                          "${HomePageViewModel().flowerList[index].price}",
                          style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              color: const Color(0xffF2A510),
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Hero(
                    tag: "flower $index",
                    child: Image.asset(
                      selectedItemListProvider(selectedListType, index)!,
                      fit: BoxFit.fitHeight,
                      height: 140,
                      width: 180,
                    )),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 20, left: 12, bottom: 0),
                  child: Hero(
                    tag: "Bouquet OF $index",
                    child: Text(
                        "Bouquet of ${HomePageViewModel().flowerList[index].name}",
                        style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      //  width: 144,
                      alignment: Alignment.topLeft,
                      margin:
                          const EdgeInsets.only(top: 2, bottom: 28, left: 12),
                      child: Hero(
                        tag: "Magical Pastel $index",
                        child: Text("Magical Pastel",
                            style: GoogleFonts.lato(
                                fontStyle: FontStyle.normal,
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 0, right: 10),
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff76A73B),
                      ),
                      child: Center(
                        child: Hero(
                            tag: "shopping_cart $index",
                            child: Image.asset(
                              "assets/images/shop_bag.png",
                              color: Colors.white,
                              fit: BoxFit.cover,
                              height: 24,
                              width: 24,
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  popularFlowers(Size size) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          popularFlowersText(size),
          popularFlowerNameList(size),
        ],
      );

  popularFlowersText(size) => Container(
        //  duration: Duration(milliseconds: 1200),

        width: size.width * 0.9,
        margin: const EdgeInsets.only(top: 0, left: 20, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Popular Flowers",
                style: GoogleFonts.lato(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Container(
              height: 35,
              width: 100,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: const Color(0xffF6ECDE),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text("See All",
                    style: GoogleFonts.lato(
                        fontStyle: FontStyle.normal,
                        color: const Color(0xffF2A510),
                        fontWeight: FontWeight.bold,
                        fontSize: 13)),
              ),
            ),
          ],
        ),
      );

  popularFlowerNameList(Size size) => AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOutBack,
      margin:
          EdgeInsets.only(top: 10, left: popularFlowerNameListLeftAnimation),
      height: 100,
      width: size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          popularFlowerHorizontalListITem("assets/images/birthday.png"),
          popularFlowerHorizontalListITem("assets/images/graduation.png"),
          popularFlowerHorizontalListITem("assets/images/birthday.png"),
          popularFlowerHorizontalListITem("assets/images/graduation.png"),
          popularFlowerHorizontalListITem("assets/images/birthday.png"),
        ],
      ));

  void animateProperties() {
    Timer(const Duration(microseconds: 0), () {
      setState(() {
        animatedPopularFlowerNameListHorizontal = 5.0;
        listFlowerLeftAnimation = 55;
        popularFlowerNameListLeftAnimation = 0.0;
        flowerNameTopAnimated = 330;
        flowerNameTopAnimated_2 = 260;
        flowerNameTopAnimated_3 = 190;
        flowerNameTopAnimated_4 = 120;
        animationTopAppNAme = 17.0;
        animationTopAppNameWidth = 180;
        animationTopAppNameHeight = 45.0;
        animatedTopBarActionsButtonsRight = 25.0;
        animationBottomNavigationBarHeight = 47.0;
        animationTopAppNAmeBouquet = 55.0;
        animatedAppNameBouquetTop = 57.0;
        animatedPopularFlowerTextHeight = 15.0;
        animatedLeafRight = 52.0;
        animationTopLeaf = 8.0;
        animatedSelectedBarTop =
            animatedSelectedBarPositionProvider(selectedListType)!;
        // bool _isPaused = true;
        // animatedSelectedBarTop = 160;
      });
    });
  }

  weddingText(Size size) => Container(
        margin: const EdgeInsets.only(top: 60),
        child: Transform.rotate(
          angle: 300,
          child: textViewVertical("Wedding", Colors.grey),
        ),
      );

  roseText(Size size) => Container(
        margin: const EdgeInsets.only(top: 60, left: 14),
        child: Transform.rotate(
          angle: 300,
          child: textViewVertical("Rose", Colors.grey),
        ),
      );

  bouquetText(Size size) => Container(
        margin: const EdgeInsets.only(top: 60, left: 3),
        child: Transform.rotate(
          angle: 300,
          child: textViewVertical("Bouquet", Colors.white),
        ),
      );

  popularFlowerHorizontalListITem(String s) => AnimatedContainer(
        duration: const Duration(milliseconds: 1400),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.only(left: 10, bottom: 5),
        margin: EdgeInsets.only(right: animatedPopularFlowerNameListHorizontal),
        //  height: 0,
        width: 140,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              s,
              fit: BoxFit.fitWidth,
              height: 95,
            )),
      );

  void animateListCartProperties(size, value) {
    Timer(const Duration(microseconds: 0), () {
      setState(() {
        // listOfFlowerCardDuration = const Duration(milliseconds: 600);
        listFlowerLeftAnimation = size.width;
        scrollController!.jumpTo(1);
        animatePropertiesOrNot = false;
        selectedListType = value;
      });
    });
    Timer(const Duration(milliseconds: 800), () {
      setState(() {
        animatePropertiesOrNot = true;
      });
    });
  }

  tabBaRSelected() => Container(
        height: 50,
        width: 5,
        decoration: BoxDecoration(
          color: const Color(0xffF2A510),
          borderRadius: BorderRadius.circular(20.0),
        ),
      );

  double? animatedSelectedBarPositionProvider(String selectedListType) {
    var value = selectedListType;
    switch (value) {
      case "Basket":
        return 373;
      case "Wedding":
        return 305;
      case "Rose":
        return 235;
      case "Bouquet":
        return 160;
      default:
        return null;
    }
  }

  String? selectedItemListProvider(selectedListType, index) {
    var value = selectedListType;
    switch (value) {
      case "Basket":
        return HomePageViewModel().flowerList[index].photoUrl;
      case "Wedding":
        return HomePageViewModel().weddingList[index].photoUrl;
      case "Rose":
        return HomePageViewModel().roseList[index].photoUrl;
      case "Bouquet":
        return HomePageViewModel().bouquetList[index].photoUrl;
      default:
        return null;
    }
  }

  @override
  void initialize(FlutterActorArtboard artBoard) {
    rock = artBoard.getAnimation("success");
  }

  @override
  bool advance(FlutterActorArtboard artBoard, double elapsed) {
    rockTime += elapsed * speed;
    rock!.apply(rockTime % rock!.duration, artBoard, rockAmount);
    return true;
  }

  @override
  void setViewTransform(Mat2D viewTransform) {
    // TODO: implement setViewTransform
  }
}

class TopBackgroundImageClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstControlPoint = Offset(55, size.height / 1.4);
    var firstEndPoint = Offset(size.width / 1.7, size.height / 1.3);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width - (35), size.height - 95);
    var secondEndPoint = Offset(size.width, size.height / 2.4);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
