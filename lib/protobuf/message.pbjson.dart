// This is a generated file - do not edit.
//
// Generated from message.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use commandDescriptor instead')
const Command$json = {
  '1': 'Command',
  '2': [
    {'1': 'SEND_MSG', '2': 0},
    {'1': 'RECEIPT', '2': 1},
    {'1': 'TWO_WAY_DELETION', '2': 2},
    {'1': 'TWO_WAY_CONVERSATION', '2': 3},
    {'1': 'ADD_FRIEND', '2': 4},
    {'1': 'DELETE_FRIEND', '2': 5},
    {'1': 'BLOCK', '2': 6},
    {'1': 'UNBLOCK', '2': 7},
    {'1': 'UPDATE_CONTACT', '2': 8},
  ],
};

/// Descriptor for `Command`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List commandDescriptor = $convert.base64Decode(
    'CgdDb21tYW5kEgwKCFNFTkRfTVNHEAASCwoHUkVDRUlQVBABEhQKEFRXT19XQVlfREVMRVRJT0'
    '4QAhIYChRUV09fV0FZX0NPTlZFUlNBVElPThADEg4KCkFERF9GUklFTkQQBBIRCg1ERUxFVEVf'
    'RlJJRU5EEAUSCQoFQkxPQ0sQBhILCgdVTkJMT0NLEAcSEgoOVVBEQVRFX0NPTlRBQ1QQCA==');

@$core.Deprecated('Use messageTypeDescriptor instead')
const MessageType$json = {
  '1': 'MessageType',
  '2': [
    {'1': 'SYSTEM', '2': 0},
    {'1': 'TEXT', '2': 1},
    {'1': 'VOICE', '2': 2},
    {'1': 'IMAGE', '2': 3},
    {'1': 'VIDEO', '2': 4},
    {'1': 'FILE', '2': 5},
    {'1': 'GEO', '2': 6},
  ],
};

/// Descriptor for `MessageType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List messageTypeDescriptor = $convert.base64Decode(
    'CgtNZXNzYWdlVHlwZRIKCgZTWVNURU0QABIICgRURVhUEAESCQoFVk9JQ0UQAhIJCgVJTUFHRR'
    'ADEgkKBVZJREVPEAQSCAoERklMRRAFEgcKA0dFTxAG');

@$core.Deprecated('Use messageDescriptor instead')
const Message$json = {
  '1': 'Message',
  '2': [
    {'1': 'from', '3': 1, '4': 1, '5': 3, '10': 'from'},
    {'1': 'to', '3': 2, '4': 1, '5': 3, '10': 'to'},
    {'1': 'timestamp', '3': 3, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'cmd', '3': 4, '4': 1, '5': 14, '6': '.message.Command', '10': 'cmd'},
    {'1': 'hash', '3': 5, '4': 1, '5': 9, '10': 'hash'},
    {'1': 'body', '3': 6, '4': 1, '5': 9, '10': 'body'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEhIKBGZyb20YASABKANSBGZyb20SDgoCdG8YAiABKANSAnRvEhwKCXRpbWVzdG'
    'FtcBgDIAEoA1IJdGltZXN0YW1wEiIKA2NtZBgEIAEoDjIQLm1lc3NhZ2UuQ29tbWFuZFIDY21k'
    'EhIKBGhhc2gYBSABKAlSBGhhc2gSEgoEYm9keRgGIAEoCVIEYm9keQ==');

@$core.Deprecated('Use messageBodyDescriptor instead')
const MessageBody$json = {
  '1': 'MessageBody',
  '2': [
    {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
    {
      '1': 'type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.message.MessageType',
      '10': 'type'
    },
    {
      '1': 'sender',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.message.Sender',
      '10': 'sender'
    },
  ],
};

/// Descriptor for `MessageBody`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageBodyDescriptor = $convert.base64Decode(
    'CgtNZXNzYWdlQm9keRIYCgdjb250ZW50GAEgASgJUgdjb250ZW50EigKBHR5cGUYAiABKA4yFC'
    '5tZXNzYWdlLk1lc3NhZ2VUeXBlUgR0eXBlEicKBnNlbmRlchgDIAEoCzIPLm1lc3NhZ2UuU2Vu'
    'ZGVyUgZzZW5kZXI=');

@$core.Deprecated('Use senderDescriptor instead')
const Sender$json = {
  '1': 'Sender',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'avatar', '3': 3, '4': 1, '5': 9, '10': 'avatar'},
  ],
};

/// Descriptor for `Sender`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List senderDescriptor = $convert.base64Decode(
    'CgZTZW5kZXISDgoCaWQYASABKANSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFgoGYXZhdGFyGA'
    'MgASgJUgZhdmF0YXI=');

