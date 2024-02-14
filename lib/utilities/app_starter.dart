import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/firebase_options.dart';
import 'package:task_management_app/setup_app.dart';
import 'package:task_management_app/state/actions/user_actions.dart';
import 'package:task_management_app/state/app_state.dart';

Future<void> startApp() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final store = Store<AppState>(
        initialState: AppState.init(),
        actionObservers: [if (kDebugMode) Log.printer(formatter: Log.multiLineFormatter)],
      );

      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

      final currUser = FirebaseAuth.instance.currentUser;

      if (currUser != null) await store.dispatch(UserLoginAction(currUser));

      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user != null && user.uid != currUser?.uid) {
          await store.dispatch(UserLoginAction(user));
        }
      });

      runApp(
        StoreProvider<AppState>(
          store: store,
          child: const SetupApp(),
        ),
      );
    },
    (error, stack) async => {},
  );
}
