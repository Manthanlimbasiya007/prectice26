
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prectice26/datamodel.dart';
import 'package:prectice26/main.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtstd = TextEditingController();
  TextEditingController txtgrid = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Student Details"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            ListView.builder(itemBuilder: (context, index) =>viewTile(
                l1[index].name!, l1[index].gr_id!,l1[index].std!, index),
              itemCount: l1.length,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: FloatingActionButton(
                  onPressed: (){
                    Navigator.pushNamed(context, 'data').then((value) {
                      setState(() {
                      });
                     },
                    );
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
void updateDialog(String name, String gr_id, String std, int index) {
    txtName = TextEditingController(text: name);
    txtgrid = TextEditingController(text: gr_id);
    txtstd = TextEditingController(text: std);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Column(
              mainAxisSize:MainAxisSize.min,
              children: [
               TextField(
                 controller: txtName,
                 decoration: InputDecoration(border: OutlineInputBorder()),
               ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtgrid,
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
                ElevatedButton(
                    onPressed: (){
                      StdModel s1 = StdModel(
                        gr_id: txtgrid.text,std: txtstd.text,name: txtName.text
                      );
                      setState(() {
                        l1[index] = s1;
                      });
                      Navigator.pop(context);
                }, child: Text("Add")),
             ],
            ),
        ),
    );
  }
  Widget viewTile(String name,String grid,String std,int index)
  {
    return ListTile(
      leading: Text("$grid"),
      title: Text("$name"),
      subtitle: Text("$std"),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: (){
                  updateDialog(name, grid, std, index);
                }, icon: Icon(Icons.edit)
            ),
            IconButton(
               onPressed: (){
                 setState(() {
                   l1.removeAt(index);
                 });
               },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