@$core.Deprecated('Use textMessageContentDescriptor instead')
const TextMessageContent$json = {
  '1': 'TextMessageContent',
  '2': [
    {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `TextMessageContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textMessageContentDescriptor = $convert
    .base64Decode('ChJUZXh0TWVzc2FnZUNvbnRlbnQSEgoEdGV4dBgBIAEoCVIEdGV4dA==');

@$core.Deprecated('Use vioceMessageContentDescriptor instead')
const VioceMessageContent$json = {
  '1': 'VioceMessageContent',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'duration', '3': 2, '4': 1, '5': 5, '10': 'duration'},
  ],
};

/// Descriptor for `VioceMessageContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vioceMessageContentDescriptor = $convert.base64Decode(
    'ChNWaW9jZU1lc3NhZ2VDb250ZW50EhAKA3VybBgBIAEoCVIDdXJsEhoKCGR1cmF0aW9uGAIgAS'
    'gFUghkdXJhdGlvbg==');

@$core.Deprecated('Use imageMessageContentDescriptor instead')
const ImageMessageContent$json = {
  '1': 'ImageMessageContent',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'width', '3': 2, '4': 1, '5': 2, '10': 'width'},
    {'1': 'height', '3': 3, '4': 1, '5': 2, '10': 'height'},
  ],
};

/// Descriptor for `ImageMessageContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageMessageContentDescriptor = $convert.base64Decode(
    'ChNJbWFnZU1lc3NhZ2VDb250ZW50EhAKA3VybBgBIAEoCVIDdXJsEhQKBXdpZHRoGAIgASgCUg'
    'V3aWR0aBIWCgZoZWlnaHQYAyABKAJSBmhlaWdodA==');

@$core.Deprecated('Use videoMessageContentDescriptor instead')
const VideoMessageContent$json = {
  '1': 'VideoMessageContent',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'duration', '3': 2, '4': 1, '5': 5, '10': 'duration'},
    {'1': 'width', '3': 3, '4': 1, '5': 2, '10': 'width'},
    {'1': 'height', '3': 4, '4': 1, '5': 2, '10': 'height'},
  ],
};

/// Descriptor for `VideoMessageContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videoMessageContentDescriptor = $convert.base64Decode(
    'ChNWaWRlb01lc3NhZ2VDb250ZW50EhAKA3VybBgBIAEoCVIDdXJsEhoKCGR1cmF0aW9uGAIgAS'
    'gFUghkdXJhdGlvbhIUCgV3aWR0aBgDIAEoAlIFd2lkdGgSFgoGaGVpZ2h0GAQgASgCUgZoZWln'
    'aHQ=');

@$core.Deprecated('Use fileMessageContentDescriptor instead')
const FileMessageContent$json = {
  '1': 'FileMessageContent',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'size', '3': 3, '4': 1, '5': 3, '10': 'size'},
  ],
};

/// Descriptor for `FileMessageContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileMessageContentDescriptor = $convert.base64Decode(
    'ChJGaWxlTWVzc2FnZUNvbnRlbnQSEAoDdXJsGAEgASgJUgN1cmwSEgoEbmFtZRgCIAEoCVIEbm'
    'FtZRISCgRzaXplGAMgASgDUgRzaXpl');

@$core.Deprecated('Use geoMessageContentDescriptor instead')
const GeoMessageContent$json = {
  '1': 'GeoMessageContent',
  '2': [
    {'1': 'latitude', '3': 1, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 2, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `GeoMessageContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List geoMessageContentDescriptor = $convert.base64Decode(
    'ChFHZW9NZXNzYWdlQ29udGVudBIaCghsYXRpdHVkZRgBIAEoAVIIbGF0aXR1ZGUSHAoJbG9uZ2'
    'l0dWRlGAIgASgBUglsb25naXR1ZGUSGAoHYWRkcmVzcxgDIAEoCVIHYWRkcmVzcw==');

@$core.Deprecated('Use addFriendRequestDescriptor instead')
const AddFriendRequest$json = {
  '1': 'AddFriendRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `AddFriendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addFriendRequestDescriptor = $convert.base64Decode(
    'ChBBZGRGcmllbmRSZXF1ZXN0Eg4KAmlkGAEgASgDUgJpZBIYCgdtZXNzYWdlGAIgASgJUgdtZX'
    'NzYWdl');

@$core.Deprecated('Use deleteMessageRequestDescriptor instead')
const DeleteMessageRequest$json = {
  '1': 'DeleteMessageRequest',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
  ],
};

/// Descriptor for `DeleteMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteMessageRequestDescriptor = $convert
    .base64Decode('ChREZWxldGVNZXNzYWdlUmVxdWVzdBIQCgNpZHMYASADKAlSA2lkcw==');

@$core.Deprecated('Use deleteConversationRequestDescriptor instead')
const DeleteConversationRequest$json = {
  '1': 'DeleteConversationRequest',
  '2': [
    {'1': 'sessionId', '3': 1, '4': 1, '5': 3, '10': 'sessionId'},
  ],
};

/// Descriptor for `DeleteConversationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteConversationRequestDescriptor =
    $convert.base64Decode(
        'ChlEZWxldGVDb252ZXJzYXRpb25SZXF1ZXN0EhwKCXNlc3Npb25JZBgBIAEoA1IJc2Vzc2lvbk'
        'lk');

@$core.Deprecated('Use updateContactInfoDescriptor instead')
const UpdateContactInfo$json = {
  '1': 'UpdateContactInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `UpdateContactInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateContactInfoDescriptor =
    $convert.base64Decode('ChFVcGRhdGVDb250YWN0SW5mbxIOCgJpZBgBIAEoA1ICaWQ=');
