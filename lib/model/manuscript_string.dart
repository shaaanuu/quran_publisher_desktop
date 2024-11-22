/// Store information for both text fontCode and font family name
class ManuscriptString {
  String text;
  String fontName;

  ManuscriptString({required this.text, required this.fontName});

  @override
  String toString() {
    return 'ManuscriptString{text: $text, fontName: $fontName}';
  }
}
