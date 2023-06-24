import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../model/cartModel.dart';
const String cartKey="cartItems";
const String wishKey="wishItem";
class CartHelper {
  Future addToCart(CartModel cart , String key) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await getCartItems(key);
    for (var i = 0; i < list.length; i++) {
      var element = list[i];
      if (element.name == cart.name) {
        final newQty = (element.qty ?? 0) + (cart.qty ?? 0);
        if (newQty == 0) {
          list.remove(element);
          prefs.remove(key);
          prefs.setString(
              key, jsonEncode(list.map((e) => e.toJson()).toList()));
          return;
        }
        list[i].qty = newQty;
        prefs.remove(key);
        prefs.setString(
            key, jsonEncode(list.map((e) => e.toJson()).toList()));
        return;
      }
    }
    list.add(cart);
    prefs.setString(key, jsonEncode(list));
  }

  Future<List<CartModel>> getCartItems(String key2) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(key2);
    if (data == null) return [];
    final list = jsonDecode(data);
    return (list as List).map((e) => CartModel.fromJson(e)).toList();
  }
}
