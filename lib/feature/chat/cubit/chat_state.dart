import 'package:project_iti/feature/models/chat_model.dart';

class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {
  final List<ChatModel> messages;

  ChatLoading(this.messages);

}

class ChatSuccess extends ChatState {
  final List<ChatModel> message;

  ChatSuccess({required this.message});
}

class ChatFailure extends ChatState {
  final String error;

  ChatFailure(this.error);
}


