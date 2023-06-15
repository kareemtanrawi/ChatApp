import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constant.dart';
import '../models/messages.dart';
import '../widgets/chat_buble.dart';

class ChatPage extends StatelessWidget {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  static String id = 'ChatPage';
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessagesCollection);
  TextEditingController controller = TextEditingController();
  late final String email;
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(KCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: KPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/scholar.png', height: 65),
                  Text('Chat'),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBuble(
                              message: messagesList[index],
                            )
                          : ChatBubleforfriend(message: messagesList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({
                        KMessage: data,
                        KCreatedAt: DateTime.now(),
                        'id': email,
                      });
                      controller.clear();
                      _controller.animateTo(
                        0,
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      suffixIcon: Icon(
                        Icons.send,
                        color: KPrimaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: KPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text('Login>>>>>>');
        }
      },
    );
  }
}
