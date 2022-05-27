// part of '../pages.dart';
//
// class Auth extends StatefulWidget {
//   const Auth({Key? key}) : super(key: key);
//
//   @override
//   _AuthState createState() => _AuthState();
// }
//
// class _AuthState extends State<Auth> {
//   String authCode ="";
//   String textHolder = 'Buka Aplikasi Google Auth, masukkan kode nya';
//
//   _changeText() {
//     setState(() {
//       if(authCode != "testing"){
//         textHolder = 'Kode Authentication tidak cocok!';
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(0),
//               child: Text('Authentication',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 36,
//                       fontFamily: Fonts.BOLD
//                   ) ),
//             ),
//             Container(
//               width: 300,
//               decoration:
//               BoxDecoration(borderRadius: BorderRadius.circular(20)),
//               margin: EdgeInsets.only(top: 70),
//               child: Material(
//                 elevation: 20.0,
//                 shadowColor: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(20),
//                 child: TextFormField(
//                   autofocus: false,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       borderSide: BorderSide(
//                         color: Colors.white,
//                       ),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       borderSide: BorderSide(
//                         color: Colors.white,
//                       ),
//                     ),
//                     hintText: 'Auth Code',
//                     fillColor: Colors.white,
//                     filled: true,
//                     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                   ),
//                   onChanged: (text)=> authCode = text , //dummy value
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top:100),
//               child: Padding(
//                 padding: const EdgeInsets.all(0),
//                 child: authCode == "" && authCode != "testing"  //dummy value
//                     ? Text(
//                     "$textHolder",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontFamily: Fonts.REGULAR
//                     )
//                 )
//                     : Text(
//                     "$textHolder",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontSize: 14,
//                         fontFamily: Fonts.REGULAR
//                     )
//                 ),
//               ),
//             ),
//             Container(
//               margin:  EdgeInsets.only(top: 20,bottom: 60),
//               height: 60,
//               child: ButtonTheme(
//                 minWidth: 300,
//                 child: RaisedButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       side: BorderSide(color: Coloring.mainColor)),
//                   onPressed: () {
//                     if(authCode == "testing"){// dummy value
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Welcome()),);
//                     }else{
//                       _changeText();
//                     }
//                   },
//                   color: Coloring.mainColor,
//                   textColor: Colors.white,
//                   child: Text("Sign In",
//                       style: TextStyle(color: Colors.white, fontFamily: Fonts.BOLD,fontSize: 18)),
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(0),
//                   child: Text('Belum mempunyai akun?  ',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xff9F9F9F),
//                         fontSize: 18,
//                         fontFamily: Fonts.REGULAR,
//                       ) ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(0),
//                   child: Text(' SignUp',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Coloring.secondColor,
//                         fontSize: 18,
//                         fontFamily: Fonts.BOLD,
//                       ) ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
