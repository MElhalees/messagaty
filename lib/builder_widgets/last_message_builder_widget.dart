import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../theme.dart';

class LastMessageBuilderWidget extends StatelessWidget {
  const LastMessageBuilderWidget({Key? key, required this.channel}) : super(key: key);

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return  BetterStreamBuilder<int>(
      stream: channel.state!.unreadCountStream,
      initialData: channel.state?.unreadCount ?? 0,
      builder: (context, count) {
        return BetterStreamBuilder<Message>(
          stream: channel.state!.lastMessageStream,
          initialData: channel.state!.lastMessage,
          builder: (context, lastMessage) {
            return Text(
              lastMessage.text ?? '',
              overflow: TextOverflow.ellipsis,
              style: (count > 0)
                  ? const TextStyle(
                fontSize: 12,
                color: AppColors.secondary,
              )
                  : const TextStyle(
                fontSize: 12,
                color: AppColors.textFaded,
              ),
            );
          },
        );
      },
    );
  }
}
