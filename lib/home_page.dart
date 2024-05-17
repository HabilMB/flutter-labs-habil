import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data.add({"nama": "Habil", "alamat": "Depok"});
    data.add({"nama": "Danis", "alamat": "Tangerang"});
    data.add({"nama": "Lejar", "alamat": "Depok"});
    data.add({"nama": "Shalsa", "alamat": "Bekas"});
    data.add({"nama": "Rifky", "alamat": "Cianjur"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 1),
                  blurRadius: 10,
                ),
                ]
              ),
              child: Column(
                children: [
                  Text("Nama : ${data[index]["nama"]}"),
                  Text("Alamat : ${data[index]["alamat"]}"),
                ],
              ),
            );
          },
          separatorBuilder: (context, index){
            return SizedBox(
              height: 10,
            );
          },
          itemCount: data.length,
      )
    );
  }
}
