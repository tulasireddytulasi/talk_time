// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

import 'dart:convert';

ContactModel contactModelFromJson(String str) => ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
  String? id;
  String? displayName;
  dynamic photo;
  dynamic thumbnail;
  Name? name;
  List<Phone>? phones;
  List<Address>? emails;
  List<Address>? addresses;
  List<Organization>? organizations;
  List<Website>? websites;
  List<SocialMedia>? socialMedias;
  List<Event>? events;
  List<Note>? notes;
  List<Group>? groups;

  ContactModel({
    this.id,
    this.displayName,
    this.photo,
    this.thumbnail,
    this.name,
    this.phones,
    this.emails,
    this.addresses,
    this.organizations,
    this.websites,
    this.socialMedias,
    this.events,
    this.notes,
    this.groups,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
    id: json["id"],
    displayName: json["displayName"],
    photo: json["photo"],
    thumbnail: json["thumbnail"],
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    phones: json["phones"] == null ? [] : List<Phone>.from(json["phones"]!.map((x) => Phone.fromJson(x))),
    emails: json["emails"] == null ? [] : List<Address>.from(json["emails"]!.map((x) => Address.fromJson(x))),
    addresses: json["addresses"] == null ? [] : List<Address>.from(json["addresses"]!.map((x) => Address.fromJson(x))),
    organizations: json["organizations"] == null ? [] : List<Organization>.from(json["organizations"]!.map((x) => Organization.fromJson(x))),
    websites: json["websites"] == null ? [] : List<Website>.from(json["websites"]!.map((x) => Website.fromJson(x))),
    socialMedias: json["socialMedias"] == null ? [] : List<SocialMedia>.from(json["socialMedias"]!.map((x) => SocialMedia.fromJson(x))),
    events: json["events"] == null ? [] : List<Event>.from(json["events"]!.map((x) => Event.fromJson(x))),
    notes: json["notes"] == null ? [] : List<Note>.from(json["notes"]!.map((x) => Note.fromJson(x))),
    groups: json["groups"] == null ? [] : List<Group>.from(json["groups"]!.map((x) => Group.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "displayName": displayName,
    "photo": photo,
    "thumbnail": thumbnail,
    "name": name?.toJson(),
    "phones": phones == null ? [] : List<dynamic>.from(phones!.map((x) => x.toJson())),
    "emails": emails == null ? [] : List<dynamic>.from(emails!.map((x) => x.toJson())),
    "addresses": addresses == null ? [] : List<dynamic>.from(addresses!.map((x) => x.toJson())),
    "organizations": organizations == null ? [] : List<dynamic>.from(organizations!.map((x) => x.toJson())),
    "websites": websites == null ? [] : List<dynamic>.from(websites!.map((x) => x.toJson())),
    "socialMedias": socialMedias == null ? [] : List<dynamic>.from(socialMedias!.map((x) => x.toJson())),
    "events": events == null ? [] : List<dynamic>.from(events!.map((x) => x.toJson())),
    "notes": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x.toJson())),
    "groups": groups == null ? [] : List<dynamic>.from(groups!.map((x) => x.toJson())),
  };
}

class Address {
  String? address;
  String? label;

  Address({
    this.address,
    this.label,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json["address"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "label": label,
  };
}

class Event {
  int? year;
  int? month;
  int? day;
  String? label;

  Event({
    this.year,
    this.month,
    this.day,
    this.label,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    year: json["year"],
    month: json["month"],
    day: json["day"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "year": year,
    "month": month,
    "day": day,
    "label": label,
  };
}

class Group {
  String? id;
  String? name;

  Group({
    this.id,
    this.name,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Name {
  String? first;
  String? last;

  Name({
    this.first,
    this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    first: json["first"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
  };
}

class Note {
  String? note;

  Note({
    this.note,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "note": note,
  };
}

class Organization {
  String? company;
  String? title;

  Organization({
    this.company,
    this.title,
  });

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
    company: json["company"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "company": company,
    "title": title,
  };
}

class Phone {
  String? number;
  String? label;

  Phone({
    this.number,
    this.label,
  });

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
    number: json["number"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "label": label,
  };
}

class SocialMedia {
  String? userName;
  String? label;

  SocialMedia({
    this.userName,
    this.label,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
    userName: json["userName"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "label": label,
  };
}

class Website {
  String? url;
  String? label;

  Website({
    this.url,
    this.label,
  });

  factory Website.fromJson(Map<String, dynamic> json) => Website(
    url: json["url"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
  };
}
