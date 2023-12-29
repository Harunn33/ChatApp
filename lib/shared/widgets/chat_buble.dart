import 'package:chat_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ChatBuble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isAI;
  final Color avatarColor;
  final Color messageBubbleColor;
  final bool isMessageLoading;
  const ChatBuble({
    super.key,
    required this.text,
    required this.sender,
    this.avatarColor = Colors.transparent,
    this.isAI = false,
    required this.messageBubbleColor,
    this.isMessageLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
      ),
      child: isAI
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(child: Icon(Icons.person)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12.sp,
                    ),
                    color: messageBubbleColor.withOpacity(.5),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  margin: EdgeInsets.only(
                    bottom: 10.h,
                    left: 5.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sender,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 200.w,
                        ),
                        margin: EdgeInsets.only(
                          top: 5.h,
                        ),
                        child: isMessageLoading
                            ? LoadingAnimationWidget.waveDots(
                                color: AppColors.BLACK,
                                size: 20.sp,
                              )
                            : Text(
                                text,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                      )
                    ],
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12.sp,
                    ),
                    color: messageBubbleColor,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  margin: EdgeInsets.only(
                    bottom: 10.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        sender,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 200.w,
                        ),
                        margin: EdgeInsets.only(top: 5.h),
                        child: Text(
                          text,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      )
                    ],
                  ),
                ),
                const Stack(alignment: Alignment.center, children: [
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.person)),
                ]),
              ],
            ),
    );
  }
}
