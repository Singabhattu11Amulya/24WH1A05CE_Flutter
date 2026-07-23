import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuPage(),
    ),
  );
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant Menu"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LEFT COLUMN
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Row(
                  children: [
                    Icon(Icons.fastfood),
                    SizedBox(width: 8),
                    Text("Starters", style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 20),

                Row(
                  children: [
                    Icon(Icons.restaurant),
                    SizedBox(width: 8),
                    Text("Meals", style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 20),

                Row(
                  children: [
                    Icon(Icons.eco),
                    SizedBox(width: 8),
                    Text("Salads", style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 20),

                Row(
                  children: [
                    Icon(Icons.icecream),
                    SizedBox(width: 8),
                    Text("Desserts", style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 20),

                Row(
                  children: [
                    Icon(Icons.local_drink),
                    SizedBox(width: 8),
                    Text("Drinks", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),

            const SizedBox(width: 60),

            // RIGHT ROW
            Row(
              children: [
                // Dish 1
                Column(
                  children: [
                    Image.network(
                      "https://picsum.photos/120",
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(height: 8),
                    const Text("Paneer Tikka"),
                  ],
                ),

                const SizedBox(width: 30),

                // Dish 2
                Column(
                  children: [
                    Image.network(
                      "https://picsum.photos/121",
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(height: 8),
                    const Text("Veg Biryani"),
                  ],
                ),

                const SizedBox(width: 30),

                // Dish 3
                Column(
                  children: [
                    Image.network(
                      "https://picsum.photos/122",
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(height: 8),
                    const Text("Green Salad"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}