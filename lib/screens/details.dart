import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/cart_provider.dart';

import 'CartPage.dart';
import 'Homepage.dart';

class Itemdetails extends StatefulWidget {
  final Map<String, dynamic> data;
  const Itemdetails({super.key, required this.data});

  @override
  State<Itemdetails> createState() => _ItemdetailsState();
}

class _ItemdetailsState extends State<Itemdetails> {
  String? selectedColor; // Track selected color

  Color getColorFromName(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'black': return Colors.black;
      case 'white': return Colors.white;
      case 'red': return Colors.red;
      case 'grey': return Colors.grey;
      case 'blue': return Colors.blue;
      case 'green': return Colors.green;
      case 'yellow': return Colors.yellow;
      case 'ecru': return Colors.cyan;
      case 'pink': return Colors.pink;
      default: return Colors.transparent; // Default if color not found
    }
  }

  @override
  void initState() {
    super.initState();
    // Set default selected color (first available color)
    if (widget.data.containsKey('color') &&
        widget.data['color'] is List &&
        widget.data['color'].isNotEmpty) {
      selectedColor = widget.data['color'][0]; // First color in list
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedItemColor: Colors.orange,
        onTap: (index) {
      if (index == 1) {
        Navigator.of(context).pushNamed("cart");
      }
      else if(index ==0){
        Navigator.of(context).pushReplacementNamed("home");

          }

        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "*"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "*"),

        ],
      ),

      endDrawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(right: 3),
              child: Image.asset("assets/images/ecommerce1.jpg", fit: BoxFit.cover),
            ),
            Text("commerce ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Store", style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: PageView.builder(
              itemCount: widget.data['image']?.length ?? 0,
              itemBuilder: (context, i) {
                return Image.asset(widget.data['image'][i], fit: BoxFit.fill);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(widget.data['title'],
                textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(widget.data['description'],
                textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey)),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 25),
            child: Text(widget.data['price'],
                textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green)),
          ),

          // Display Colors Only If Available
          if (widget.data.containsKey('color') &&
              widget.data['color'] is List &&
              widget.data['color'].isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Color:", style: TextStyle(fontSize: 18)),
                SizedBox(width: 10),
                for (var color in widget.data['color'])
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: getColorFromName(color),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: selectedColor == color ? Colors.orange : Colors.black,
                              width: selectedColor == color ? 2 : 1, // Highlight selected
                            ),
                          ),
                        ),
                        Text(color, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
              ],
            ),

          // Display Sizes Only If Available
          if (widget.data['size'] == "yes")
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 60),
              child: Text(
                "Size :  34  35  36 40",
                style: TextStyle(color: Colors.brown, fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: MaterialButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addToCart({
                  "title": widget.data['title'],
                  "price": widget.data['price'],
                  "image": widget.data['image'][0], // Use first image
                  "color": selectedColor ?? "Unknown", // Use selected color
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${widget.data['title']} added to cart!")),
                );
              },
              child: Text("Add To Cart", style: TextStyle(color: Colors.white, fontSize: 20)),
              color: Colors.black,
              height: 50,
              padding: EdgeInsets.all(20),
            ),
          ),
        ],
      ),
    );
  }
}
