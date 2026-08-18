import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/widgets/custom_text_field.dart';
import 'package:project_iti/feature/chat/cubit/chat_cubit.dart';
import 'package:project_iti/feature/chat/cubit/chat_state.dart';
import 'package:project_iti/feature/chat/widget/chat_buble.dart';
import 'package:project_iti/feature/chat/widget/loading_bubble.dart';

class Chatbotpageview extends StatefulWidget {
  const Chatbotpageview({super.key});

  @override
  State<Chatbotpageview> createState() => _ChatbotpageviewState();
}

class _ChatbotpageviewState extends State<Chatbotpageview> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!scrollController.hasClients) return;

      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Chat AI",
              style: AppStyle.titleApp.copyWith(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: AppColor.primaycolor,
          ),
          body: Column(
            children: [
              SizedBox(height: 20.h),

              Expanded(
                child: BlocConsumer<ChatCubit, ChatState>(
                  listener: (context, state) {
                    if (state is ChatLoading || state is ChatSuccess) {
                      scrollToBottom();
                    }
                  },

                  builder: (context, state) {
                    if (state is ChatFailure) {
                      return Center(child: Text(state.error));
                    }

                    final messages = context.read<ChatCubit>().messages;

                    return ListView.builder(
                      controller: scrollController,
                      itemCount:
                          messages.length + (state is ChatLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == messages.length && state is ChatLoading) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: LoadingBubble(),
                          );
                        }

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ChatBuble(chatMessage: messages[index]),
                        );
                      },
                    );
                  },
                ),
              ),

              CustomTextField(
                hint: "Type Your Message",
                controller: controller,
                onFieldSubmitted: (value) {
                  if (value.trim().isEmpty) return;

                  context.read<ChatCubit>().sendMessage(value.trim());

                  controller.clear();
                },
                icon: IconButton(
                  onPressed: () {
                    final message = controller.text.trim();

                    if (message.isEmpty) return;

                    context.read<ChatCubit>().sendMessage(message);

                    controller.clear();
                  },
                  icon: Icon(
                    Icons.send,
                    color: AppColor.primaycolor,
                    size: 32.sp,
                  ),
                ),
              ),

              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
