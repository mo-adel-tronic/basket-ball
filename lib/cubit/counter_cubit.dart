import 'package:basketball_counter_app/cubit/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  int teamAPoints = 0;
  int teamBPoints = 0;
  CounterCubit() :super(CounterStateA());

  void setTeamCounter ({required String team, int point = 1}) {
    if(team == 'A') {
      teamAPoints += point;
      emit(CounterStateA());
    } else {
      teamBPoints += point;
      emit(CounterStateB());
    }
  }

  void resetCounter () {
    teamAPoints = 0;
    teamBPoints = 0;
    emit(CounterStateReset());
  }
}