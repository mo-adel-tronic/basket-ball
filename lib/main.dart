import 'package:basketball_counter_app/cubit/counter_cubit.dart';
import 'package:basketball_counter_app/cubit/counter_states.dart';
import 'package:basketball_counter_app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(pointsCounter());
}

class pointsCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int teamA = 0;
    int teamB = 0;
    return BlocConsumer<CounterCubit, CounterStates>(
      builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text('Points Counter'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myText('Team A'),
                        myText('$teamA', fontSize: 150),
                        elevatedButton(textBtn: 'Add 1 Point', 
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).setTeamCounter(team: 'A');
                        }),
                        elevatedButton(textBtn: 'Add 2 Point', 
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).setTeamCounter(team: 'A', point: 2);
                        }),
                        elevatedButton(textBtn: 'Add 3 Point', 
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).setTeamCounter(team: 'A', point: 3);
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 500,
                    child: VerticalDivider(
                      indent: 50,
                      endIndent: 50,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myText('Team B'),
                        myText('$teamB', fontSize: 150),
                        elevatedButton(textBtn: 'Add 1 Point', 
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).setTeamCounter(team: 'B');
                        }),
                        elevatedButton(textBtn: 'Add 2 Point', 
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).setTeamCounter(team: 'B', point: 2);
                        }),
                        elevatedButton(textBtn: 'Add 3 Point', 
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).setTeamCounter(team: 'B', point: 3);
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              elevatedButton(textBtn: 'Reset', 
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).resetCounter();
                        }),
            ],
          ),
        );
    }, 
    listener: (context, state) {
      switch (state) {
        case CounterStateA():
          teamA = BlocProvider.of<CounterCubit>(context).teamAPoints;
        case CounterStateB():
          teamB = BlocProvider.of<CounterCubit>(context).teamBPoints;
        case CounterStateReset():
          teamA = BlocProvider.of<CounterCubit>(context).teamAPoints;
          teamB = BlocProvider.of<CounterCubit>(context).teamBPoints;
      }
    });
  }
}

