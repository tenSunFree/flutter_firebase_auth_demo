import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_demo/common/common.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: <Widget>[
        Image.asset('assets/icon_sign_in.png'),
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(flex: 35, child: SizedBox()),
              buildEmailExpanded(),
              Expanded(
                  flex: 20, child: GestureDetector(onTap: () => _signIn())),
              Expanded(flex: 40, child: SizedBox()),
            ])
      ]),
    );
  }

  Expanded buildEmailExpanded() {
    return Expanded(
        flex: 25,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                          cursorColor: Color(0xFF000000),
                          controller: _emailController,
                          decoration: const InputDecoration(labelText: '電子信箱')),
                      TextFormField(
                          cursorColor: Color(0xFF000000),
                          controller: _passwordController,
                          decoration: const InputDecoration(labelText: '密碼'))
                    ]))));
  }

  void _signIn() async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      FirebaseUser user = result.user;
      if (user != null) {
        toast('登入成功');
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(Application.home);
      }
    } catch (error) {
      toast(error.message);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
