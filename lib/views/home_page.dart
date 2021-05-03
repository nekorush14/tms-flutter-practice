import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/view_models/menu_page_view_model.dart';

class HomePage extends ConsumerWidget {
  final MenuPageViewModel _viewModel = MenuPageViewModel();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // HomePage() {
  //   _initFirebase();
  // }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        leading: IconButton(
            onPressed: () => _viewModel.signOut(context),
            icon: const Icon(Icons.logout_outlined)),
      ),
      body: Column(
        children: [
          // Container(
          //   child: FutureBuilder(
          //     future: _initialization,
          //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //       if (snapshot.connectionState == ConnectionState.done) {
          //         return Container();
          //       } else {
          //         return CircularProgressIndicator();
          //       }
          //     },
          //   ),
          // ),
          // Container(
          //   child: FutureBuilder(
          //     future: _viewModel.curentUser,
          //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //       if (snapshot.connectionState == ConnectionState.done) {
          //         return Text(snapshot.data.email.toString());
          //       } else {
          //         return CircularProgressIndicator();
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  // void _initFirebase() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp();
  // }
}
