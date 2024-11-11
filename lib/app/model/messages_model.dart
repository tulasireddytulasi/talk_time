import 'dart:convert';

UserMessagesModel userMessagesModelFromJson(String str) => UserMessagesModel.fromJson(json.decode(str));

String userMessagesModelToJson(UserMessagesModel data) => json.encode(data.toJson());

class UserMessagesModel {
  List<Message>? messages;

  UserMessagesModel({
    this.messages,
  });

  factory UserMessagesModel.fromJson(Map<String, dynamic> json) => UserMessagesModel(
    messages: json["messages"] == null ? [] : List<Message>.from(json["messages"]!.map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x.toJson())),
  };
}

class Message {
  int? senderId;
  int? receiverId;
  String? widgetType;
  String? filePath;
  String? messageText;
  DateTime? date;

  Message({
    this.senderId,
    this.receiverId,
    this.widgetType,
    this.filePath,
    this.messageText,
    this.date,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    senderId: json["senderId"],
    receiverId: json["receiverId"],
    widgetType: json["widgetType"],
    filePath: json["filePath"],
    messageText: json["messageText"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "senderId": senderId,
    "receiverId": receiverId,
    "widgetType": widgetType,
    "filePath": filePath,
    "messageText": messageText,
    "date": date?.toIso8601String(),
  };
}
