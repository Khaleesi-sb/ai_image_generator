import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_generator/features/prompt/bloc/prompt_bloc.dart';

class CreatePromptScreen extends StatefulWidget {
  const CreatePromptScreen({super.key});

  @override
  State<CreatePromptScreen> createState() => _CreatePromptScreenState();
}

class _CreatePromptScreenState extends State<CreatePromptScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    PromptBloc promptBloc = BlocProvider.of<PromptBloc>(context);
    promptBloc.add(PromptInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Generate Images")),
      body: BlocBuilder<PromptBloc, PromptState>(
        builder: (context, state) {
          if (state is PromptGeneratingImageLoadState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PromptGeneratingImageSuccessState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(state.file),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 240,
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter your prompt here",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _textController,
                        cursorColor: Colors.deepPurple,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: "Enter your prompt here",
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 48,
                        width: double.maxFinite,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (_textController.text.isNotEmpty) {
                              BlocProvider.of<PromptBloc>(context).add(
                                PromptEnteredEvent(
                                  prompt: _textController.text,
                                ),
                              );
                            }
                          },
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            backgroundColor: WidgetStateProperty.all(
                              Colors.deepPurple,
                            ),
                          ),
                          icon: Icon(Icons.generating_tokens),
                          label: Text("Generate"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          if (state is PromptGeneratingImageErrorState) {
            return Center(child: Text("Something went wrong"));
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
