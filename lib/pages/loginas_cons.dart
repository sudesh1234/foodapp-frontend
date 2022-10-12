// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
 import 'package:foodapp/pages/static.dart';
 import 'package:shared_preferences/shared_preferences.dart';

class Loginas_cons extends StatefulWidget {
  const Loginas_cons({Key? key}) : super(key: key);

  @override
  State<Loginas_cons> createState() => _Loginas_consState();
}

class _Loginas_consState extends State<Loginas_cons> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _password = '';

  // late SharedPreferences preferences;
  //
  //
  // setConsumer() async {
  //   preferences=await SharedPreferences.getInstance();
  //
  //   final consumer_str=preferences.getString("consumer");
  //   // consumer=json.decode(consumer_str!);
  // }

  Future<void> _trySubmitForm() async {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      // setLog();
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_password);

      // await AuthService()
      //     .consumerLogin(_userEmail, _password)
      //     .then((val) async {
      //   if (val.data['success']) {
      //     token = val.data['token'];
      //     AuthService().getConsumerInfo(token).then((val2) async {
      //       if (val2.data['success']) {
      //         // preferences.setString("consumer", "${val2.data['consumer']}");
      //         consumer = val2.data['consumer'];

      //         print(consumer['address']);
      //         await Fluttertoast.showToast(
      //             msg: val2.data['msg'],
      //             toastLength: Toast.LENGTH_SHORT,
      //             gravity: ToastGravity.BOTTOM,
      //             backgroundColor: Colors.green,
      //             textColor: Colors.white,
      //             fontSize: 16.0);
      //         Navigator.pushNamed(context, '/navbar');
      //       }
      //     });
      //   }
      // });
    }
  }

  @override
  final cons_emailController = TextEditingController();
  final cons_passwordController = TextEditingController();
  late bool _passwordVisible;
  void initState() {
    _passwordVisible = false;
    // super.initState();
    // setConsumer();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/imgs/User Login.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 20),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios_new),
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/select', (route) => false);
                              },
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 40.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF5D5D5D)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: Text(
                          "as Consumer",
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 25.0,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF5D5D5D)),
                        ),
                      ),
                      Container(
                        child: Column(children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: const Offset(10, 12),
                                ),
                              ],
                            ),
                            // color: Colors.transparent,
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                fillColor: Colors.white,
                                filled: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintText: 'Enter Email Address',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                prefixIcon:
                                    const Icon(Icons.mail, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: 'Email Address',
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your email address';
                                }

                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              onChanged: (value) => _userEmail = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: const Offset(10, 12),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: cons_passwordController,
                              obscureText: !_passwordVisible,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                fillColor: Colors.white,
                                filled: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintText: 'Enter Password',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: 'Password',
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              onChanged: (value) => _password = value,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FlatButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => ResetPwd_1()),
                                  // );
                                },
                                child: Text(
                                  'Forgot Password?',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xFF5D5D5D),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      Center(
                        child: ElevatedButton(
                          //onPressed: () {},
                          onPressed: _trySubmitForm,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 60.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text('Don\'t have an account?'),
                            ),
                            FlatButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => RegUser()),
                                // );
                              },
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blueAccent,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: MediaQuery.of(context).size.height * 0.35,
                  //   child: Stack(
                  //     children: [
                  //       Positioned(
                  //         bottom: -100,
                  //         left: 0,
                  //         child: Container(
                  //           width: MediaQuery.of(context).size.width,
                  //           height: MediaQuery.of(context).size.height * 0.5,
                  //           child: Image.asset(
                  //             "assets/user_pic.jpg",
                  //             fit: BoxFit.fitWidth,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
