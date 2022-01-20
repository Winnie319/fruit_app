import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruits_application/home_page.dart';

import 'main.dart';

class addfruit extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('fruits');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                'title': title.text,
                'content': description.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              });
            },
            child:const Text(
              "add",
            ),
          ),
        ],
      ),
      body:Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                decoration:const InputDecoration(
                  hintText: 'title',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: description,
                  expands: true,
                  maxLines: null,
                  decoration:const InputDecoration(
                    hintText: 'description',
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}