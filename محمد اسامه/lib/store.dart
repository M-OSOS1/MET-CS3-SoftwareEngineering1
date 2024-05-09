import 'package:flutter/material.dart';
import 'package:untitled1/pages/home_screen/four.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fixar Store',
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()
                ),
              );
            },
          ),
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
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.asset(
              products[index]['image'], // Assuming 'image' is the key for image path
              width: 80,
              height:80,
              fit: BoxFit.fill,
            ),
            title: Text(products[index]['name']),
            subtitle: Text('\EGP${products[index]['price']}'),
            onTap: () {
              Cart.instance.addToCart(products[index]);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Item added to cart')));
            },
          );
        },
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffaf0edea),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductListScreen()),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xffE95E52),
        title: Text(
          'Shopping Cart',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Cart.instance.cart.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading:Image.asset(
              products[index]['image'] ,),
                  title: Text(Cart.instance.cart[index]['name']),
                  subtitle: Text('\EGP${Cart.instance.cart[index]['price']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      Cart.instance.removeFromCart(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Item removed from cart')));
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total Price: \EGP${Cart.instance.totalPrice.toString()}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

 class Cart {
  static final Cart _instance = Cart._internal();

  factory Cart() {
    return _instance;
  }

  Cart._internal();

  static Cart get instance => _instance;

  List<Map<String, dynamic>> _cart = [];

  List<Map<String, dynamic>> get cart => _cart;

  void addToCart(Map<String, dynamic> product) {
    _cart.add(product);
  }

  void removeFromCart(int index) {
    _cart.removeAt(index);
  }

  num get totalPrice {
    num totalPrice = 0;
    for (var item in _cart) {
      totalPrice += item['price'];
    }
    return totalPrice;
  }
}

// Dummy Product Data with images
List<Map<String, dynamic>> products = [
  {
    'name': 'carpenter equipment',
    'price': 10,
    'image': 'images/carpenter equipment.jpg', // Image path for product 1
  },
  {
    'name': 'Multifunctional English Key Sink Faucet',
    'price': 20,
    'image': 'images/Multifunctional English Key Sink Faucet.jpg', // Image path for product 2
  },
  {
    'name': 'Stainless Steel Mini Electronic Electrician Repair Tools',
    'price': 30,
    'image': 'images/Stainless Steel Mini Electronic Electrician Repair Tools.jpg', // Image path for product 3
  },
  {
    'name': 'Smithing Punch Removing Repair Tools',
    'price': 40,
    'image': 'images/Smithing Punch Removing Repair Tools.jpg', // Image path for product 4
  },
  {
    'name': 'Ratchet Wrench Air Conditioner Ratcheting Service Wren',
    'price': 50,
    'image': 'images/Ratchet Wrench Air Conditioner Ratcheting Service Wren.jpg', // Image path for product 5
  },
  {
    'name': 'pneumatic chaamfering',
    'price': 60,
    'image': 'images/pneumatic chaamfering.jpg', // Image path for product 6
  },
   {
    'name': 'Electrician Bag 1680D Oxford Waterproof Wear',
    'price': 50,
    'image': 'images/Electrician Bag 1680D Oxford Waterproof Wear.jpg', // Image path for product 6
  },
   {
    'name': '6.8cm Black Steel Adjustable Wrench Spanner Construction 2.5In Black',
    'price': 20,
    'image': 'images/6.8cm Black Steel Adjustable Wrench Spanner Construction 2.5In Black.jpg', // Image path for product 6
  },
   {
    'name': 'GOCHANGE Wall Repair Tools 2 Sets Wall Paint',
    'price': 20,
    'image': 'images/GOCHANGE Wall Repair Tools 2 Sets Wall Paint.jpg', // Image path for product 6
  },
];
