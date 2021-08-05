import 'dart:async';
import 'package:ecomf/models/cart_item.dart';
import 'package:ecomf/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserServices{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "users";

  createUser(Map<String, dynamic> data) async{
    try{
      await _firestore.collection(collection).doc(data["uid"]).set(data);
      print("USER WAS CREATED");
    }catch(e){
      print('ERROR: ${e.toString()}');
    }
  }

  Future<UserModel> getUserById(String id)=> _firestore.collection(collection).doc(id).get().then((doc){
    print("==========id is $id=============");
    Map data= doc.data();
    debugPrint("==========NAME is ${data["name"]}=============");
    debugPrint("==========NAME is ${data['name']}=============");
    debugPrint("==========NAME is ${data['name']}=============");
    debugPrint("==========NAME is ${data['name']}=============");

    print("==========NAME is ${data['name']}=============");
    print("==========NAME is ${data['name']}=============");
    print("==========NAME is ${data['name']}=============");


    return UserModel.fromSnapshot(doc);
  });

  void addToCart({String userId, CartItemModel cartItem}){
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({String userId, CartItemModel cartItem}){
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }
}
