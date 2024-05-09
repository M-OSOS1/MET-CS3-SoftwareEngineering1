import 'package:flutter/material.dart';
import 'package:untitled1/core/widgets/bottomNaviBar.dart';
import 'package:untitled1/core/widgets/catogry.dart';
import 'package:untitled1/core/widgets/size.dart';
import 'package:untitled1/pages/profile_screen/profile_screen.dart';
import 'package:untitled1/pages/services/ac_services.dart';
import 'package:untitled1/pages/services/carpenter.dart';
import 'package:untitled1/pages/services/cleaning.dart';
import 'package:untitled1/pages/services/control.dart';
import 'package:untitled1/pages/services/contruction.dart';
import 'package:untitled1/pages/services/electrician.dart';
import 'package:untitled1/pages/services/interior_design.dart';
import 'package:untitled1/pages/services/painter.dart';
import 'package:untitled1/pages/services/plumber.dart';
import 'package:untitled1/pages/services/smith.dart';
import 'package:untitled1/pages/services/truck.dart';
import 'package:untitled1/store.dart';

void main() {
  runApp(const Four());
}

class Four extends StatefulWidget {
  static const String routeName = "service";
  const Four({super.key});

  @override
  State<Four> createState() => _FourState();
}

class _FourState extends State<Four> {
  int selectedindex = 0;

  final List<Widget> _page = [
    const Carpenter(),
    const Plumber(),
    const Ac_services(),
    const Electrician(),
    const Control(),
    const Contruction(),
    const Interior(),
    const Truck(),
    const Cleaning(),
    const Painter(),
    const Smith(),
  ];
  final List<Widget> _pages = [
    const Four(),
     ShoppingApp(),
    const ProfileView(),
  ];
  void _onTabTapped(int index) {
    setState(() {
      selectedindex = index;
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => _pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffaf0edea),
        appBar: AppBar(
          toolbarHeight: 70,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(35),
            ),
          ),
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "images/human.png",
                  width: 42,
                  height: 42,
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(padding: EdgeInsets.only(right: 8.0)),
              const Text(
                "Hi",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0),
              ),
            ],
          ),
          backgroundColor: const Color(0xffE95E52),
          actions: const [
            Icon(
              Icons.notifications_active_outlined,
              color: Colors.white,
            ),
            Padding(padding: EdgeInsets.only(right: 4, left: 4)),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            Padding(padding: EdgeInsets.only(right: 4, left: 4)),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(90.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 9, left: 9),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey.shade300),
                  filled: true, // Enable box fill
                  fillColor: Colors.white, // Set the background color
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 8.0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade300,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: PageView(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    const Row(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                        Text(
                          "Our Services",
                          style: TextStyle(
                              color: Color(0xff0B3164),
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: categoryList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.9),
                          itemBuilder: (context, index) {
                            // Pass the appropriate destination page for each card
                            return Catogrycard(
                              destinationPage: _page[index],
                              category: categoryList[index],
                            );
                          }),
                    ),
                  ],
                ),
              ],
            ),
            _pages[selectedindex],
          ],
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: selectedindex,
          onTap: _onTabTapped,
        ),
      ),
    );
  }
}
