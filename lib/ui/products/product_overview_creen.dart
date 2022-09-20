import 'package:flutter/material.dart';
import 'package:myshopp/ui/cart/cart_screen.dart';
import 'package:myshopp/ui/products/products_grid.dart';

import 'product_grid_tile.dart';
import '../shared/app_drawer.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewSreen extends StatefulWidget {
  const ProductsOverviewSreen({super.key});

  @override
  State<ProductsOverviewSreen> createState() => _ProductsOverviewSreenState();
}

class _ProductsOverviewSreenState extends State<ProductsOverviewSreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Myshop'),
        actions: <Widget>[
          buildProductFilterMenu(),
          buildShoppingCartIcon(),
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }

  Widget buildShoppingCartIcon() {
    return IconButton(
      icon: const Icon(
        Icons.shopping_cart,
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(CartScreen.routeName);
        // print('Go to cart screen');
      },
    );
  }

  Widget buildProductFilterMenu() {
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue) {
        setState(() {
          if (selectedValue == FilterOptions.favorites) {
            _showOnlyFavorites = true;
          } else {
            _showOnlyFavorites = false;
          }
        });
      },
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text('Show All'),
        ),
      ],
    );
  }
}
