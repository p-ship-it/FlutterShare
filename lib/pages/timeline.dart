import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:cloud_firestore/cloud_firestore';

final Collection usersRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {

  @override
  void initState() { 
    getUsers(); 
    // getUsersById();
    super.initState();
  } 

 getUsers() async {
   final QuerySnapshot snapshot =
    await usersRef.where("postsCount", isGreaterThan: 2)
    .getDocuments();
    snapshot.documents.forEach((DocumentSnapshot doc) {
         print(doc.data);
      });

 }

  // getUsers() {
  //   usersRef.getDocuments().then((QuerySnapshot snapshot) {
  //     snapshot.documents.forEach((DocumentSnapshot doc) {
  //       print(doc.data);
  //     });
  //   });
  // }

  // getUserById() async {
  //   final String id - "DcDSTLTevDvFVwxZotJV";
  //   final DocumentSnapshot doc = await usersRef.document(id).get();
  //    print(doc.data);
  //   });
  // }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: Text("Timeline"),
    );
  }
}
