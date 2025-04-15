import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/restaurant.dart';

class RestaurantsData extends ChangeNotifier {
  List<Restaurant> listRestaurant = [];

  Future<void> getRestaurants() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    List<dynamic> restaurantsJson = jsonMap['restaurants'];

    for (var restaurantData in restaurantsJson) {
      listRestaurant.add(Restaurant.fromMap(restaurantData));
    }
  }
}
