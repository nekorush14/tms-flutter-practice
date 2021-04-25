import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/view_models/counter_sample_view_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

/// Providers are declared globally and specifies how to create a state
final counterProvider = StateProvider((ref) => 0);

class Home extends StatelessWidget {
  final _viewModel = MyAppViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Consumer(builder: (context, watch, _) {
              // final count = watch(counterProvider).state;
              final count = watch(this._viewModel.fetchProvider()).state;
              return Text('$count');
            }),
          ),
          Center(
            child: OutlinedButton(
                onPressed: () => this._viewModel.resetCounter(context),
                child: Text("reset")),
          ),
        ],
      ),
      // body: Center(
      //   // Consumer is a widget that allows you reading providers.
      //   // You could also use the hook "useProvider" if you uses flutter_hooks
      //   child: Consumer(builder: (context, watch, _) {
      //     // final count = watch(counterProvider).state;
      //     final count = watch(this._viewModel.fetchProvider()).state;
      //     return Text('$count');
      //   }),
      // ),
      floatingActionButton: FloatingActionButton(
        // The read method is an utility to read a provider without listening to it
        // onPressed: () => context.read(counterProvider).state++,
        onPressed: () => this._viewModel.countUpSate(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
