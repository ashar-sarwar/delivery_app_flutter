import 'dart:convert';

import 'package:delivery_app/data/api/api_client.dart';
import 'package:delivery_app/models/cart_model.dart';
import 'package:delivery_app/utils/AppConstants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo extends GetxService {
  final SharedPreferences
      sharedPreferences; //shared preferences only takes strings, so we need to convert cartList to string
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];
    cartList.forEach((element) {
      // converts json to string
      return cart.add(jsonEncode(element));
    });
    sharedPreferences.setStringList("cart-list", cart);
  }
}
