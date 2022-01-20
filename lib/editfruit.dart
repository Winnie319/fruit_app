import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruits_application/home_page.dart';
import 'main.dart';


class editfruit extends StatefulWidget {
  DocumentSnapshot docid;
  editfruit({required this.docid});

  @override
  _editfruitState createState() => _editfruitState();
}

class _editfruitState extends State<editfruit> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void initState() {
    title = TextEditingController(text: widget.docid.get('title'));
    description = TextEditingController(text: widget.docid.get('description'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'title': title.text,
                'content': description.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              });
            },
            child:const Text("save"),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              });
            },
            child:const Text("delete"),
          ),
        ],
      ),
      body:Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
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
                  decoration: InputDecoration(
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