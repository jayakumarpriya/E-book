import 'dart:convert';

import 'package:ebook/module/auth/userdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
  }
List notes =[{
  "url":"https://www.orimi.com/pdf-test.pdf",
  "name":"PDF File-1",
  "rating":2,
  "image":"https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"
},{
  "url":"https://www.orimi.com/pdf-test.pdf",
  "name":"PDF File-2",
  "rating":4,
  "image":"https://picsum.photos/250?image=9"
},{
  "url":"https://www.orimi.com/pdf-test.pdf",
  "name":"PDF File-3",
  "rating":5, "image":"https://picsum.photos/250?image=9"
},{
  "url":"https://www.orimi.com/pdf-test.pdf",
  "name":"PDF File-4",
  "rating":2, "image":"https://picsum.photos/250?image=9"
}];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: const Size.fromHeight(70), child: Container(
          color: Colors.grey.shade300,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Reading List",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18

                ),),
                    Text("${Provider.of<UserValues>(context).userdata["name"]??""}",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14

                ),),
               
                
                // Text("${Provider.of<UserValues>(context).userdata["name"]}")
              ],
            ),
          ),
        )),
        body: Container(
          height: MediaQuery.of(context).size.height-200,
          child: GridView.builder(
                itemCount: notes.length,
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10), itemBuilder: (context,indx){
                return Container(
                  height: 150,
                  margin: EdgeInsets.all(16),
                  color: Colors.grey.shade300,
                  // width:( MediaQuery.of(context).size.width/2)-100,
                  width: 200,
                  child: Stack(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        
                        child: Image.network(
                          notes[indx]["image"]??""
                        ),
                      ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${notes[indx]["name"]}"),
                            Row(
                              children: [
                                for(int i=0;i< notes[indx]["rating"];i++)
                                Icon(Icons.star)
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],),
                );
              }),
        ),
      ),
    );
  }
}