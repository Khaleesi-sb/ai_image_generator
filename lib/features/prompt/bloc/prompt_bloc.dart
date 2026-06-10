import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../utils/image_to_file.dart';
import '../repos/prompt_repo.dart';

part 'prompt_event.dart';
part 'prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(PromptInitial()) {
    on<PromptEnteredEvent>(handlePromptEnteredEvent);
    on<PromptInitialEvent>(handlePromptInitialEvent);
  }

  Future<void> handlePromptInitialEvent(PromptInitialEvent event, Emitter<PromptState> emit)async {
    final file = await getAssetFile();
    emit(PromptGeneratingImageSuccessState(file: file));
  }

  Future<void> handlePromptEnteredEvent(PromptEnteredEvent event, Emitter<PromptState> emit)async {
    emit(PromptGeneratingImageLoadState());
    File? file = await PromptRepo.generateImage(event.prompt);
    if(file!=null){
      emit(PromptGeneratingImageSuccessState(file: file));
    }else{
      emit(PromptGeneratingImageErrorState());
    }
  }
}
