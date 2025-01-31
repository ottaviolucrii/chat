import 'package:chat/components/auth_form.dart';
import 'package:chat/core/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      setState(() {
        _isLoading = true;
        if (formData.isLogin) {
          //login
        } else {
          //signup
        }
      });
    } catch (error) {
      print(error);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }

    setState(() {
      _isLoading = true;
    });
    print(formData.email);
    print(formData.password);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Center(
              child: SingleChildScrollView(
            child: AuthForm(onSubmit: _handleSubmit),
          )),
          if (_isLoading)
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
