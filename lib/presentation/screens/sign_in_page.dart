import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noesatrip_app/data/providers/auth.dart';
import 'package:noesatrip_app/helpers/http_exception.dart';
import 'package:noesatrip_app/main.dart';
import 'package:noesatrip_app/presentation/screens/boarding_screen.dart';
import 'package:noesatrip_app/presentation/screens/sign_up_page.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _showErrorDialog(String? message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        titlePadding: const EdgeInsets.only(top: 6),
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        backgroundColor: Colors.white.withOpacity(0.86),
        elevation: 8,
        title: Text(
          'Error',
          style: GoogleFonts.poppins(
            color: const Color(0xFF3252DF),
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 0.8,
          ),
          textAlign: TextAlign.center,
        ),
        content: Text(
          message!,
          style: GoogleFonts.montserrat(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                isLoading = !isLoading;
              });
              Navigator.of(ctx).pop();
            },
            child: Text(
              'OK',
              style: GoogleFonts.poppins(
                color: const Color(0xFF3252DF),
                fontWeight: FontWeight.w700,
                fontSize: 14,
                letterSpacing: 0.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        isLoading = !isLoading;
      });
      _showErrorDialog("Invalid Email or Password");
      return;
    }
    _formKey.currentState!.save();
    try {
      // print(_authData);
      setState(() {
        isLoading = !isLoading;
      });
      await Provider.of<Auth>(context, listen: false)
          .login(
            _authData['email'],
            _authData['password'],
          )
          .then(
            (value) => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const MainPage(),
              ),
              ((route) => false),
            ),
          );
    } on HttpException catch (e) {
      _showErrorDialog(
        e.toString(),
      );
    } catch (e) {
      _showErrorDialog('Could not authenticate you');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BoardingScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF3252DF),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Login to your account",
                    style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Email',
                          style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF3252DF),
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email can't be empty";
                            } else if (!value.contains('@')) {
                              return "Email invalid";
                            }
                            // print(value);
                            return null;
                          },
                          onSaved: (value) {
                            _authData['email'] = value!;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Password',
                          style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF3252DF),
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.characters.length < 8) {
                              return "Password must be at least 8 characters";
                            }
                            // print('Password: $value');
                            return null;
                          },
                          onSaved: (value) {
                            _authData['password'] = value!;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () => isLoading ? null : _submit(),
                color: const Color(0xFF3252DF),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  isLoading ? ". . ." : "Login",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF3252DF),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
