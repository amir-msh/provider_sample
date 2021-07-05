import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/provider/theme.dart';
import 'package:provider_sample/ui/pages/home.dart';
import 'package:provider_sample/provider/counter.dart';

void main() {
  runApp(AppProvider());
}

class AppProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Counter(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeNotifier(),
        ),
      ],
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider sample',
      // For changing the global theme of the app,
      // there is no choice but rebuilding MaterialApp().
      //
      // context.watch => listen : true
      // context.read => listen : false
      //
      // listen : true => rebuilds the current (class scope) widget,
      // without needing a consumer, selector or even a StatefulWidget!
      theme: context.watch<ThemeNotifier>().theme,
      home: const HomePage(),
    );
  }
}
