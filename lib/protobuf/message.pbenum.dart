// This is a generated file - do not edit.
//
// Generated from message.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// / 操作指令定义
class Command extends $pb.ProtobufEnum {
  static const Command SEND_MSG =
      Command._(0, _omitEnumNames ? '' : 'SEND_MSG');
  static const Command RECEIPT = Command._(1, _omitEnumNames ? '' : 'RECEIPT');
  static const Command TWO_WAY_DELETION =
      Command._(2, _omitEnumNames ? '' : 'TWO_WAY_DELETION');
  static const Command TWO_WAY_CONVERSATION =
      Command._(3, _omitEnumNames ? '' : 'TWO_WAY_CONVERSATION');
  static const Command ADD_FRIEND =
      Command._(4, _omitEnumNames ? '' : 'ADD_FRIEND');
  static const Command DELETE_FRIEND =
      Command._(5, _omitEnumNames ? '' : 'DELETE_FRIEND');
  static const Command BLOCK = Command._(6, _omitEnumNames ? '' : 'BLOCK');
  static const Command UNBLOCK = Command._(7, _omitEnumNames ? '' : 'UNBLOCK');
  static const Command UPDATE_CONTACT =
      Command._(8, _omitEnumNames ? '' : 'UPDATE_CONTACT');

  static const $core.List<Command> values = <Command>[
    SEND_MSG,
    RECEIPT,
    TWO_WAY_DELETION,
    TWO_WAY_CONVERSATION,
    ADD_FRIEND,
    DELETE_FRIEND,
    BLOCK,
    UNBLOCK,
    UPDATE_CONTACT,
  ];

  static final $core.List<Command?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 8);
  static Command? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Command._(super.value, super.name);
}

/// / 消息类型定义
class MessageType extends $pb.ProtobufEnum {
  static const MessageType SYSTEM =
      MessageType._(0, _omitEnumNames ? '' : 'SYSTEM');
  static const MessageType TEXT =
      MessageType._(1, _omitEnumNames ? '' : 'TEXT');
  static const MessageType VOICE =
      MessageType._(2, _omitEnumNames ? '' : 'VOICE');
  static const MessageType IMAGE =
      MessageType._(3, _omitEnumNames ? '' : 'IMAGE');
  static const MessageType VIDEO =
      MessageType._(4, _omitEnumNames ? '' : 'VIDEO');
  static const MessageType FILE =
      MessageType._(5, _omitEnumNames ? '' : 'FILE');
  static const MessageType GEO = MessageType._(6, _omitEnumNames ? '' : 'GEO');

  static const $core.List<MessageType> values = <MessageType>[
    SYSTEM,
    TEXT,
    VOICE,
    IMAGE,
    VIDEO,
    FILE,
    GEO,
  ];

  static final $core.List<MessageType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static MessageType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MessageType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
