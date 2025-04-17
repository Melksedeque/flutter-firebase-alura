import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/model/restaurant.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(restaurant.name)),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12.0,
          children: [
            Image.asset('assets/${restaurant.imagePath}', width: 128.0),
            Text(
              "Mais pedidos",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Column(
              children: List.generate(restaurant.dishes.length, (index) {
                Dish dish = restaurant.dishes[index];
                return ListTile(
                  leading: Image.asset(
                    'assets/dishes/default.png',
                    height: 48.0,
                    width: 48.0,
                  ),
                  title: Text(dish.name),
                  subtitle: Text("R\$${dish.price.toStringAsFixed(2)}"),
                  trailing: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
