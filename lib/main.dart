import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var newTask = "";
  List<dynamic> mylist = [];

  Widget myDialog() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Center(
          child: new Text("Add Task",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ))),
      content: Container(
        margin: EdgeInsets.only(left: 20),
        padding: EdgeInsets.only(top: 20),
        child: TextField(
          onChanged: (text) {
            newTask = text;
          },
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent.shade100),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.teal.shade600),
              ),
              hintStyle: TextStyle(color: Colors.teal.shade600),
              hintText: "I Have To..."),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new ElevatedButton(
              child: new Text("Add"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.teal.shade600,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              onPressed: () {
                setState(() {
                  if (newTask != "") {
                    mylist.insert(0, newTask);
                    // mylist.add(newTask);
                  }
                  Navigator.of(context).pop();
                  newTask = "";
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.teal.shade600,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    height: 55,
                    width: 150,
                    child: Center(
                        child: Text(
                      "${mylist.length} Tasks",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))),
                Text('ToDo App',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: mylist.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.tealAccent.shade100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          height: 75,
                          width: double.infinity,
                          child: Center(
                            child: ListTile(
                              title: Text(
                                "${mylist[index]}",
                                style: TextStyle(fontSize: 20),
                              ),
                              trailing: Container(
                                  width: 80,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      title: Center(
                                                          child: new Text(
                                                              "Edit Task",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20.0,
                                                              ))),
                                                      content: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 20),
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 20),
                                                        child: TextField(
                                                          onChanged: (text) {
                                                            newTask = text;
                                                          },
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                          decoration:
                                                              InputDecoration(
                                                                  enabledBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.tealAccent.shade100),
                                                                  ),
                                                                  focusedBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        color: Colors
                                                                            .teal.shade600),
                                                                  ),
                                                                  hintStyle: TextStyle(
                                                                      color: Colors
                                                                          .teal.shade600),
                                                                  hintText:
                                                                      "I Have To..."),
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            new ElevatedButton(
                                                              child: new Text(
                                                                  "Edit"),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      primary: Colors
                                                                          .teal
                                                                          .shade600,
                                                                      onPrimary:
                                                                          Colors
                                                                              .white,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20),
                                                                      )),
                                                              onPressed: () {
                                                                setState(() {
                                                                  if (newTask !=
                                                                      "") {
                                                                    mylist.replaceRange(
                                                                        index,
                                                                        index +
                                                                            1,
                                                                        {
                                                                          newTask
                                                                        });
                                                                  }
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  newTask = "";
                                                                });
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            });
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.teal.shade600,
                                          )),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              mylist.removeAt(index);
                                            });
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.teal.shade600,
                                          )),
                                    ],
                                  )),
                            ),
                          )));
                }),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 75.0,
        width: 75.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.teal.shade600,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return myDialog();
                  });
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
