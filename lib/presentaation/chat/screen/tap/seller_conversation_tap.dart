import 'package:commmercial_directory_seller/presentaation/chat/conversationSupport_bloc/conversation_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/chat/conversation_customer_bloc/conversation_customer_bloc.dart';
import 'package:commmercial_directory_seller/presentaation/widgets/error_widget.dart'
    as error_widget;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/fillters/filter.dart';
import '../../../widgets/network_error_widget.dart';
import '../../widget/chat_item.dart';
import '../../widget/shimmer_widget.dart';

class SellerConversationTap extends HookWidget {
  const SellerConversationTap({super.key});

  @override
  Widget build(BuildContext context) {
    final scroll = useScrollController();
    context.read<ConversationCustomerBloc>().add(
        ConversationCustomerEvent.loadConversationSeller(filter: Filter()));
    return BlocBuilder<ConversationCustomerBloc, ConversationCustomerState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Column(
            children: [
              ShimmerWidget(),
              ShimmerWidget(),
              ShimmerWidget(),
              ShimmerWidget(),
              ShimmerWidget(),
              ShimmerWidget(),
              ShimmerWidget(),
              ShimmerWidget(),
            ],
          ),
          empty: () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "no_chat_found",
                style: TextStyle(fontSize: 18),
              ).tr()
            ],
          ),
          error: (error) => (error).when(
              networkError: (message) => NetworkErrorWidget(tryAgain: () {
                    context.read<ConversationCustomerBloc>().add(
                        ConversationCustomerEvent.loadConversationSeller(
                            filter: Filter()));
                  }),
              other: (message) => error_widget.ErrorWidget(
                    tryAgain: () {
                      context.read<ConversationCustomerBloc>().add(
                          ConversationCustomerEvent.loadConversationSeller(
                              filter: Filter()));
                    },
                  )),
          loaded: (conversation, isLastPage) => CustomScrollView(
            controller: scroll
              ..addListener(
                () {
                  if (scroll.position.pixels ==
                      scroll.position.maxScrollExtent) {
                    if (!context.read<ConversationBloc>().isLastPage) {
                      context.read<ConversationBloc>().add(
                            ConversationEvent.loadMore(
                              filter: Filter(),
                            ),
                          );
                    }
                  }
                },
              ),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => ConversationItem(
                          conversation: conversation[index],
                          type: "support",
                        ),
                    childCount: conversation.length),
              ),
              if (!isLastPage)
                const SliverToBoxAdapter(
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
            ],
          ),
        );
      },
    );
  }
}
