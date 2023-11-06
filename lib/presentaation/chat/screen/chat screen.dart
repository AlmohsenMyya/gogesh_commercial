import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:commmercial_directory_seller/Utils.dart';
import 'package:commmercial_directory_seller/domain/entities/chat_entity/conversation_response.dart';
import 'package:commmercial_directory_seller/presentaation/chat/chat_bloc/chat_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/error_widget.dart'
    as error_widget;
import 'package:commmercial_directory_seller/presentaation/widgets/network_error_widget.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/profile_avatar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../app/locator.dart';
import '../../../app/theme.dart';
import '../../../core/fillters/filter.dart';
import '../../../domain/request/chat/chat_request.dart';
import '../../main/bloc/messages_pill_cubit.dart';
import '../widget/message_bubble.dart';

String? attachement;

class ChatScreen extends HookWidget {
  const ChatScreen({required this.conversation, this.type, Key? key})
      : super(key: key);
  final ConversationEntity conversation;
  final String? type;

  @override
  Widget build(BuildContext context) {
    final scroll = useScrollController();
    final messageController = useTextEditingController();
    return BlocProvider<ChatBloc>(
      create: (context) => ChatBloc(
          conversationId: conversation.id,
          getChatUseCase: sl(),
          unreadMessagesCountUseCase: sl(),
          sendMessageUseCase: sl(),
          type: type ?? "chat")
        ..add(
          ChatEvent.loadChat(
            filter: Filter(id: conversation.id, page: 1, type: type),
          ),
        ),
      child: BlocListener<ChatBloc, ChatState>(
        listener: (context, state) {
          state.whenOrNull(
            errorSend: (error) {
              AlertController.show(
                  "", "there_is_no_internet_connection".tr(), TypeAlert.error);
            },
            imageLoaded: (image) {
              attachement = image!.path;
            },
            initial: () => attachement = null,
            sendingMessage: (id) => attachement = null,
            loaded: (chat, pageKey, lastPage) =>
                context.read<MessagesPillCubit>().updateMessageCount(false),
          );
        },
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(conversation.name ?? ""),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        CustomScrollView(
                          controller: scroll
                            ..addListener(() {
                              if (scroll.position.pixels ==
                                  scroll.position.maxScrollExtent) {
                                if (!context.read<ChatBloc>().lastPage) {
                                  context.read<ChatBloc>().add(
                                      ChatEvent.loadMore(filter: Filter()));
                                }
                              }
                            }),
                          physics: const BouncingScrollPhysics(),
                          reverse: true,
                          slivers: [
                            BlocBuilder<ChatBloc, ChatState>(
                              buildWhen: (previous, current) =>
                                  current.maybeWhen(
                                orElse: () => false,
                                loaded: (chat, pageKey, lastPage) => true,
                                error: (error) => true,
                                empty: () => true,
                                loading: () => true,
                              ),
                              builder: (context, state) {
                                return state.maybeWhen(
                                  orElse: () => const SliverToBoxAdapter(
                                      child: SizedBox()),
                                  loading: () => const SliverToBoxAdapter(
                                      child: Center(
                                    child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2),
                                    ),
                                  )),
                                  loaded: (chat, pageKey, lastPage) =>
                                      SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                        (context, index) => MessageBubble(
                                              message: chat[index],
                                            ),
                                        childCount: chat.length),
                                  ),
                                  error: (error) => error.when(
                                      networkError: (message) =>
                                          SliverToBoxAdapter(child:
                                              NetworkErrorWidget(tryAgain: () {
                                            context.read<ChatBloc>().add(
                                                ChatEvent.loadChat(
                                                    filter: Filter(
                                                        id: conversation.id,
                                                        page: 1,
                                                        type: type)));
                                          })),
                                      other: (message) => SliverToBoxAdapter(
                                            child: error_widget.ErrorWidget(
                                              tryAgain: () {
                                                context.read<ChatBloc>().add(
                                                    ChatEvent.loadChat(
                                                        filter: Filter(
                                                            id: conversation.id,
                                                            page: 1,
                                                            type: type)));
                                              },
                                            ),
                                          )),
                                  empty: () => const SliverToBoxAdapter(
                                      child: SizedBox()),
                                );
                              },
                            ),
                            BlocBuilder<ChatBloc, ChatState>(
                              builder: (context, state) {
                                return state.maybeWhen(
                                  orElse: () => const SliverToBoxAdapter(
                                      child: SizedBox()),
                                  loadingMore: () => const SliverToBoxAdapter(
                                    child: Center(
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SliverToBoxAdapter(
                              child: SizedBox(
                                height: 7.h,
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        conversation.avatar.toImageOrEmpty(),
                                    imageBuilder: (_, imageProvider) {
                                      return Container(
                                        width: 15.h,
                                        height: 15.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.fill)),
                                        // child: Align(
                                        //   alignment: Alignment.bottomLeft,
                                        //   child: Container(
                                        //     height: 1.1.h,
                                        //     width: 1.1.h,
                                        //     decoration: const BoxDecoration(
                                        //       shape: BoxShape.circle,
                                        //       color: Colors.green,
                                        //     ),
                                        //   ),
                                        // ),
                                      );
                                    },
                                    errorWidget: (context, url, error) =>
                                        ProfileAvatar(
                                            width: 15.h,
                                            height: 15.h,
                                            style:
                                                const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 40),
                                            firstName: conversation.name
                                                    ?.split(" ")[0] ??
                                                " ",
                                            lastName: conversation.name
                                                    ?.split(" ")[1] ??
                                                " "),
                                    placeholder: (_, __) => SizedBox(
                                      width: 15.h,
                                      height: 15.h,
                                      child: const CircularProgressIndicator(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    conversation.name ?? "",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Builder(builder: (context) {
                          return BlocBuilder<ChatBloc, ChatState>(
                            buildWhen: (previous, current) {
                              return current.maybeWhen(
                                orElse: () => false,
                                imageLoaded: (file) => true,
                                messageSent: () => true,
                                sendingMessage: (id) => true,
                                initial: () => true,
                              );
                            },
                            builder: (context, state) => state.maybeWhen(
                              orElse: () => const SizedBox(),
                              initial: () => const SizedBox(),
                              imageLoaded: (image) => Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: 12.h,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey.shade300,
                                        ),
                                        child: Image.file(
                                          File(
                                            image!.path,
                                          ),
                                          height: 10.h,
                                          width: 10.h,
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            context
                                                .read<ChatBloc>()
                                                .add(const ChatEvent.back());
                                            attachement = null;
                                          },
                                          child: const Icon(Icons.cancel),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  Builder(builder: (context) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: messageController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                            ),
                            cursorColor: AppTheme.secondaryColor,
                            cursorHeight: 20,
                            maxLines: null,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  // title: Text('Alert'),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20)),
                                        onPressed: () async {
                                          context.read<ChatBloc>().add(
                                              const ChatEvent.uploadImage(
                                                  source: ImageSource.gallery));
                                          context.pop();
                                        },
                                        child: Row(
                                          children: [
                                            const Text('Gallery').tr(),
                                            const SizedBox(width: 5),
                                            const Icon(Icons.photo),
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20)),
                                        onPressed: () async {
                                          context.read<ChatBloc>().add(
                                              const ChatEvent.uploadImage(
                                                  source: ImageSource.camera));
                                          context.pop();
                                        },
                                        child: Row(
                                          children: [
                                            const Text('Camera').tr(),
                                            const SizedBox(width: 5),
                                            const Icon(Icons.camera),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.attach_file,
                            color: AppTheme.secondaryColor,
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              messageController.text.isEmpty &&
                                      attachement == null
                                  ? null
                                  : context.read<ChatBloc>().add(
                                        ChatEvent.sendMessage(
                                          request: SendMessageRequest(
                                              contactId: conversation.id ?? 0,
                                              message: messageController.text,
                                              attachement: attachement,
                                              type: type),
                                        ),
                                      );
                              // contex.read<ChatBloc>().add(
                              //       const ChatEvent.back(),
                              //     );
                              messageController.clear();
                            },
                            icon: const Icon(
                              Icons.send_rounded,
                              color: AppTheme.secondaryColor,
                            ))
                      ],
                    );
                  })
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
