import 'package:flutter/material.dart';
import 'package:untitled1/core/widgets/size.dart';



class Catogrycard extends StatelessWidget {
  final Category category;
    final Widget destinationPage;
  const Catogrycard({super.key, required this.category, required this.destinationPage,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Container(
        width: 110,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4.0,
                spreadRadius: 0.05,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                category.pic,
                height: imagesize,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                category.name,
                style: const TextStyle(
                    color: Color(0xff0B3164),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
