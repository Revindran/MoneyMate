// return Navigator(
//   // Adding [ValueKey] to make sure that the widget gets rebuilt when
//   // changing type.
//   key: ValueKey(_transitionType),
//   onGenerateRoute: (settings) {
//     return MaterialPageRoute<void>(
//       builder: (context) => SafeArea(
//         child: Scaffold(
//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _sizedBoxVertical(),
//             _headerWidget(),
//             _sizedBoxVertical(),
//             _incomeWidget(),
//             _sizedBoxVertical(),
//             _catHScrolls(),
//             _sizedBoxVertical(),
//             _sizedBoxVertical(),
//             _recentTransactions(),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _sizedBoxVertical(),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(Icons.ac_unit),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Buy'),
//                                   Text('5:55 PM'),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text('-\$82'),
//                                   SizedBox(
//                                     width: 16,
//                                   ),
//                                   Icon(
//                                     CupertinoIcons.arrow_turn_down_right,
//                                     color: Colors.grey[900],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           _sizedBoxVertical(),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _sizedBoxVertical(),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(Icons.ac_unit),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Buy'),
//                                   Text('5:55 PM'),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text('-\$82'),
//                                   SizedBox(
//                                     width: 16,
//                                   ),
//                                   Icon(
//                                     CupertinoIcons.arrow_turn_down_right,
//                                     color: Colors.grey[900],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           _sizedBoxVertical(),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _sizedBoxVertical(),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(Icons.ac_unit),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Buy'),
//                                   Text('5:55 PM'),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text('-\$82'),
//                                   SizedBox(
//                                     width: 16,
//                                   ),
//                                   Icon(
//                                     CupertinoIcons.arrow_turn_down_right,
//                                     color: Colors.grey[900],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           _sizedBoxVertical(),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _sizedBoxVertical(),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(Icons.ac_unit),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Buy'),
//                                   Text('5:55 PM'),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text('-\$82'),
//                                   SizedBox(
//                                     width: 16,
//                                   ),
//                                   Icon(
//                                     CupertinoIcons.arrow_turn_down_right,
//                                     color: Colors.grey[900],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           _sizedBoxVertical(),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _sizedBoxVertical(),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(Icons.ac_unit),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Buy'),
//                                   Text('5:55 PM'),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text('-\$82'),
//                                   SizedBox(
//                                     width: 16,
//                                   ),
//                                   Icon(
//                                     CupertinoIcons.arrow_turn_down_right,
//                                     color: Colors.grey[900],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           _sizedBoxVertical(),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _sizedBoxVertical(),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(Icons.ac_unit),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Buy'),
//                                   Text('5:55 PM'),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text('-\$82'),
//                                   SizedBox(
//                                     width: 16,
//                                   ),
//                                   Icon(
//                                     CupertinoIcons.arrow_turn_down_right,
//                                     color: Colors.grey[900],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           _sizedBoxVertical(),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _sizedBoxVertical(),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(Icons.ac_unit),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Buy'),
//                                   Text('5:55 PM'),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text('-\$82'),
//                                   SizedBox(
//                                     width: 16,
//                                   ),
//                                   Icon(
//                                     CupertinoIcons.arrow_turn_down_right,
//                                     color: Colors.grey[900],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           _sizedBoxVertical(),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _sizedBoxVertical(),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(Icons.ac_unit),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Buy'),
//                                   Text('5:55 PM'),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text('-\$82'),
//                                   SizedBox(
//                                     width: 16,
//                                   ),
//                                   Icon(
//                                     CupertinoIcons.arrow_turn_down_right,
//                                     color: Colors.grey[900],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           _sizedBoxVertical(),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _sizedBoxVertical(),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(Icons.ac_unit),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Buy'),
//                                   Text('5:55 PM'),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text('-\$82'),
//                                   SizedBox(
//                                     width: 16,
//                                   ),
//                                   Icon(
//                                     CupertinoIcons.arrow_turn_down_right,
//                                     color: Colors.grey[900],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           _sizedBoxVertical(),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _sizedBoxVertical(),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(Icons.ac_unit),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Buy'),
//                                   Text('5:55 PM'),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text('-\$82'),
//                                   SizedBox(
//                                     width: 16,
//                                   ),
//                                   Icon(
//                                     CupertinoIcons.arrow_turn_down_right,
//                                     color: Colors.grey[900],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           _sizedBoxVertical(),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//           /*floatingActionButton: OpenContainer(
//             transitionType: _transitionType,
//             openBuilder: (context, openContainer) => AddTransactions(),
//             closedElevation: 5,
//             closedShape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(_fabDimension / 2),
//               ),
//             ),
//             closedColor: Colors.amber[200],
//             closedBuilder: (context, openContainer) {
//               return SizedBox(
//                 height: _fabDimension,
//                 width: _fabDimension,
//                 child: Center(
//                   child: Icon(
//                     CupertinoIcons.doc_on_doc,
//                     color: colorScheme.onSecondary,
//                   ),
//                 ),
//               );
//             },
//           ),*/
//         ),
//       ),
//     );
//   },
// );