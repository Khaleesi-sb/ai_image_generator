import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/prompt/bloc/prompt_bloc.dart';
import 'features/prompt/ui/create_prompt_screen.dart';

Future<void> main() async{
  await dotenv.load(fileName: ".env");
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PromptBloc>(
      create: (context) => PromptBloc(),
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.grey.shade900,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey.shade900,
            elevation: 0,
          ),
        ),
        home: CreatePromptScreen(),
      ),
    );
  }
}
