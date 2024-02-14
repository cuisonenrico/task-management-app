import 'package:flutter/material.dart';
import 'package:task_management_app/screens/widgets/app_bar.dart';
import 'package:task_management_app/screens/widgets/app_scaffold.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    required this.onTap,
    required this.counter,
    super.key,
  });

  final int counter;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const MyAppBar(
        isSecondaryIconVisible: true,
        isBackButtonVisible: true,
        isMessagingIconVisible: false,
        isCornersRounded: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onTap(1),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
