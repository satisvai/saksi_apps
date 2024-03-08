import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class QCameraPicker extends StatefulWidget {
  final String label;
  final Function(String) onChanged;

  QCameraPicker({
    Key? key,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  _QCameraPickerState createState() => _QCameraPickerState();
}

class _QCameraPickerState extends State<QCameraPicker> {
  String? imageUrl;
  bool loading = false;

  Future<void> pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Photo Library'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.gallery);
                  }),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      }
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      setState(() => loading = true);
      uploadImageToFirebase(image.path);
    }
  }

  Future<void> uploadImageToFirebase(String filePath) async {
    String fileName = 'c1-hasil/${DateTime.now().millisecondsSinceEpoch}_${Path.basename(filePath)}';
    File imageFile = File(filePath);

    try {
      UploadTask uploadTask = FirebaseStorage.instance.ref(fileName).putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
        loading = false;
      });

      widget.onChanged(downloadUrl);
    } catch (e) {
      print("Error uploading image to Firebase: $e");
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pickImage(),
      child: Column(
        children: [
          Container(
            height: 200.0,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Color(0xffededed),
              image: DecorationImage(
                image: imageUrl != null
                    ? NetworkImage(imageUrl!) as ImageProvider
                    : AssetImage('assets/images/placeholder.jpg') as ImageProvider,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: loading
                ? Center(child: CircularProgressIndicator())
                : Container(),
          ),
          SizedBox(height: 10),
          Text(widget.label, style: TextStyle(color: Colors.blueGrey)),
        ],
      ),
    );
  }
}
