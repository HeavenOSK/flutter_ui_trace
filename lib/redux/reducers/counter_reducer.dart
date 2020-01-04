import 'package:redux/redux.dart';
import 'package:redux_types/redux_types.dart';

import '../actions/actions.dart';
import '../app_state.dart';

Reducer<AppState> counterReducer = combineReducers(
  [
    ReducerOf<AppState, CounterAddSucceededAction>(
      callback: (state, action) {
        return state.copyWith(
          counter: action.result,
        );
      },
    ),
    ReducerOf<AppState, CounterSubtractSucceededAction>(
      callback: (state, action) {
        return state.copyWith(
          counter: action.result,
        );
      },
    ),
  ],
);
