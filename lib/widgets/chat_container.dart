import 'package:flutter/material.dart';

class ChatContainer extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatContainer({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isCurrentUser ? Colors.black : Colors.red),
    );
  }
}
