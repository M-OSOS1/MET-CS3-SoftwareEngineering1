import 'package:flutter/material.dart';
import 'package:untitled1/core/widgets/bottomNaviBar.dart';
import 'package:untitled1/pages/book_screen/booking.dart';
import 'package:untitled1/pages/book_screen/comment.dart';
import 'package:untitled1/pages/home_screen/four.dart';
import 'package:untitled1/pages/profile_screen/profile_screen.dart';
import 'package:untitled1/store.dart';

void main() {
  runApp(Truck());
}

class Truck extends StatefulWidget {
  const Truck({super.key});

  @override
  State<Truck> createState() => _TruckState();
}

class _TruckState extends State<Truck> {
  int selectedindex = 0;
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

  List<Widget> cards = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffaf0edea),
        appBar: AppBar(
          toolbarHeight: 70,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(35),
            ),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Four()),
              );
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
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
              Text(
                "Hi",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0),
              ),
            ],
          ),
          backgroundColor: Color(0xffE95E52),
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
            preferredSize: Size.fromHeight(90.0),
            child: Padding(
              padding: EdgeInsets.only(bottom: 20, right: 9, left: 9),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey.shade300),
                  filled: true, // Enable box fill
                  fillColor: Colors.white, // Set the background color
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
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
                Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Truck",
                      style: TextStyle(
                          color: Color(0xff0B3164),
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    )),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestMe()),
                      ),
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image.asset("images/human.png"),
                        title: Text("Ahmed Omar"),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text("4.9 on 100 task like this"),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AppointmentBookingPage()),
                            ),
                          },
                          child: Container(
                            width: 90,
                            height: 30,
                            child: Center(
                                child: const Text(
                              "Book Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xffE95E52)),
                          ),
                        ),
                      ),
                    ),
                  
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestMe()),
                      ),
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image.asset("images/human1.png"),
                        title: Text("gamal ali"),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text("3.9 on 100 task like this"),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AppointmentBookingPage()),
                            ),
                          },
                          child: Container(
                            width: 90,
                            height: 30,
                            child: Center(
                                child: const Text(
                              "Book Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xffE95E52)),
                          ),
                        ),
                      ),
                    ),
                
                  ),
                ),
              Padding(padding: EdgeInsets.only(bottom: 8)),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestMe()),
                      ),
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image.asset("images/human2.png"),
                        title: Text("assem ahmed"),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text("3.5 on 100 task like this"),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AppointmentBookingPage()),
                            ),
                          },
                          child: Container(
                            width: 90,
                            height: 30,
                            child: Center(
                                child: const Text(
                              "Book Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xffE95E52)),
                          ),
                        ),
                      ),
                    ),
                  
                  ),
                ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
               Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestMe()),
                      ),
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image.asset("images/human3.png"),
                        title: Text("marwan magdy"),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text("3.0 on 100 task like this"),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AppointmentBookingPage()),
                            ),
                          },
                          child: Container(
                            width: 90,
                            height: 30,
                            child: Center(
                                child: const Text(
                              "Book Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xffE95E52)),
                          ),
                        ),
                      ),
                    ),
                  
                  ),
                ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
               Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestMe()),
                      ),
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image.asset("images/human4.png"),
                        title: Text("ahmed taha"),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text("2.5 on 100 task like this"),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AppointmentBookingPage()),
                            ),
                          },
                          child: Container(
                            width: 90,
                            height: 30,
                            child: Center(
                                child: const Text(
                              "Book Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xffE95E52)),
                          ),
                        ),
                      ),
                    ),
                  
                  ),
                ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestMe()),
                      ),
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image.asset("images/human.png"),
                        title: Text("ziad fady"),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text("2.5 on 100 task like this"),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AppointmentBookingPage()),
                            ),
                          },
                          child: Container(
                            width: 90,
                            height: 30,
                            child: Center(
                                child: const Text(
                              "Book Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xffE95E52)),
                          ),
                        ),
                      ),
                    ),
                  
                  ),
                ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
               Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestMe()),
                      ),
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image.asset("images/human2.png"),
                        title: Text("ashraf taha"),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text("2.5 on 100 task like this"),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AppointmentBookingPage()),
                            ),
                          },
                          child: Container(
                            width: 90,
                            height: 30,
                            child: Center(
                                child: const Text(
                              "Book Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xffE95E52)),
                          ),
                        ),
                      ),
                    ),
                  
                  ),
                ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
               Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestMe()),
                      ),
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image.asset("images/human1.png"),
                        title: Text("osama amer"),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text("2.5 on 100 task like this"),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AppointmentBookingPage()),
                            ),
                          },
                          child: Container(
                            width: 90,
                            height: 30,
                            child: Center(
                                child: const Text(
                              "Book Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xffE95E52)),
                          ),
                        ),
                      ),
                    ),
                  
                  ),
                ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
               Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestMe()),
                      ),
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image.asset("images/human3.png"),
                        title: Text("amr sokar"),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text("2.5 on 100 task like this"),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AppointmentBookingPage()),
                            ),
                          },
                          child: Container(
                            width: 90,
                            height: 30,
                            child: Center(
                                child: const Text(
                              "Book Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xffE95E52)),
                          ),
                        ),
                      ),
                    ),
                  
                  ),
                ),
              Padding(padding: EdgeInsets.only(bottom: 8)),



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
