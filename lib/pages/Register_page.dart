import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constant.dart';
import '../helper/show_snack_par.dart';
import '../widgets/custom_botton.dart';
import '../widgets/custom_text_feild.dart';
import 'chat-page.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 11,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Spacer(
                  flex: 2,
                ),
                Image.asset('assets/images/scholar.png'),
                Text(
                  'Scholar Chat',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Row(
                  children: [
                    Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFeild(
                  onChange: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFeild(
                  onChange: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await RegisterUser();
                        Navigator.pushNamed(context, ChatPage.id);
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          showSnackPar(context, 'weak password');
                        } else if (ex.code == 'email-already-in-use') {
                          showSnackPar(context, 'email already exit');
                        }
                      } catch (ex) {
                        showSnackPar(context, 'there is an error');
                      }

                      isLoading = false;
                      setState(() {});
                    } else {}
                  },
                  text: 'REGISTER',
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account?  ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Color(0xffc7ede6),
                        ),
                      ),
                    )
                  ],
                ),
                Spacer(
                  flex: 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }

  Future<void> RegisterUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
