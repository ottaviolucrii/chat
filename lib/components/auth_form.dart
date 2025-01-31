import 'dart:io';

import 'package:chat/components/user_image_picker.dart';
import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final Function(AuthFormData) onSubmit;

  const AuthForm({super.key, required this.onSubmit});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _handleImagePick(File image) {
    _formData.image = image;
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('An error occurred!'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Okay'),
          )
        ],
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (_formData.image == null && _formData.isSignup) {
      return _showErrorDialog('Please pick an image');
    }

    widget.onSubmit(_formData);
    _formKey.currentState!.save();

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              if (_formData.isSignup) UserImagePicker(onImagePick: _handleImagePick,),
              if (_formData.isSignup)
                TextFormField(
                  key: const ValueKey('name'),
                  keyboardType: TextInputType.name,
                  initialValue: _formData.name,
                  onChanged: (name) {
                    _formData.name = name;
                  },
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (_name) {
                    final name = _name!;
                    if (name.trim().length < 3) {
                      return 'Name must be at least 3 characters long';
                    }
                    return null;
                  },
                ),
              TextFormField(
                key: const ValueKey('email'),
                keyboardType: TextInputType.emailAddress,
                initialValue: _formData.email,
                onChanged: (email) {
                  _formData.name = email;
                },
                decoration: const InputDecoration(labelText: 'Email address'),
                validator: (_email) {
                  final email = _email!;
                  if (email.isEmpty || !email.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: const ValueKey('password'),
                obscureText: true,
                initialValue: _formData.password,
                onChanged: (password) {
                  _formData.name = password;
                },
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (_password) {
                  final password = _password!;
                  if (password.isEmpty || password.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _submit,
                child: Text(_formData.isLogin ? 'Login' : 'Signup'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _formData.toggleAuthMode();
                  });
                },
                child: Text(_formData.isLogin
                    ? 'Create new account'
                    : 'I already have an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
