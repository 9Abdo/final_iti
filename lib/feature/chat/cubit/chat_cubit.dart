import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_iti/feature/chat/cubit/chat_state.dart';
import 'package:project_iti/feature/models/chat_model.dart';
import 'package:project_iti/feature/services/chat_bot_services.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.chatBotServices) : super(ChatInitial()) {
    messages.add(
      ChatModel(
        message:
            "Hello! 👋 Welcome to our shopping assistant.\nI can help you find products\ncheck prices and details\nmanage your cart\nand explore payment methods.\nHow can I help you today?",
        isUser: false,
      ),
    );
  }
  final ChatBotServices chatBotServices;
  final List<ChatModel> messages = [];

  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty) return;
    messages.add(ChatModel(message: message, isUser: true));
    emit(ChatSuccess(message: messages));
    emit(ChatLoading(messages));
    try {
      final answer = await chatBotServices.postMessage(message: message);
      messages.add(ChatModel(message: answer, isUser: false));
      emit(ChatSuccess(message: messages));
    } catch (e) {
      emit(ChatFailure(e.toString()));
    }
  }
}
