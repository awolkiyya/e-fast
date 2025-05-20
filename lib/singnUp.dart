import 'package:flutter/material.dart';
import 'package:revirpod_ecommerce_project/login.dart';
class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  bool is_form_valid = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _roleController = TextEditingController();
  String selectedRole = "User";

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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                
                 AnimatedOpacity(
                duration:const Duration(milliseconds: 800),
                opacity: showImage ? 1.0 : 0.0,
                child:  Image.asset("assets/images/signUp.png",width: MediaQuery.sizeOf(context).width*0.5,),
              ),
                 Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const TextWidget(
                        color: Colors.black,
                        text: "Sign Up Now",
                        fontSize: 32),
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(children: [
                        TextFieldWidget(
                          controller: _emailController,
                          hintText: "Enter Name",
                          prefixIcon: const Icon(
                            Icons.abc,
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
                          controller: _emailController,
                          hintText: "Enter Email",
                          prefixIcon: const Icon(
                            Icons.email,
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
                          controller: _emailController,
                          hintText: "Enter Phone Number",
                          prefixIcon: const Icon(
                            Icons.phone,
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
                        const SizedBox(height: 10),
                        TextFieldWidget(
                          controller: _passwordController,
                          hintText: "Enter Confirem Password",
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
                        // here dropdown to select the option of registration
                        const SizedBox(height: 10),
                        CustomDropdownMenu(
                          label: "Select Registration Option",
                          items: const [
                            DropdownMenuEntry(value: "Admin", label: "Admin"),
                            DropdownMenuEntry(value: "User", label: "User"),
                        ],
                          selectedValue: selectedRole,
                          onChanged: (value) {
                            setState(() {
                              selectedRole = value.toString();
                            });
                          },
                          controller: _roleController,
                  
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
                                  :  Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const TextWidget(
                                color: Colors.white,
                                text: "Sign Up",
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
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                      },
                      child:const CustomRichText(firstText: "Have Accoun!",highlightedText: " Sign In",lastText: "",highlightedStyle: TextStyle(color: Colors.green,fontWeight: FontWeight.normal),))
                  ],
                ),
              ),
            
              ],
            ),
        ),
      ),
    );
  }


}


class CustomDropdownMenu extends StatelessWidget {
  final String label;
  final String? selectedValue;
  final String hintText;
  final List<DropdownMenuEntry<String>> items;
  final IconData leadingIcon;
  final void Function(String?) onChanged;
  final TextEditingController? controller;

  const CustomDropdownMenu({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.selectedValue,
    this.hintText = "",
    this.leadingIcon = Icons.arrow_drop_down,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      label: Text(label),
      initialSelection: selectedValue,
      hintText: hintText,
      controller: controller,
      onSelected: onChanged,
      leadingIcon: Icon(leadingIcon, color: Colors.black),
      width: MediaQuery.of(context).size.width,
      dropdownMenuEntries: items,
      textStyle: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5)),
    );
  }
}
