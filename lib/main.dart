import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
         primarySwatch: Colors.green,
         canvasColor: const Color.fromRGBO(255, 254, 229,1),
       ),
      home: Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.purple,
          leading: const IconButton(
            icon: Icon(Icons.format_list_bulleted_rounded,color: Colors.white,),
            onPressed: null,
          ),
          title:const Text('Todo List',style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal
          ),),

          bottom:PreferredSize(
            preferredSize:Size(0, 80),
            child:Container(
              //color: Colors.white,
              child: Center(
                child: Container(
                  width: 300,
                  margin: const EdgeInsets.only(bottom:10),
                  decoration:BoxDecoration(
                      border: Border.all(color: Colors.white,width: 2),
                      borderRadius: BorderRadius.circular(30)
                  ),

                  child: const TextField(
                    onChanged: null,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    textAlign: TextAlign.start,

                    decoration:InputDecoration(
                        hintText: 'search todo',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        prefixIcon: IconButton(
                          onPressed: null,
                          icon: Icon(Icons.search_rounded,color: Colors.white,),
                        )

                    ),
                  ),
                ),
              ),
            ),
          ),
          actions:  [
            Container(
              margin:EdgeInsets.only(top: 20,right: 10),
              child: const Column(
                children: [
                  Text("avishka brpayh",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(right: 30,top: 10),
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/image/CAMBO_SE.png'),
                      fit: BoxFit.fill
                  )
              ),
            )
          ],

        ),
        body: null,//body widget
        bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.purple,
              //color: Colors.white10,
              height: 70,
              onTap: (index){
                print(index);
              },
              items:  const [
                Icon(Icons.home_filled,
                  size: 25,
                  color: Colors.black,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  hoverColor: Colors.purple,
                  onPressed: null,
                  child: Icon(Icons.add,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
                Icon(Icons.contact_page_rounded,
                  size: 25,
                  color: Colors.black,
                )
              ],
            ),
        ),

    );
  }
}

