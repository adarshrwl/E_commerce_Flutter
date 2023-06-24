// Regular imports
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/components/Horizontal_list_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  List imageList = [
    {"id": 1, "image_path": 'assets/image1.jpg'},
    {"id": 2, "image_path": 'assets/image2.jpg'},
    {"id": 3, "image_path": 'assets/image3.jpg'},
    {"id": 4, "image_path": 'assets/image4.jpg'},
    {"id": 5, "image_path": 'assets/image5.jpg'},
    {"id": 6, "image_path": 'assets/image6.jpg'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentindex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        drawer: buildDrawer(),
        body: Column(
          children: [
            // in this stack there is the image croausal which changs the images based on the given values
            Stack(
              children: [
                InkWell(
                  child: CarouselSlider(
                    items: imageList
                        .map((item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ))
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentindex = index;
                          });
                        }),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: currentindex == entry.key ? 17 : 7,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentindex == entry.key
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Padding(
              //padding gives the space to the widgets
              padding: EdgeInsets.all(8.0),
              child: Text("Cateogories"),

              //Horizontal list view begins here
            ),
            Horizontal_list_view()
          ],
        ));
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Adarsh Rawal"),
            accountEmail: Text("adarshrawal321@gmail.com"),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.red,
      title: Text("Shop App"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          color: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}
