import 'package:flutter/material.dart';

import 'ui/products/product_overview_creen.dart';
import 'ui/products/user_products_screen.dart';

import 'ui/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsManager(),
        ),
      ],
      child: MaterialApp(
        title: 'My Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
        ),
        home: const ProductsOverviewSreen(),
        routes: {
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          UserProductsSreen.routeName: (ctx) => const UserProductsSreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == ProductDetailScreen.routeName) {
            final productId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (ctx) {
                return ProductDetailScreen(
                  ProductsManager().findById(productId),
                );
              },
            );
          }
          return null;
        },
      ),
    );
  }
}
//   l2_b2 home: const SafeArea(child: OrdersScreen()),
//   l2_b1
//    home: const SafeArea(child: CartScreen()
//   ),
//   b4 home: const SafeArea(child: UserProductsSreen(),
//   ),
//   b3 home: const SafeArea(
//     child: ProductsOverviewSreen(),
//     ),
//   b1_2 home: SafeArea(
//     //b1 color: Colors.green,
//     child: ProductDetailScreen(
//       ProductsManager().items[0],
//     ),
//   ),
// );

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
