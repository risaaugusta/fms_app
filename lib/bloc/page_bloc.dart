import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage());

  @override
  Stream<PageState> mapEventToState(PageEvent event) async* {
    if (event is GoToWelcome) {
      yield OnWelcome();
    }else if(event is GoToLogin){
      yield OnLogin();
    }else if(event is GoToHomeDashboard){
      yield OnHomeDashboard();
    }
  }
}
