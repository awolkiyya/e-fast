import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revirpod_ecommerce_project/singnUp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool is_form_valid = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool showImage = false;

  @override
  void initState() {
    super.initState();
    // Trigger animation after build
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        showImage = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration:const Duration(milliseconds: 800),
              opacity: showImage ? 1.0 : 0.0,
              child: const LoginImage(),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const TextWidget(
                      color: Colors.black,
                      text: "Sign in to continue",
                      fontSize: 32),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFieldWidget(
                        controller: _emailController,
                        hintText: "Enter Phone Number or Email",
                        prefixIcon: const Icon(
                          Icons.verified_user,
                          color: Colors.black,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number or email';
                          }
                          return null;
                        },
                        onChange: (value) {
                          setState(() {
                            is_form_valid = _emailController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFieldWidget(
                        controller: _passwordController,
                        hintText: "Enter Password",
                        prefixIcon: const Icon(
                          Icons.password_rounded,
                          color: Colors.black,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter correct password';
                          }
                          return null;
                        },
                        onChange: (value) {
                          setState(() {
                            is_form_valid = _emailController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty;
                          });
                        },
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // proceed login
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.sizeOf(context).width,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: !is_form_valid
                                ? Colors.black.withOpacity(0.2)
                                : Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const TextWidget(
                              color: Colors.white,
                              text: "SignIn",
                              fontSize: 16),
                        ),
                      ),
                    ]),
                  ),
                  // here is the best signup text 
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SingUp()),
                        );
                    },
                    child: CustomRichText(firstText: "Don't Have Accoun!",highlightedText: "Sign Up",lastText: "",highlightedStyle: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),))
                ],
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final Color hintcolor;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.onChange,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.hintcolor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChange,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            TextStyle(color: hintcolor.withOpacity(0.4), fontSize: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight = FontWeight.normal;
  final TextAlign textAlign = TextAlign.center;
  final TextOverflow textOverflow = TextOverflow.visible;

  const TextWidget({
    super.key,
    required this.color,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/login.png",
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
    );
  }
}
// here is the richtext component
class CustomRichText extends StatelessWidget {
  final String firstText;
  final String highlightedText;
  final String lastText;
  final TextStyle? normalStyle;
  final TextStyle? highlightedStyle;

  const CustomRichText({
    super.key,
    required this.firstText,
    required this.highlightedText,
    required this.lastText,
    this.normalStyle,
    this.highlightedStyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: firstText, style: normalStyle ?? DefaultTextStyle.of(context).style),
          TextSpan(text: highlightedText, style: highlightedStyle ?? const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          TextSpan(text: lastText, style: normalStyle ?? DefaultTextStyle.of(context).style),
        ],
      ),
    );
  }
}
