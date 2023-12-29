// ignore_for_file: file_names

import 'package:chat_app/data/network/services/database_adapter.dart';
import 'package:chat_app/data/network/services/hive_service.dart';
import 'package:chat_app/modules/Chat/ChatController.dart';
import 'package:chat_app/routes/app_pages.dart';
import 'package:chat_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Chat extends GetView<ChatController> {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    return Obx(
      () => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: controller.infoLoading.value
              ? const CircularProgressIndicator(
                  color: AppColors.BLACK,
                )
              : Text(
                  controller.userInfo.first.girlName,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.BLACK,
                      ),
                ),
          actions: [
            Bounceable(
              onTap: () {
                final DatabaseAdapter adapter = HiveService();
                adapter.deleteAuth();
                Get.offAllNamed(Routes.SIGNIN);
              },
              child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: const Icon(
                  Icons.logout,
                  color: AppColors.BLACK,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              top: 0,
              child: controller.infoLoading.value
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        color: AppColors.ZIMA_BLUE,
                      ),
                    )
                  : Image.network(
                      controller.userInfo.first.imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            color: AppColors.ZIMA_BLUE,
                          ),
                        );
                      },
                    ),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 12, // default 6
                    child: ListView.builder(
                      controller: controller.scrollController,
                      padding: EdgeInsets.only(
                        top: 1.h,
                      ),
                      physics: const ClampingScrollPhysics(),
                      itemCount: controller.messages.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return controller.messages[index];
                      },
                    ),
                  ),
                  controller.msgLoading.value
                      ? _CustomLoadingMsg(
                          girlName: controller.userInfo.first.girlName,
                        )
                      : const SizedBox.shrink(),
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 3.w,
                            top: .5.h,
                            bottom: .5.h,
                          ),
                          child: TextFormField(
                            minLines: 1,
                            maxLines: 5,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            onFieldSubmitted: controller.msgLoading.value
                                ? null
                                : (value) {
                                    controller.handleChat();
                                  },
                            cursorColor: AppColors.BLACK,
                            textInputAction: TextInputAction.send,
                            textCapitalization: TextCapitalization.sentences,
                            style: Theme.of(context).textTheme.labelSmall,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 1.5.h,
                                horizontal: 3.w,
                              ),
                              fillColor: AppColors.WHITE.withOpacity(.2),
                              filled: true,
                              disabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.WHITE),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.WHITE),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.WHITE),
                              ),
                            ),
                            onChanged: (value) {
                              controller.msgValue.value = value;
                            },
                            controller: controller.msg,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Bounceable(
                          onTap: controller.msgLoading.value
                              ? null
                              : () async {
                                  controller.handleChat();
                                },
                          child: CircleAvatar(
                            radius: 16.sp,
                            backgroundColor: AppColors.ZIMA_BLUE,
                            child: Icon(
                              Icons.send,
                              color: AppColors.WHITE,
                              size: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomLoadingMsg extends StatelessWidget {
  final String girlName;
  const _CustomLoadingMsg({
    required this.girlName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(child: Icon(Icons.person)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12.sp,
              ),
              color: AppColors.ZIMA_BLUE.withOpacity(.5),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 3.h,
            ),
            margin: EdgeInsets.only(
              bottom: 5.h,
              left: 5.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  girlName,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 200.w,
                  ),
                  child: LoadingAnimationWidget.waveDots(
                    color: AppColors.BLACK,
                    size: 15.sp,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
