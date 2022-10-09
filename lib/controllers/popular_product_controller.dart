import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/data/repository/popular_product_repo.dart';
import 'package:delivery_app/models/cart_model.dart';
import 'package:delivery_app/models/products_model.dart';
import 'package:delivery_app/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  late PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;

  late CartController _cart;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      update();
      _isLoaded = true;
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      if ((_inCartItems + _quantity) >= 20) {
        Get.snackbar("Item limit", "You can't add more",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      } else {
        _quantity = _quantity + 1;
      }
    } else {
      if ((_inCartItems + _quantity) > 0) {
        _quantity = _quantity - 1;
      } else {
        Get.snackbar("Item limit", "You can't reduce more",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
    update();
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    bool exist = cart.existInCart(product);

    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }

    print("Exist ? ${exist}");
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {});

    _cart.items.forEach((key, value) {
      print("quantity ${value.quantity} of id ${value.id}");
    });

    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
