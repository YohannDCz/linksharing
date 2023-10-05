import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import './styles.dart';

class ImagePickerWidget extends StatefulWidget {
  final String? imageUrl;
  final void Function(String) onUpload;

  const ImagePickerWidget({super.key, required this.imageUrl, required this.onUpload});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  void _imagePicker() async {
    try {
      final picker = ImagePicker();
      final supabase = Supabase.instance.client;
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      const uuid = Uuid();

      if (image != null) {
        final imageBytes = await image.readAsBytes();
        final uuidString = uuid.v4();
        final imagePath = 'profile/$uuidString.png';
        await supabase.storage.from('profiles').uploadBinary(
              imagePath,
              imageBytes,
              fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
            );

        final imageUrl = supabase.storage.from('profiles').getPublicUrl(imagePath);
        widget.onUpload(imageUrl);
      }
    } catch (e) {
      print("An error occurred: $e");
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _imagePicker,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: lavanderLighter,
          borderRadius: BorderRadius.circular(12.0),
          image: widget.imageUrl != null
              ? DecorationImage(
                  image: NetworkImage(widget.imageUrl!),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/icon-upload-image.svg',
              color: widget.imageUrl != null ? Colors.white : lavander,
            ),
            Text(
              widget.imageUrl != null ? 'Change Image' : '+ Upload Image',
              style: headingS.copyWith(
                color: widget.imageUrl != null ? Colors.white : lavander,
              ),
            ),
          ],
        ),
      ),
    );
  }
}