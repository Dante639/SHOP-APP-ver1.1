import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/Cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productID;
  final double price;
  final int quantity;
  final String title;

  CartItem(
    this.id,
    this.productID,
    this.price,
    this.quantity,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete_forever_outlined,
          color: Colors.black87,
          size: 40.5,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 21),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context,listen: false,).removeItem(productID);
      },
      child: Card(
        color: Colors.black87,
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              maxRadius: 47,
              minRadius: 27,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: FittedBox(
                  child: Text(
                    '\$$price',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.2,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                fontSize: 23.2,
                fontFamily: 'Lato',
              ),
            ),
            subtitle: Text(
              'Total \$${(price * quantity)}',
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                fontSize: 23.2,
                fontFamily: 'Lato',
              ),
            ),
            trailing: Text(
              '$quantity X',
              style: TextStyle(
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                fontSize: 23.2,
                fontFamily: 'Lato',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
