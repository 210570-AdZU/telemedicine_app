import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:layout_design/models/chat_room_model.dart' as model;
import 'package:layout_design/controllers/chat_room_controller.dart' as controller;

class ChatRoom extends StatelessWidget {
  final controller.ChatRoomController _controller = Get.put(controller.ChatRoomController());

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.video_camera_back,
                color: Colors.blueGrey,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                return GroupedListView<model.Message, DateTime>(
                  padding: EdgeInsets.all(8),
                  reverse: true,
                  order: GroupedListOrder.DESC,
                  useStickyGroupSeparators: true,
                  floatingHeader: true,
                  elements: _controller.messages.toList(), // Convert RxList to List
                  groupBy: (message) => DateTime(
                    message.date.year,
                    message.date.month,
                    message.date.day,
                  ),
                  groupHeaderBuilder: (model.Message message) => SizedBox(
                  ),
                  itemBuilder: (context, model.Message message) {
                    if (message.file != null) {
                      return Align(
                        alignment: message.sentByMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Card(
                          elevation: 8,
                          child: Container(
                            decoration: BoxDecoration(
                              color: message.sentByMe
                                  ? Colors.blueGrey
                                  : Colors.white,
                              borderRadius: message.sentByMe
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    )
                                  : BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    message.fileName!,
                                    style: TextStyle(
                                      color: message.sentByMe
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  if (message.fileName!.endsWith('.png') || message.fileName!.endsWith('.jpg'))
                                    FutureBuilder<ImageInfo>(
                                      future: _getImageInfo(message.file!),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.done) {
                                          final imageInfo = snapshot.data;
                                          if (imageInfo != null) {
                                            final imageWidth = imageInfo.image.width.toDouble();
                                            final imageHeight = imageInfo.image.height.toDouble();
                                            final maxWidth = MediaQuery.of(context).size.width * 0.5;
                                            final width = imageWidth > maxWidth ? maxWidth : imageWidth;
                                            final height = width * (imageHeight / imageWidth);

                                            return SizedBox(
                                              width: width,
                                              height: height,
                                              child: Image.file(
                                                message.file!,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          }
                                        }
                                        return Center(child: CircularProgressIndicator());
                                      },
                                    )
                                  else if (message.fileName!.endsWith('.pdf'))
                                    Text("PDF file")
                                  else
                                    Text("File cannot be previewed"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Align(
                        alignment: message.sentByMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Card(
                          elevation: 8,
                          child: Container(
                            decoration: BoxDecoration(
                              color: message.sentByMe
                                  ? Colors.blueGrey
                                  : Colors.white,
                              borderRadius: message.sentByMe
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    )
                                  : BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                message.text,
                                style: TextStyle(
                                  color: message.sentByMe
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              }),
            ),
            Divider(
              height: 0,
            ),
            Container(
              color: Colors.white,
              height: 56,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _controller.attachFile();
                    },
                    icon: Icon(Icons.attach_file),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera_alt),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextField(
                      controller: _controller.textEditingController,
                      decoration: InputDecoration(
                        isCollapsed: true,
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.all(12),
                        hintText: 'Type your message here...',
                      ),
                      onSubmitted: (text) {
                        _controller.sendMessage(text);
                      },
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      if (_controller.textEditingController.text.isNotEmpty) {
                        _controller.sendMessage(
                            _controller.textEditingController.text);
                      }
                    },
                    icon: Icon(Icons.send),
                  )
                ],
              ),
            )
          ],
        ),
      );
    Future<ImageInfo> _getImageInfo(File file) async {
    final Completer<ImageInfo> completer = Completer();
    final Image image = Image.file(file);
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(info);
      }),
    );
    return completer.future;
  }
}
