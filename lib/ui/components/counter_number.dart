import 'package:flutter/material.dart';
import 'package:provider_sample/provider/counter.dart';
import 'package:provider_sample/ui/components/rebuild_viewer.dart';
import 'package:provider/provider.dart';

class CounterViewer extends StatelessWidget {
  const CounterViewer({Key? key}) : super(key: key);

  // Without using a consumer or selector :
  @override
  Widget build(BuildContext context) {
    return RebuildViewer(
      child: Text(
        '${context.watch<Counter>().number}',
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
