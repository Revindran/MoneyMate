import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/Components/add_note.dart';
import 'package:money_mate/Components/notes_details.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

Orientation orientation;

class _NotesPageState extends State<NotesPage> {
  String noteText;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40)),
                  color: Colors.amber),
            )
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Money Mate",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                ),
              ),
              Text(
                "Track Your Money Flow",
                style: Theme.of(context).textTheme.headline4.copyWith(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: Colors.grey.shade800,
                    ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100.0),
              Column(
                children: [
                  new Container(
                    height: MediaQuery.of(context).size.height / 1.2,
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Users')
                            .doc(_auth.currentUser.email)
                            .collection('Notes')
                            .orderBy("timeStamp", descending: true)
                            .snapshots(),
                        // ignore: missing_return
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> querySnapshot) {
                          if (querySnapshot.hasError)
                            return Center(child: Text('Has Error'));
                          if (querySnapshot.connectionState ==
                              ConnectionState.waiting) {
                            CircularProgressIndicator();
                          }
                          if (querySnapshot.data == null) {
                            return _emptyNotes();
                          } else {
                            return GridView.builder(
                              itemCount: querySnapshot.data.docs.length,
                              primary: false,
                              padding: EdgeInsets.all(10),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          (orientation == Orientation.portrait)
                                              ? 3
                                              : 2),
                              itemBuilder: (context, index) {
                                final DocumentSnapshot myNotes =
                                    querySnapshot.data.docs[index];
                                return GestureDetector(
                                  child: new Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: new GridTile(
                                        child: new Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Title',
                                                      style: TextStyle(
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    ),
                                                    Text(
                                                      myNotes['created'],
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  myNotes['title'] ?? "N/A",
                                                  softWrap: false,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Note',
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                                Text(
                                                  myNotes['Note'] ?? "N/A",
                                                  softWrap: true,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                  onTap: () {
                                    pushNewScreen(
                                      context,
                                      screen: NotesDetails(snapData: myNotes),
                                      withNavBar: false,
                                      // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino,
                                    );
                                  },
                                );
                              },
                            );
                          }
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushNewScreen(
            context,
            screen: AddNotesPage(),
            withNavBar: false,
            // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: Icon(
          CupertinoIcons.doc_on_doc,
        ),
        backgroundColor: Colors.green.shade50,
      ),
    );
  }

  Widget _emptyNotes() {
    return Container(
      child: Center(child: Text('No Note Please Create one')),
    );
  }
}
