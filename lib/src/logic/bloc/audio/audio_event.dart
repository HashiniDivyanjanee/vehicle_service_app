part of 'audio_bloc.dart';

abstract class AudioEvent extends Equatable {
  const AudioEvent();

  @override
  List<Object> get props => [];
}

class StartRecordingEvent extends AudioEvent{}

class StopRecordingEvent extends AudioEvent{}

class CheckPermissionEvent extends AudioEvent{}