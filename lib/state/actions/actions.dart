import 'package:async_redux/async_redux.dart';
import 'package:setup/state/app_state.dart';

/// Update [counter] in state based on Offset
class CounterAction extends ReduxAction<AppState> {
  CounterAction(this.offset);

  final int offset;
  @override
  AppState reduce() => state.copyWith(counter: state.counter + offset);
}
