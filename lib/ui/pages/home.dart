import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/provider/counter.dart';
import 'package:provider_sample/provider/theme.dart';
import 'package:provider_sample/ui/components/counter_number.dart';
import 'package:provider_sample/ui/components/rebuild_viewer.dart';

class HomePage extends StatelessWidget {
  // Never be a constantless man unless you really can't
  const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Listening to the all of the state changes :
            Consumer<Counter>(
              builder: (context, value, child) => RebuildViewer(
                child: Text(
                  '${value.number}',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            // Listening to a specific state change :
            Selector<Counter, int>(
              selector: (context, value) => value.half,
              builder: (context, value, child) => Theme(
                data: Theme.of(context),
                child: RebuildViewer(
                  child: Text(
                    '$value',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
            ),
            CounterViewer(),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final data = context.read<ThemeNotifier>();
                data.changeTheme(
                  data.themeKey == AppTheme.indigo
                      ? AppTheme.red
                      : AppTheme.indigo,
                );
              },
              child: Text('Toggle theme'),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () => context.read<Counter>().increment(),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(height: 5),
            FloatingActionButton(
              onPressed: () => context.read<Counter>().decrement(),
              tooltip: 'Decrement',
              child: Icon(
                Icons.remove,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
