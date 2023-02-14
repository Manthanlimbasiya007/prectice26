import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prectice26/datamodel.dart';
import 'package:prectice26/main.dart';

class datapage extends StatefulWidget {
  const datapage({Key? key}) : super(key: key);

  @override
  State<datapage> createState() => _datapageState();
}

class _datapageState extends State<datapage> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtstd  = TextEditingController();
  TextEditingController txtGrid = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Student Data"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: txtName,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtstd,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtGrid,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: (){
                    StdModel s1 = StdModel(
                        gr_id: txtGrid.text,std: txtstd.text,name: txtName.text
                    );
                    setState(() {
                      l1.add(s1);
                    });
                    Navigator.pop(context);
                  }, child: Text("Add")),
            ],
          ),
        ),
      ),
    );
  }
}
