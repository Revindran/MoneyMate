import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_mate/Components/add_note.dart';
import 'package:money_mate/Components/notes_details.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

const double _fabDimension = 56;
Orientation orientation;

class _NotesPageState extends State<NotesPage> {
  String noteText;
  var storage = GetStorage();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Navigator(
      // Adding [ValueKey] to make sure that the widget gets rebuilt when
      // changing type.
      key: ValueKey(_transitionType),
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(
          builder: (context) => Scaffold(
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
                                  .doc(storage.read('email'))
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
                                }
                                if (querySnapshot.data.size == 0) {
                                  return _noNotes();
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GridView.builder(
                                      itemCount: querySnapshot.data.docs.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: (context.isPhone)
                                                  ? 2
                                                  : 3,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10),
                                      itemBuilder: (context, index) {
                                        final DocumentSnapshot myNotes =
                                            querySnapshot.data.docs[index];
                                        return _OpenContainerWrapper(
                                          snap: myNotes,
                                          transitionType: _transitionType,
                                          closedBuilder:
                                              (context, openContainer) {
                                            return GridCardView(
                                                snap: myNotes,
                                                openContainer: openContainer);
                                          },
                                        );
                                      },
                                    ),
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
            floatingActionButton: OpenContainer(
              transitionType: _transitionType,
              openBuilder: (context, openContainer) => AddNotesPage(),
              closedElevation: 6,
              closedShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(_fabDimension / 2),
                ),
              ),
              closedColor: colorScheme.secondary,
              closedBuilder: (context, openContainer) {
                return SizedBox(
                  height: _fabDimension,
                  width: _fabDimension,
                  child: Center(
                    child: Icon(
                      CupertinoIcons.doc_on_doc,
                      color: colorScheme.onSecondary,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _emptyNotes() {
    return Container(
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _noNotes() {
    return Container(
      child: Center(child: Text('Empty')),
    );
  }
}

// ignore: must_be_immutable
class GridCardView extends StatelessWidget {
  DocumentSnapshot snap;

  GridCardView({Key key, @required this.snap, this.openContainer})
      : super(key: key);
  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    return _InkWellOverlay(
      openContainer: openContainer,
      child: Card(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Title',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Text(
                          snap['created'],
                          style: TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                    Text(
                      snap['title'] ?? "N/A",
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Note',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Text(
                      snap['Note'] ?? "N/A",
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({this.closedBuilder, this.transitionType, this.snap});

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final DocumentSnapshot snap;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (context, openContainer) => NotesDetails(
        snapData: snap,
      ),
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}

class _InkWellOverlay extends StatelessWidget {
  const _InkWellOverlay({
    this.openContainer,
    this.width,
    this.height,
    this.child,
  });

  final VoidCallback openContainer;
  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(
        onTap: openContainer,
        child: child,
      ),
    );
  }
}
