import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/helper/data_format.dart';
import 'package:project_iti/feature/models/chat_model.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.chatMessage});

  final ChatModel chatMessage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: chatMessage.isUser
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: chatMessage.isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!chatMessage.isUser)
            CircleAvatar(
              radius: 25.r,
              backgroundImage: const AssetImage("assets/images/Ai_image.avif"),
            ),
          SizedBox(width: 8.w),

          Flexible(
            child: Container(
              constraints: BoxConstraints(maxWidth: 280.w),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: chatMessage.isUser
                    ? AppColor.primaycolor.withValues(alpha: .15)
                    : Colors.white,
                borderRadius: chatMessage.isUser
                    ? BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                      )
                    : BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r),
                        bottomLeft: Radius.circular(20.r),
                      ),
              ),
              child: Column(
                children: [
                  Text(
                    chatMessage.message,
                    style: TextStyle(fontSize: 15.sp, height: 1.6),
                  ),
                  SizedBox(height: 8.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      DateFormatHelper.formatTime(chatMessage.createdAt),
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
