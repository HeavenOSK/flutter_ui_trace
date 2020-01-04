import 'package:redux/redux.dart';

import 'app_state.dart';
import 'reducers/reducers.dart';

final Reducer<AppState> appReducer = combineReducers<AppState>(
  [
    counterReducer,
  ],
);
