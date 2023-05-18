import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.green),
                        backgroundColor: Colors.redAccent,
                        strokeWidth: 20.0,
                        value: state.count.toDouble() / 10,
                      ),
                      Center(
                        child: Text(
                          state.count.toString(),
                          style: TextStyle(fontSize: 48.0),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16.0),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context)
                            .add(StartCountdownEvent());
                      },
                      child: Text(state.buttonText),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context)
                            .add(ResetCountdownEvent());
                      },
                      child: Text('Reset'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
