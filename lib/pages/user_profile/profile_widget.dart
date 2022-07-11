import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'editing_profile.dart';

class ProfileWidget extends StatefulWidget {
  final String imagePath;
  final bool isEdit;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  File? _image;
  final picker = ImagePicker();

  Future uploadFile() async {
    Reference storageRef = storage.ref('Users').child('test.png');
    UploadTask uploadTask = storageRef.putFile(_image!);
    await uploadTask.whenComplete(() {
      // ignore: avoid_print
      print('File Uploaded');
    });
  }

  Future getImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        // ignore: avoid_print
        print('No image selected.');
      }
    });
  }

  String? userPhotoUrl;

  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
        GestureDetector(
            child: ClipOval(
              child: Material(
                  child: _image == null
                      ? const Text('')
                      : Image.file(_image!, width: 150, height: 150)),
            ),
            onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const EditProfilePage()),
                )),
        Positioned(child: buildEditIcon(context)), //bouton d'édition
        // Container(
        //   margin: const EdgeInsets.only(top: 150),
        //   child: ElevatedButton(
        //       child: const Text('envoyer la photo dans firebase'),
        //       onPressed: () {
        //         uploadFile();
        //       }),
        // )
      ],
    ));
  }

  Widget buildEditIcon(BuildContext context) => buildCircle(
        color: Colors.white,
        child: buildCircle(
          color: Colors.black,
          child: IconButton(
            icon: const Icon(Icons.add_a_photo),
            color: Colors.white,
            iconSize: 30,
            onPressed: getImage,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          color: color,
          child: child,
        ),
      );
}
