import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmobile/api/api.dart';
import 'package:testmobile/api/api_implement.dart';
import 'package:testmobile/cubit/main_cubit.dart';
import 'package:testmobile/cubit/main_state.dart';

import 'api/log.dart';
import 'enum/LoadStatus.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Api>(
      create: (context) => ApiImpleMent(),
      child: Provider(),
    );
  }
}
class Provider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(context.read<Api>())..getData()  ,
      child: Main(),
    );
  }
}


class Main extends StatelessWidget {
  const Main({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Demo'),
          ),
          body: BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              if(LoadStatus.Loading == state.loadStatus){
                return const Center(child: CircularProgressIndicator());
            } else if (LoadStatus.Done == state.loadStatus) {
              return ListView.builder(
                itemCount: state.student.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.student[index].fullName!),
                    subtitle: Text(state.student[index].numberID!),
                  );
                },
              );
            } else {
              return const Center(child: Text("Error"));
            }
            }
          ),
  
          ),
    );
  }
}
