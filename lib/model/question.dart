// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuestionModel {
  String questionSentenc;
  String description;
  int time;
  List<Answer> asnwers;
  QuestionModel({
    required this.questionSentenc,
    required this.description,
    required this.time,
    required this.asnwers,
  });

  QuestionModel copyWith({
    String? questionSentenc,
    String? description,
    int? time,
    List<Answer>? asnwers,
  }) {
    return QuestionModel(
      questionSentenc: questionSentenc ?? this.questionSentenc,
      description: description ?? this.description,
      time: time ?? this.time,
      asnwers: asnwers ?? this.asnwers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'questionSentenc': questionSentenc,
      'description': description,
      'time': time,
      'asnwers': asnwers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      questionSentenc: map['questionSentenc'] as String,
      description: map['description'] as String,
      time: map['time'] as int,
      asnwers: List<Answer>.from((map['asnwers'] as List<int>).map<Answer>((x) => Answer.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuestionModel(questionSentenc: $questionSentenc, description: $description, time: $time, asnwers: $asnwers)';
  }

  @override
  bool operator ==(covariant QuestionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.questionSentenc == questionSentenc &&
      other.description == description &&
      other.time == time &&
      listEquals(other.asnwers, asnwers);
  }

  @override
  int get hashCode {
    return questionSentenc.hashCode ^
      description.hashCode ^
      time.hashCode ^
      asnwers.hashCode;
  }
}

class Answer {
  String asnwer;
   bool isCorrect;
  Answer({
    required this.asnwer,
    required this.isCorrect,
  });

  Answer copyWith({
    String? asnwer,
    bool? isCorrect,
  }) {
    return Answer(
      asnwer: asnwer ?? this.asnwer,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'asnwer': asnwer,
      'isCorrect': isCorrect,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      asnwer: map['asnwer'] as String,
      isCorrect: map['isCorrect'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) => Answer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Answer(asnwer: $asnwer, isCorrect: $isCorrect)';

  @override
  bool operator ==(covariant Answer other) {
    if (identical(this, other)) return true;
  
    return 
      other.asnwer == asnwer &&
      other.isCorrect == isCorrect;
  }

  @override
  int get hashCode => asnwer.hashCode ^ isCorrect.hashCode;
}
