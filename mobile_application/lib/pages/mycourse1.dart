import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[

            Center(
                child: SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),

                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                                IconButton(
                                  icon: Icon(Icons.arrow_back_ios),
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  iconSize: 22.0,
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("My courses",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black)
                                ),
                                SizedBox(
                                  width: 100,
                                ),

                              ],
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                                Center(child: Image.asset('Assets/java1.png', scale: 0.95)),

                              ],
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          Text("JAVA Language",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black)),
                          SizedBox(
                            height: 5,
                          ),



                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Top Student",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black)),
                                Text("Top Student",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black)),
                                Text("Top Student",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black)),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            alignment: Alignment.topLeft,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                OutlinedButton(
                                  child: Text(
                                    " MIS ",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                                OutlinedButton(
                                  child: Text(
                                    " Computer Network ",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                                OutlinedButton(
                                  child: Text(
                                    "Cyber Security",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),

                    ],
                      )),


                )),
          ],
        ),
      ),
    );
  }
}