import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/home_screen/four.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String name = 'omer ahmed';
  String phone = '03107085816';
  String address = 'abc address, xyz city';
  String email = 'omer@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(35),
          ),
        ),
        backgroundColor: const Color(0xffae95e52),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Four()),
              );
            },
            icon: const Icon(Icons.arrow_back_sharp),
            color: Colors.white),
      ),
      backgroundColor: const Color(0xffaf0edea),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 40),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('images/human.png'),
                ),
                const SizedBox(height: 20),
                itemProfile('Name', name, CupertinoIcons.person, () {
                  _editProfile('Name');
                }),
                const SizedBox(height: 10),
                itemProfile('Phone', phone, CupertinoIcons.phone, () {
                  _editProfile('Phone');
                }),
                const SizedBox(height: 10),
                itemProfile('Address', address, CupertinoIcons.location, () {
                  _editProfile('Address');
                }),
                const SizedBox(height: 10),
                itemProfile('Email', email, CupertinoIcons.mail, () {
                  _editProfile('Email');
                }),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  itemProfile(
      String title, String subtitle, IconData iconData, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 5),
                  color: Colors.deepOrange.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 10),
            ]),
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          leading: Icon(iconData),
          trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
          tileColor: Colors.white,
        ),
      ),
    );
  }

  void _editProfile(String field) async {
    String? newValue = await showDialog(
      context: context,
      builder: (context) => EditProfileDialog(field: field),
    );
    if (newValue != null) {
      setState(() {
        switch (field) {
          case 'Name':
            name = newValue;
            break;
          case 'Phone':
            phone = newValue;
            break;
          case 'Address':
            address = newValue;
            break;
          case 'Email':
            email = newValue;
            break;
        }
      });
    }
  }
}

class EditProfileDialog extends StatefulWidget {
  final String field;

  const EditProfileDialog({Key? key, required this.field}) : super(key: key);

  @override
  _EditProfileDialogState createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit ${widget.field}'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Enter new ${widget.field}'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Color(0xffe95e52)),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, _controller.text);
          },
          child: Text(
            'Save',
            style: TextStyle(color: Color(0xffe95e52)),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
