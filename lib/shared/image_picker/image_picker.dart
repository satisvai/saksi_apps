import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class QImagePicker extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final Function(String) onChanged;
  final List<String> extensions;
  final bool enabled;

  QImagePicker({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    required this.onChanged,
    this.extensions = const ["jpg", "png"],
    this.enabled = true,
  }) : super(key: key);

  @override
  State<QImagePicker> createState() => _QImagePickerState();
}

class _QImagePickerState extends State<QImagePicker> {
  String? imageUrl;
  bool loading = false;
  late TextEditingController controller;

  @override
  void initState() {
    imageUrl = widget.value;
    controller = TextEditingController(text: widget.value ?? "-");
    super.initState();
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        loading = true;
      });
      uploadImageToFirebase(image.path);
    }
  }

  Future<void> uploadImageToFirebase(String filePath) async {
    String fileName = 'c1-hasil/${DateTime.now().millisecondsSinceEpoch}_${Path.basename(filePath)}';
    File file = File(filePath);

    try {
      UploadTask task = FirebaseStorage.instance.ref(fileName).putFile(file);
      TaskSnapshot snapshot = await task;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
        controller.text = downloadUrl;
        loading = false;
      });

      widget.onChanged(downloadUrl);
    } catch (e) {
      setState(() {
        loading = false;
      });
      print("Error uploading image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      margin: EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 96.0,
            width: 96.0,
            margin: EdgeInsets.only(top: 8.0),
            decoration: BoxDecoration(
              color: loading ? Colors.blueGrey[400] : null,
              image: loading
                  ? null
                  : DecorationImage(
                      image: NetworkImage(
                        imageUrl == null ? "https://i.ibb.co/S32HNjD/no-image.jpg" : imageUrl!,
                      ),
                      fit: BoxFit.cover,
                    ),
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Visibility(
              visible: loading,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(color: Colors.orange),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      "Uploading...",
                      style: TextStyle(fontSize: 9.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: FormField(
              initialValue: false,
              validator: (value) {
                return widget.validator!(imageUrl);
              },
              enabled: true,
              builder: (FormFieldState<bool> field) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: widget.label,
                          labelStyle: TextStyle(color: Colors.blueGrey),
                          helperText: widget.helper,
                          hintText: widget.hint,
                          errorText: field.errorText,
                        ),
                        onChanged: (value) {
                          widget.onChanged(value);
                        },
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    if (widget.enabled)
                      Container(
                        width: 50.0,
                        height: 46.0,
                        margin: const EdgeInsets.only(right: 4.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0.0),
                            backgroundColor: Colors.grey,
                          ),
                          onPressed: () => pickImage(),
                          child: Icon(
                            Icons.file_upload,
                            size: 24.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
