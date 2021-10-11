part of 'page_bloc.dart';

@immutable
abstract class PageState extends Equatable {}
class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}
class OnWelcome extends PageState {
  @override
  List<Object> get props => [];
}

class OnLogin extends PageState {
  @override
  List<Object> get props => [];
}

class OnHomeDashboard extends PageState {
  @override
  List<Object> get props => [];
}