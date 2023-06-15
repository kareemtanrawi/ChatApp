import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/pages/Login_Screen.dart';
import 'package:chatapp/pages/chat-page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        ChatPage.id: (context) => ChatPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
    );
  }
}
