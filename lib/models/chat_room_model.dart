import 'dart:io';

class Message {
  final String text;
  final DateTime date;
  final bool sentByMe;
  final File? file;
  final String? fileName;

  const Message({
    required this.text,
    required this.date,
    required this.sentByMe,
    this.file,
    this.fileName,
  });
}