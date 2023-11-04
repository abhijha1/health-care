import 'package:image_picker/image_picker.dart';

Future getImage(ImageSource source) async {
  final ImagePicker picker = ImagePicker();

  final XFile? image = await picker.pickImage(source: source);
  if (image != null) {
    return image.readAsBytes();
  }
}
