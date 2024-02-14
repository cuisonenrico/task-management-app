import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    this.scaffoldKey,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.appBar,
    this.bottomNavigationBar,
    this.extendBody = false,
    this.backgroundColor,
    super.key,
  });

  final bool extendBody;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? appBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // endDrawer: const DrawerMenuConnector(),
      // endDrawerEnableOpenDragGesture: scaffoldKey?.currentState?.isEndDrawerOpen == false,
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      extendBody: extendBody,
      body: Column(
        children: [
          if (appBar != null) appBar!,
          if (body != null) Expanded(child: body!),
        ],
      ),
    );
  }
}
