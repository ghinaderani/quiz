import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz2/main.dart';
import 'package:quiz2/model/question.dart';


part 'home_event.dart';
part 'home_state.dart';

class QuestionlogicBloc extends Bloc<QuestionlogicEvent, QuestionlogicState> {
  QuestionlogicBloc() : super(QuestionlogicInitial()) {
    on<AnswerEvent>((event, emit) {
 

if (event.star<event.Time){
  if ( event.CorrectAnswer){

    emit(CorrectAnswer());
  
  }else{
    emit(InCorrectAnswer());
  }
}
else(TimeOut());
    });
  }
}