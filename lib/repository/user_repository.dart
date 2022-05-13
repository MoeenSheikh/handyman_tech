import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:handyman_tech/models/order_model.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:handyman_tech/models/user_model.dart';
class DataBase{
  FirebaseFirestore db=FirebaseFirestore.instance;
  final String phoneNumber;
  DataBase({this.phoneNumber});
  Future<void> addUsers(UserModel user) async
  {
    try{
      Map<String, dynamic> userData = user.toJson();
      await db.collection("login").doc(user.phoneNumber).set(userData);
    }catch(e){
      print(e);
    }
  }
  Future<Stream> getServices()async
  {
    return db.collection("Services").snapshots();
  }
  Future<Stream> getUsers()async
  {
    return db.collection("login").snapshots();
  }
  Future<void> updateUser(UserModel user)async{
    try{

      await db.collection("login").doc(user.phoneNumber).update(
          {
            'firstname': user.firstName,
            'lastname':user.lastName,
            'phonenumber': user.phoneNumber,
            'gender':user.gender,
            'email':user.email,
          }
      );
    }catch(e){
      print(e);
    }
  }
  // Future<void> placeOrder(OrderModel order)async{
  //   try{
  //     await db.collection("login").doc(phoneNumber).collection('Order').add(
  //         {
  //           "serviceName":order.serviceName,
  //           "unitPrice":order.unitPrice,
  //           "totalPrice":order.totalPrice,
  //           "date":order.date,
  //           "time":order.time,
  //           "message":order.message
  //         }
  //     );
  //   }catch(e){
  //     print(e);
  //   }
  //
  // }
  Future<void> deleteUser(String phoneNumber)async
  {
    try{
      await db.collection("login").doc(phoneNumber).delete();
    }catch(e){
      print(e);
    }
  }
  Future<void> signOut()async
  {
    try{
      await FirebaseAuth.instance.signOut();
    }catch(e){
      print(e);
    }

  }
  Future<String> docId(int i)async
  {
    QuerySnapshot querySnapshot= await db.collection("Services").get();
    if(querySnapshot.docs.isNotEmpty){
      List list=querySnapshot.docs.toList();
      return list[i].id;
    }
    return "0";
  }
  Future<Stream> getSubService(int i)async
  {
    String id=await docId(i);
    return db.collection("Services").doc(id).collection("SubServices").snapshots();
  }
  Future<String> getSubdocId(int mainid,int subid)async
  {
    String id=await docId(mainid);
    QuerySnapshot querySnapshot= await db.collection("Services").doc(id).collection("SubServices").get();
    if(querySnapshot.docs.isNotEmpty){
      List list=querySnapshot.docs.toList();
      print(list[subid].id);
      return list[subid].id;
    }
    return "0";
  }
}