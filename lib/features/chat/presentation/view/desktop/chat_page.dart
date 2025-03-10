import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/core/utils/extension.dart';
import 'package:elmer/features/chat/presentation/notifier/chat_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatNotifier>(builder: (context, notifier, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Sidebar
                  Container(
                    width: 100.w,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: AppColors.appBkGrey50,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/pngs/elmer_logo.png',
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        40.toColumnSpace(),
                        ...notifier.categorizedChats.entries.map((entry) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                entry.key,
                                style: AppTextStyle.b4.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                              10.toColumnSpace(),
                              ...entry.value.map((chat) {
                                int chatIndex = notifier.chats.indexOf(chat);
                                return GestureDetector(
                                  onTap: () =>
                                      notifier.selectDiscussion(chatIndex),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 5),
                                    margin: EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: notifier.selectedIndex == chatIndex
                                          ? Colors.white
                                          : null,
                                    ),
                                    child: Text(
                                      chat.chatTitle ?? '',
                                      style: AppTextStyle.b4.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),

                  // Main Content (Scrollable)

                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: notifier.selectedIndex != null &&
                                  notifier.chats.isNotEmpty &&
                                  notifier.selectedIndex! <
                                      notifier.chats.length
                              ? SingleChildScrollView(
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: notifier
                                        .chats[notifier.selectedIndex ?? 0]
                                        .messages!
                                        .map((message) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Text(
                                                message.content ?? '',
                                                style: AppTextStyle.b4.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    'Select a chat to view messages',
                                    style: AppTextStyle.b4.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 20,
                          ),
                          width: MediaQuery.of(context).size.width - 200.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            border: Border.all(
                              color: AppColors.appBkGrey100,
                              width: 0.5,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 40,
                                child: TextField(
                                  controller: _textController,
                                  style: AppTextStyle.b4.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Ask anything',
                                    hintStyle: AppTextStyle.b4.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        border: Border.all(
                                          color: AppColors.appBkGrey200,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                    ),
                                    onPressed: () {},
                                    constraints: BoxConstraints(
                                      minWidth: 40,
                                      minHeight: 40,
                                    ),
                                    padding: EdgeInsets.zero,
                                    iconSize: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: AppColors.appBkGrey100,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/svgs/internet.svg',
                                              height: 10.h,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              'Search',
                                              style: AppTextStyle.b4.copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  2.toRowSpace(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: AppColors.appBkGrey100,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/svgs/microscope.svg',
                                              height: 10.h,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              'Deep research',
                                              style: AppTextStyle.b4.copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  2.toRowSpace(),
                                  Container(
                                    padding: EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: AppColors.appBkGrey200,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Icon(Icons.more_horiz,
                                        color: Colors.grey),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.multitrack_audio_sharp,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),

                  Container(
                    width: 100.w,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          20.toColumnSpace(),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 0.5,
                                color: AppColors.appBkGrey200,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Cost Reduction Strategies',
                                style: AppTextStyle.b4.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          8.toColumnSpace(),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 0.5,
                                color: AppColors.appBkGrey200,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Revenue Optimization',
                                style: AppTextStyle.b4.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          8.toColumnSpace(),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 0.5,
                                color: AppColors.appBkGrey200,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Revenue Optimization',
                                style: AppTextStyle.b4.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          8.toColumnSpace(),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 0.5,
                                color: AppColors.appBkGrey200,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Alternate Funding Strategies',
                                style: AppTextStyle.b4.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          20.toColumnSpace(),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 100,
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      width: 0.5,
                                      color: AppColors.elmerGreen,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  height: 100,
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      width: 0.5,
                                      color: AppColors.elmerGreen,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          8.toColumnSpace(),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 100,
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      width: 0.5,
                                      color: AppColors.elmerGreen,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  height: 100,
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      width: 0.5,
                                      color: AppColors.elmerGreen,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          8.toColumnSpace(),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 100,
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      width: 0.5,
                                      color: AppColors.elmerGreen,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  height: 100,
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      width: 0.5,
                                      color: AppColors.elmerGreen,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          8.toColumnSpace(),
                          Container(
                            height: 100,
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 0.5,
                                color: AppColors.elmerGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ',
              style: AppTextStyle.b4.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              )),
          Expanded(
            child: Text(text,
                style: AppTextStyle.b4.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                )),
          ),
        ],
      ),
    );
  }
}
