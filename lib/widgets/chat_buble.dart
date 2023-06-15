import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/messages.dart';

class ChatBuble extends StatelessWidget {
  ChatBuble({required this.message});
  Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(
          left: 16,
          top: 24,
          bottom: 24,
          right: 24,
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: KPrimaryColor,
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ChatBubleforfriend extends StatelessWidget {
  ChatBubleforfriend({required this.message});
  Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(
          left: 16,
          top: 24,
          bottom: 24,
          right: 24,
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: Color(0xff006d84),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
