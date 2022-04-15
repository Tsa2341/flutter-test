import 'package:bloc/bloc.dart';

abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>(
      (event, emit) {
        // handle incoming `CounterIncrementPressed` event
        emit(state + 1);
      },
    );
    on<CounterDecrementPressed>(
      (event, emit) {
        emit(state - 2);
      },
    );
  }
}

Future<void> main() async {
  final bloc = CounterBloc();
  print(bloc.state); // 0

  bloc.add(CounterIncrementPressed());
  await Future.delayed(Duration.zero);
  print(bloc.state); // 1

  bloc.add(CounterDecrementPressed());
  await Future.delayed(Duration(seconds: 2));
  print(bloc.state); // -1

  await bloc.close();
}
