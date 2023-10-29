// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
sealed class QuestionlogicEvent {}

class AnswerEvent extends QuestionlogicEvent {
  bool CorrectAnswer;
  //  bool InCorrectAnswer;
    int Time; 
    int star;
  AnswerEvent({
    required this.CorrectAnswer,
    // required this.InCorrectAnswer,
    required this.Time,
     required this.star,

  });
  
}





// // String answerDetails;
//   bool CorrectAnswer;
//   // int Time; 
//   // bool InCorrectAnswer;
//   AnswerEvent({
//     required this.CorrectAnswer,
//     // required this.Time,
//   });
  
// }