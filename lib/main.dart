import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz2/bloc/home_bloc.dart';
import 'package:quiz2/model/question.dart';

import 'config/bloc_obesrve.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(QuizApp());
}

List<QuestionModel> questions = [
  QuestionModel(
      questionSentenc: 'How Long Are You ?',
      description: 'This is an easy Question ...',
      time: 3,
      asnwers: [
        Answer(asnwer: '20 m', isCorrect: false),
        Answer(asnwer: '10 m', isCorrect: false),
        Answer(asnwer: '5 m', isCorrect: false),
        Answer(asnwer: '1.8 m', isCorrect: true)
      ]),
  QuestionModel(
      questionSentenc: 'How Long Are You ?',
      description: 'This is an easy Question ...',
      time: 3,
      asnwers: [
        Answer(asnwer: '20 m', isCorrect: false),
        Answer(asnwer: '10 m', isCorrect: false),
        Answer(asnwer: '5 m', isCorrect: false),
        Answer(asnwer: '1.8 m', isCorrect: true)
      ])
];

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

Timer timer = Timer(Duration(seconds: 1), () {});
int start = 1;

class _QuizAppState extends State<QuizApp> {
  @override
  void initState() {
    void startTimer() {
      const oneSec = const Duration(seconds: 1);
      timer = new Timer.periodic(
        oneSec,
        (Timer timer) {
          if (start == 0) {
            setState(() {
              timer.cancel();
            });
          } else {
            setState(() {
              start++;
            });
          }
        },
      );
    }

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => QuestionlogicBloc(),
        child: Builder(
          builder: (context) {
            return Scaffold(
              body: PageView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) => Scaffold(
                  body: Center(
                    child: BlocListener<QuestionlogicBloc, QuestionlogicState>(
                      listener: (data, state) {
                        if (state is CorrectAnswer) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(" Great !"),
                            ),
                          );
                        }
                        else if(state is InCorrectAnswer){
ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(" So bad !"),
                            ),
                          );
                        }
                        else(){ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text(" Time out !"),
                            ),
                          );};
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(questions[index].questionSentenc),
                            subtitle: Text(questions[index].description),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 300,
                              height: 300,
                              child: GridView.builder(
                                itemCount: questions[index].asnwers.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisCount: 2),
                                itemBuilder: (context, ind) => InkWell(
                                  onTap: () {
                                    context.read
                                     <QuestionlogicBloc>().add(
                                      AnswerEvent(CorrectAnswer:  questions[index]. asnwers[ind].isCorrect, Time: questions[index].time,
                                      star: start,),);
                                       
                                  },
                                  child: Container(
                                      width: 50,
                                      height: 50,
                                      color: Colors.grey[200],
                                      child: Center(
                                          child: Text(questions[index]
                                              .asnwers[ind]
                                              .asnwer))),
                                ),
                              ),
                            ),
                          ),
                          // BlocBuilder<QuestionlogicBloc, QuestionlogicState>(
                          //   builder: (context, state) {
                          //     return Container();
                          //   },
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
