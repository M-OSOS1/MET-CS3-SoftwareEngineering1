import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/home_screen/four.dart';

class TestMe extends StatefulWidget {
  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'ahmed ali',
      'pic': 'images/human.png',
      'message': 'Working with you has been an absolute pleasure.',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'osama amer',
      'pic': 'images/Ellipse.png',
      'message': 'His consistently deliver high-quality work.',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'kamal ahmed',
      'pic': 'images/human.png',
      'message': 'Very good job',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'ziad hany',
      'pic': 'images/Ellipse.png',
      'message': 'He provided exceptional service.',
      'date': '2021-01-01 12:00:00'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(35),
            ),
          ),
          leading: InkWell(
            onTap: () { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Four()),
              );},
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child:Image.asset(
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
      body: Container(
        child: CommentBox(
          userImage: CommentBox.commentImageParser(
              imageURLorPath: "assets/images/profile_pic.png"),
          child: commentChild(filedata),
          labelText: 'Write a comment...',
          errorText: 'Comment cannot be blank',
          withBorder: false,
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'omer',
                  'pic':
                      'images/human.png',
                  'message': commentController.text,
                  'date': '2021-01-01 12:00:00'
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Color(0XFFE95E52),
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}