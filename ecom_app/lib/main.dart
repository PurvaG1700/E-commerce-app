import 'package:ecom_app/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import 'screens/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopers Stop',
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      // home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => ProductsOverviewScreen(),
        ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
      },
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopers Stop'),
//       ),
//       body: Center(child: Text('Welcome'),),
//     );
//   }
// }
