import 'package:flutter/material.dart';

import 'user_product_list_tile.dart';
import 'products_manager.dart';

class UserProductsSreen extends StatelessWidget {
  const UserProductsSreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsManager = ProductsManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          buildAddButton(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => print('refresh products'),
        child: buildUserProductListView(productsManager),
      ),
    );
  }
}

Widget buildUserProductListView(ProductsManager productsManager) {
  return ListView.builder(
    itemCount: productsManager.itemsCount,
    itemBuilder: (ctx, i) => Column(
      children: [
        UserProductListTile(
          productsManager.items[i],
        ),
        const Divider(),
      ],
    ),
  );
}

Widget buildAddButton() {
  return IconButton(
    icon: const Icon(Icons.add),
    onPressed: () {
      print('Go to edit product screen');
    },
  );
}