import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cnfpasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Chatting Application Demo! \n By Anudeep Lohogaonkar.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextfield(
              obscureText: false,
              hintText: "E-mail",
              controller: _emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextfield(
              obscureText: false,
              hintText: "Name",
              controller: _nameController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextfield(
              obscureText: true,
              hintText: "Password",
              controller: _passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextfield(
              obscureText: true,
              hintText: "Confirm password",
              controller: _cnfpasswordController,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              text: "Register",
              onTap: () => register(context),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Already a member? ",
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .inversePrimary
                          .withOpacity(0.8),
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.8),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void register(BuildContext context) {
    final _auth = AuthService();

    if (_passwordController.text == _cnfpasswordController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
          _nameController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password don't match!"),
        ),
      );
    }
  }
}
