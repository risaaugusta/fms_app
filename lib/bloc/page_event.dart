part of 'page_bloc.dart';

@immutable
abstract class PageEvent extends Equatable {}

class GoToWelcome extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLogin extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToHomeDashboard extends PageEvent {
  @override
  List<Object> get props => [];
}