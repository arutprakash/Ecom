import 'package:ecomf/helpers/style.dart';
import 'package:ecomf/models/order.dart';
import 'package:ecomf/provider/app.dart';
import 'package:ecomf/provider/user.dart';
import 'package:ecomf/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(text: "Orders"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: white,
      body: ListView.builder(
          itemCount: userProvider.orders.length,
          itemBuilder: (_, index){
            OrderModel _order = userProvider.orders[index];
            return ListTile(
              leading: CustomText(
                text: "\$${_order.total / 100}",
                weight: FontWeight.bold,
              ),
              title: Text(_order.description),
              subtitle: Text(DateTime.fromMillisecondsSinceEpoch(_order.createdAt).toString()),
              trailing: CustomText(text: _order.status, color: green,),
            );
          }),
    );
  }
}