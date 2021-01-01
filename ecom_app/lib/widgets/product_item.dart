import '../screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(
      {@required this.id, @required this.imageUrl, @required this.title});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ProductDetailsScreen.routeName, arguments: id);
            },
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
                color: Theme.of(context).accentColor),
          )),
    );
  }
}
