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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'message.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'message.pbenum.dart';

/// / 消息协议定义
class Message extends $pb.GeneratedMessage {
  factory Message({
    $fixnum.Int64? from,
    $fixnum.Int64? to,
    $fixnum.Int64? timestamp,
    Command? cmd,
    $core.String? hash,
    $core.String? body,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (timestamp != null) result.timestamp = timestamp;
    if (cmd != null) result.cmd = cmd;
    if (hash != null) result.hash = hash;
    if (body != null) result.body = body;
    return result;
  }

  Message._();

  factory Message.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Message.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Message',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'from')
    ..aInt64(2, _omitFieldNames ? '' : 'to')
    ..aInt64(3, _omitFieldNames ? '' : 'timestamp')
    ..e<Command>(4, _omitFieldNames ? '' : 'cmd', $pb.PbFieldType.OE,
        defaultOrMaker: Command.SEND_MSG,
        valueOf: Command.valueOf,
        enumValues: Command.values)
    ..aOS(5, _omitFieldNames ? '' : 'hash')
    ..aOS(6, _omitFieldNames ? '' : 'body')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Message copyWith(void Function(Message) updates) =>
      super.copyWith((message) => updates(message as Message)) as Message;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  @$core.override
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get from => $_getI64(0);
  @$pb.TagNumber(1)
  set from($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get to => $_getI64(1);
  @$pb.TagNumber(2)
  set to($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => $_clearField(3);

  @$pb.TagNumber(4)
  Command get cmd => $_getN(3);
  @$pb.TagNumber(4)
  set cmd(Command value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCmd() => $_has(3);
  @$pb.TagNumber(4)
  void clearCmd() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get hash => $_getSZ(4);
  @$pb.TagNumber(5)
  set hash($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasHash() => $_has(4);
  @$pb.TagNumber(5)
  void clearHash() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get body => $_getSZ(5);
  @$pb.TagNumber(6)
  set body($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasBody() => $_has(5);
  @$pb.TagNumber(6)
  void clearBody() => $_clearField(6);
}

/// / 消息体定义
class MessageBody extends $pb.GeneratedMessage {
  factory MessageBody({
    $core.String? content,
    MessageType? type,
    Sender? sender,
  }) {
    final result = create();
    if (content != null) result.content = content;
    if (type != null) result.type = type;
    if (sender != null) result.sender = sender;
    return result;
  }

  MessageBody._();

  factory MessageBody.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageBody.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageBody',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..e<MessageType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: MessageType.SYSTEM,
        valueOf: MessageType.valueOf,
        enumValues: MessageType.values)
    ..aOM<Sender>(3, _omitFieldNames ? '' : 'sender', subBuilder: Sender.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageBody clone() => MessageBody()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageBody copyWith(void Function(MessageBody) updates) =>
      super.copyWith((message) => updates(message as MessageBody))
          as MessageBody;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageBody create() => MessageBody._();
  @$core.override
  MessageBody createEmptyInstance() => create();
  static $pb.PbList<MessageBody> createRepeated() => $pb.PbList<MessageBody>();
  @$core.pragma('dart2js:noInline')
  static MessageBody getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageBody>(create);
  static MessageBody? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => $_clearField(1);

  @$pb.TagNumber(2)
  MessageType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(MessageType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  Sender get sender => $_getN(2);
  @$pb.TagNumber(3)
  set sender(Sender value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSender() => $_has(2);
  @$pb.TagNumber(3)
  void clearSender() => $_clearField(3);
  @$pb.TagNumber(3)
  Sender ensureSender() => $_ensure(2);
}

/// / 发送者信息
class Sender extends $pb.GeneratedMessage {
  factory Sender({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? avatar,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (avatar != null) result.avatar = avatar;
    return result;
  }

  Sender._();

  factory Sender.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Sender.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Sender',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Sender clone() => Sender()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Sender copyWith(void Function(Sender) updates) =>
      super.copyWith((message) => updates(message as Sender)) as Sender;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Sender create() => Sender._();
  @$core.override
  Sender createEmptyInstance() => create();
  static $pb.PbList<Sender> createRepeated() => $pb.PbList<Sender>();
  @$core.pragma('dart2js:noInline')
  static Sender getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Sender>(create);
  static Sender? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);
}

/// / 文本消息内容
class TextMessageContent extends $pb.GeneratedMessage {
  factory TextMessageContent({
    $core.String? text,
  }) {
    final result = create();
    if (text != null) result.text = text;
    return result;
  }

  TextMessageContent._();

  factory TextMessageContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextMessageContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextMessageContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextMessageContent clone() => TextMessageContent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextMessageContent copyWith(void Function(TextMessageContent) updates) =>
      super.copyWith((message) => updates(message as TextMessageContent))
          as TextMessageContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextMessageContent create() => TextMessageContent._();
  @$core.override
  TextMessageContent createEmptyInstance() => create();
  static $pb.PbList<TextMessageContent> createRepeated() =>
      $pb.PbList<TextMessageContent>();
  @$core.pragma('dart2js:noInline')
  static TextMessageContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextMessageContent>(create);
  static TextMessageContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => $_clearField(1);
}

/// / 语音消息内容
class VioceMessageContent extends $pb.GeneratedMessage {
  factory VioceMessageContent({
    $core.String? url,
    $core.int? duration,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (duration != null) result.duration = duration;
    return result;
  }

  VioceMessageContent._();

  factory VioceMessageContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VioceMessageContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VioceMessageContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VioceMessageContent clone() => VioceMessageContent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VioceMessageContent copyWith(void Function(VioceMessageContent) updates) =>
      super.copyWith((message) => updates(message as VioceMessageContent))
          as VioceMessageContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VioceMessageContent create() => VioceMessageContent._();
  @$core.override
  VioceMessageContent createEmptyInstance() => create();
  static $pb.PbList<VioceMessageContent> createRepeated() =>
      $pb.PbList<VioceMessageContent>();
  @$core.pragma('dart2js:noInline')
  static VioceMessageContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VioceMessageContent>(create);
  static VioceMessageContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get duration => $_getIZ(1);
  @$pb.TagNumber(2)
  set duration($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => $_clearField(2);
}

/// / 图片消息内容
class ImageMessageContent extends $pb.GeneratedMessage {
  factory ImageMessageContent({
    $core.String? url,
    $core.double? width,
    $core.double? height,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (width != null) result.width = width;
    if (height != null) result.height = height;
    return result;
  }

  ImageMessageContent._();

  factory ImageMessageContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ImageMessageContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ImageMessageContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'width', $pb.PbFieldType.OF)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'height', $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageMessageContent clone() => ImageMessageContent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageMessageContent copyWith(void Function(ImageMessageContent) updates) =>
      super.copyWith((message) => updates(message as ImageMessageContent))
          as ImageMessageContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageMessageContent create() => ImageMessageContent._();
  @$core.override
  ImageMessageContent createEmptyInstance() => create();
  static $pb.PbList<ImageMessageContent> createRepeated() =>
      $pb.PbList<ImageMessageContent>();
  @$core.pragma('dart2js:noInline')
  static ImageMessageContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImageMessageContent>(create);
  static ImageMessageContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get width => $_getN(1);
  @$pb.TagNumber(2)
  set width($core.double value) => $_setFloat(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWidth() => $_has(1);
  @$pb.TagNumber(2)
  void clearWidth() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get height => $_getN(2);
  @$pb.TagNumber(3)
  set height($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => $_clearField(3);
}

/// / 视频消息内容
class VideoMessageContent extends $pb.GeneratedMessage {
  factory VideoMessageContent({
    $core.String? url,
    $core.int? duration,
    $core.double? width,
    $core.double? height,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (duration != null) result.duration = duration;
    if (width != null) result.width = width;
    if (height != null) result.height = height;
    return result;
  }

  VideoMessageContent._();

  factory VideoMessageContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VideoMessageContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VideoMessageContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.O3)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'width', $pb.PbFieldType.OF)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'height', $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VideoMessageContent clone() => VideoMessageContent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VideoMessageContent copyWith(void Function(VideoMessageContent) updates) =>
      super.copyWith((message) => updates(message as VideoMessageContent))
          as VideoMessageContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VideoMessageContent create() => VideoMessageContent._();
  @$core.override
  VideoMessageContent createEmptyInstance() => create();
  static $pb.PbList<VideoMessageContent> createRepeated() =>
      $pb.PbList<VideoMessageContent>();
  @$core.pragma('dart2js:noInline')
  static VideoMessageContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VideoMessageContent>(create);
  static VideoMessageContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get duration => $_getIZ(1);
  @$pb.TagNumber(2)
  set duration($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get width => $_getN(2);
  @$pb.TagNumber(3)
  set width($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get height => $_getN(3);
  @$pb.TagNumber(4)
  set height($core.double value) => $_setFloat(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => $_clearField(4);
}

/// / 文件消息内容
class FileMessageContent extends $pb.GeneratedMessage {
  factory FileMessageContent({
    $core.String? url,
    $core.String? name,
    $fixnum.Int64? size,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (name != null) result.name = name;
    if (size != null) result.size = size;
    return result;
  }

  FileMessageContent._();

  factory FileMessageContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FileMessageContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FileMessageContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aInt64(3, _omitFieldNames ? '' : 'size')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileMessageContent clone() => FileMessageContent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileMessageContent copyWith(void Function(FileMessageContent) updates) =>
      super.copyWith((message) => updates(message as FileMessageContent))
          as FileMessageContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileMessageContent create() => FileMessageContent._();
  @$core.override
  FileMessageContent createEmptyInstance() => create();
  static $pb.PbList<FileMessageContent> createRepeated() =>
      $pb.PbList<FileMessageContent>();
  @$core.pragma('dart2js:noInline')
  static FileMessageContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FileMessageContent>(create);
  static FileMessageContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get size => $_getI64(2);
  @$pb.TagNumber(3)
  set size($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearSize() => $_clearField(3);
}

/// / 位置消息内容
class GeoMessageContent extends $pb.GeneratedMessage {
  factory GeoMessageContent({
    $core.double? latitude,
    $core.double? longitude,
    $core.String? address,
  }) {
    final result = create();
    if (latitude != null) result.latitude = latitude;
    if (longitude != null) result.longitude = longitude;
    if (address != null) result.address = address;
    return result;
  }

  GeoMessageContent._();

  factory GeoMessageContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GeoMessageContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GeoMessageContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..aOS(3, _omitFieldNames ? '' : 'address')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GeoMessageContent clone() => GeoMessageContent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GeoMessageContent copyWith(void Function(GeoMessageContent) updates) =>
      super.copyWith((message) => updates(message as GeoMessageContent))
          as GeoMessageContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GeoMessageContent create() => GeoMessageContent._();
  @$core.override
  GeoMessageContent createEmptyInstance() => create();
  static $pb.PbList<GeoMessageContent> createRepeated() =>
      $pb.PbList<GeoMessageContent>();
  @$core.pragma('dart2js:noInline')
  static GeoMessageContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GeoMessageContent>(create);
  static GeoMessageContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get latitude => $_getN(0);
  @$pb.TagNumber(1)
  set latitude($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLatitude() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatitude() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get longitude => $_getN(1);
  @$pb.TagNumber(2)
  set longitude($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLongitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLongitude() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => $_clearField(3);
}

/// / 添加好友的请求
class AddFriendRequest extends $pb.GeneratedMessage {
  factory AddFriendRequest({
    $fixnum.Int64? id,
    $core.String? message,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (message != null) result.message = message;
    return result;
  }

  AddFriendRequest._();

  factory AddFriendRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddFriendRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddFriendRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddFriendRequest clone() => AddFriendRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddFriendRequest copyWith(void Function(AddFriendRequest) updates) =>
      super.copyWith((message) => updates(message as AddFriendRequest))
          as AddFriendRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddFriendRequest create() => AddFriendRequest._();
  @$core.override
  AddFriendRequest createEmptyInstance() => create();
  static $pb.PbList<AddFriendRequest> createRepeated() =>
      $pb.PbList<AddFriendRequest>();
  @$core.pragma('dart2js:noInline')
  static AddFriendRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddFriendRequest>(create);
  static AddFriendRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

/// / 删除消息的请求（双向删除）
class DeleteMessageRequest extends $pb.GeneratedMessage {
  factory DeleteMessageRequest({
    $core.Iterable<$core.String>? ids,
  }) {
    final result = create();
    if (ids != null) result.ids.addAll(ids);
    return result;
  }

  DeleteMessageRequest._();

  factory DeleteMessageRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteMessageRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteMessageRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteMessageRequest clone() =>
      DeleteMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteMessageRequest copyWith(void Function(DeleteMessageRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteMessageRequest))
          as DeleteMessageRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteMessageRequest create() => DeleteMessageRequest._();
  @$core.override
  DeleteMessageRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteMessageRequest> createRepeated() =>
      $pb.PbList<DeleteMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteMessageRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteMessageRequest>(create);
  static DeleteMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get ids => $_getList(0);
}

/// / 删除会话的请求（双向删除）
class DeleteConversationRequest extends $pb.GeneratedMessage {
  factory DeleteConversationRequest({
    $fixnum.Int64? sessionId,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    return result;
  }

  DeleteConversationRequest._();

  factory DeleteConversationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteConversationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteConversationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'sessionId', protoName: 'sessionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteConversationRequest clone() =>
      DeleteConversationRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteConversationRequest copyWith(
          void Function(DeleteConversationRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteConversationRequest))
          as DeleteConversationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteConversationRequest create() => DeleteConversationRequest._();
  @$core.override
  DeleteConversationRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteConversationRequest> createRepeated() =>
      $pb.PbList<DeleteConversationRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteConversationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteConversationRequest>(create);
  static DeleteConversationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set sessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);
}

/// / 更新联系人信息
class UpdateContactInfo extends $pb.GeneratedMessage {
  factory UpdateContactInfo({
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  UpdateContactInfo._();

  factory UpdateContactInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateContactInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateContactInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateContactInfo clone() => UpdateContactInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateContactInfo copyWith(void Function(UpdateContactInfo) updates) =>
      super.copyWith((message) => updates(message as UpdateContactInfo))
          as UpdateContactInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateContactInfo create() => UpdateContactInfo._();
  @$core.override
  UpdateContactInfo createEmptyInstance() => create();
  static $pb.PbList<UpdateContactInfo> createRepeated() =>
      $pb.PbList<UpdateContactInfo>();
  @$core.pragma('dart2js:noInline')
  static UpdateContactInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateContactInfo>(create);
  static UpdateContactInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
