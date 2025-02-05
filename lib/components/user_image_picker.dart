import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class UserImagePicker extends StatefulWidget {
  final Function(File pickedImage) onImagePick;

  const UserImagePicker({super.key, required this.onImagePick});

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _image;

  void _pickImage() {
    final picker = ImagePicker();
    picker.pickImage(source: ImageSource.gallery, imageQuality: 50, maxWidth: 150).then((pickedImage) {
      if (pickedImage == null) {
        return;
      }
      setState(() {
        _image = File(pickedImage.path);
      });
      widget.onImagePick(_image!);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _image != null ? FileImage(_image!) : null,
        ),
        TextButton(
          onPressed: _pickImage,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.image,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(width: 10),
              Text('Add Image'),
            ],
          ),
        ),
      ],
    );
  }
}
