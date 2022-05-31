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
  final ImagePicker _picker = ImagePicker();
  File? imageFile;
   _ouvrirLaCamera(BuildContext context) async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(image!.path);
    });
    Navigator.of(context).pop();
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
              child: Image.asset(    
                'assets/visage.jpeg',
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                    ),
                  ),
                ),
              onTap: () => Navigator.of(context).push( 
           MaterialPageRoute(
             builder: (context) => const EditProfilePage()),)
        ),
        Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(context)), //bouton d'édition
      ],
    ));
  }

  Widget buildEditIcon(BuildContext context) => 
  buildCircle(
        color: Colors.white,
        
        child: buildCircle(
          color: Colors.black,
          
          
            child:  IconButton(
            icon: const Icon( Icons.add_a_photo),
              color: Colors.white,
              iconSize: 20,
            
            onPressed: () => _ouvrirLaCamera(context)),
            
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

