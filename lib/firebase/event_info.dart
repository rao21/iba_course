// import 'package:firebase_auth/firebase_auth.dart' // new
//     hide
//         EmailAuthProvider,
//         PhoneAuthProvider; // new
// import 'package:flutter/material.dart'; // new
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart'; // new

// import 'app_state.dart';

// class EventPage extends StatelessWidget {
//   const EventPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => context.pushReplacement('/sign-in'),
//       ),
//       appBar: AppBar(
//         title: const Text('Firebase Meetup'),
//         actions: [
//           Consumer<ApplicationState>(
//             builder: (context, appState, _) => AuthFunc(
//                 loggedIn: appState.loggedIn,
//                 onPressed: () async {
//                   if (appState.loggedIn) FirebaseAuth.instance.signOut();
//                   context.pushReplacement('/sign-in');
//                 }),
//           )
//         ],
//       ),
//       body: ListView(
//         children: <Widget>[
//           Image.asset('assets/images/codelab.jpg'),
//           const SizedBox(height: 8),
//           Row(
//             children: [
//               const Icon(Icons.calendar_today),
//               const SizedBox(
//                 width: 16,
//               ),
//               const Text('27 March 2023')
//             ],
//           ),
//           Row(
//             children: [
//               const Icon(
//                 Icons.location_city,
//               ),
//               const SizedBox(
//                 width: 16,
//               ),
//               const Text('Karachi, Pakistan')
//             ],
//           ),
//           _divider(),
//           Text(
//             "What we'll be doing",
//             style: GoogleFonts.getFont('Lato'),
//           ),
//           Text('Join us for a day full of Firebase Workshops and Pizza!',
//               style: GoogleFonts.getFont('Lato')),
//         ],
//       ),
//     );
//   }

//   Divider _divider() {
//     return const Divider(
//       height: 8,
//       thickness: 1,
//       indent: 8,
//       endIndent: 8,
//       color: Colors.grey,
//     );
//   }
// }

// class AuthFunc extends StatefulWidget {
//   final bool loggedIn;
//   final Function() onPressed;
//   const AuthFunc({super.key, required this.loggedIn, required this.onPressed});

//   @override
//   State<AuthFunc> createState() => _AuthFuncState();
// }

// class _AuthFuncState extends State<AuthFunc> {
//   @override
//   Widget build(BuildContext context) {
//     return widget.loggedIn
//         ? IconButton(
//             onPressed: widget.onPressed,
//             icon: const Icon(Icons.logout),
//           )
//         : IconButton(
//             onPressed: widget.onPressed, icon: const Icon(Icons.login));
//   }
// }
