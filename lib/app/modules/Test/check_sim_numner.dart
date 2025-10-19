// // import 'package:flutter/material.dart';
// // import 'package:sizer/sizer.dart';
//
// // class Tesst extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Sizer(
// //       builder: (context, orientation, deviceType) {
// //         return MaterialApp(
// //           debugShowCheckedModeBanner: false,
// //           title: 'Sizer',
// //           theme: ThemeData.light(),
// //           home: HomeScreen(),
// //         );
// //       },
// //     );
// //   }
// // }
//
// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 100.w,
// //       height: 100.h,
// //       color: Colors.amber,
// //       child: Column(
// //         children: [
// //           SizedBox(
// //             //It will take a 20% of screen width
// //             height: 5.h,
// //           ),
// //           Expanded(
// //             child: Container(
// //               width: 100.w, //It will take a 20% of screen width
//
// //               color: Colors.blue,
// //               child:
// //                   Text('SAhed knasjdnakln', style: TextStyle(fontSize: 50.sp)),
// //             ),
// //           ),
// //           Expanded(
// //             child: Container(
// //               width: 80.w, //It will take a 20% of screen width
//
// //               color: Colors.red,
// //               child:
// //                   Text('SAhed knasjdnakln', style: TextStyle(fontSize: 50.sp)),
// //             ),
// //           ),
// //           Expanded(
// //             child: Container(
// //               width: 70.w, //It will take a 20% of screen width
//
// //               color: Colors.yellow,
// //               child:
// //                   Text('SAhed knasjdnakln', style: TextStyle(fontSize: 50.sp)),
// //             ),
// //           ),
// //           Expanded(
// //             child: Container(
// //               width: 70.w, //It will take a 20% of screen width
//
// //               color: Colors.yellow,
// //               child: FittedBox(
// //                   fit: BoxFit.contain,
// //                   child: Text('Sahed knasjdnakln',
// //                       style: TextStyle(fontSize: 50.sp))),
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class Tesst extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Test',
//       theme: ThemeData(
//           primarySwatch: Colors.blue,
//           fontFamily: "Arial",
//           textTheme: TextTheme(
//               headlineSmall: TextStyle(color: Colors.white, fontSize: 18.0),
//               headlineMedium: TextStyle(color: Colors.red))),
//       home: WebViewContainer('https://camellabs.com'),
//     );
//   }
// }
//
// class WebViewContainer extends StatefulWidget {
//   final url;
//
//
//   WebViewContainer(this.url);
//
//   @override
//   createState() => _WebViewContainerState(this.url);
// }
//
// class _WebViewContainerState extends State<WebViewContainer> {
//   var _url;
//   final _key = UniqueKey();
//
//   _WebViewContainerState(this._url);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Column(
//           children: [
//             Expanded(
//                 child: WebView(
//                     key: _key,
//                     javascriptMode: JavascriptMode.unrestricted,
//                     initialUrl: _url)),
//             // Container(
//             //     padding: EdgeInsets.all(50.0),
//             //     child: ElevatedButton(
//             //       //  color: Theme.of(context).primaryColor,
//             //       //  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
//             //       child: Text('Tap to navigate'),
//             //       onPressed: () {
//             //         Navigator.push(
//             //           context,
//             //           MaterialPageRoute(
//             //               builder: (context) => const SecondRoute()),
//             //         );
//             //       },
//             //     ))
//           ],
//         ));
//   }
// }
//
// class SecondRoute extends StatelessWidget {
//   const SecondRoute({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Second Route'),
//       ),
//       body: Center(
//           child: Form(
//         child: TextField(
//           decoration: InputDecoration(hintText: 'enter'),
//         ),
//       )),
//     );
//   }
// }
