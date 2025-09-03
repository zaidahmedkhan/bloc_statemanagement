import 'package:bloc/bloc.dart';
import 'package:bloc_demo/bloc/switch/switch_event.dart';
import 'package:bloc_demo/bloc/switch/switch_states.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchStates> {
  SwitchBloc() : super(SwitchStates()) {
    on<EnableOrDisableNotifications>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(
    EnableOrDisableNotifications event,
    Emitter<SwitchStates> emit,
  ) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent event, Emitter<SwitchStates> emit) {
    emit(state.copyWith(slider: event.sliderValue));
  }
}
