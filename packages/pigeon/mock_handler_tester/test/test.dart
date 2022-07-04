// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//
// Autogenerated from Pigeon (v3.0.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, unnecessary_import
// ignore_for_file: avoid_relative_lib_imports
// @dart = 2.12
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;
import 'package:flutter/foundation.dart' show WriteBuffer, ReadBuffer;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'message.dart';

class _TestHostApiCodec extends StandardMessageCodec {
  const _TestHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is MessageSearchReply) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is MessageSearchRequest) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return MessageSearchReply.decode(readValue(buffer)!);

      case 129:
        return MessageSearchRequest.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class TestHostApi {
  static const MessageCodec<Object?> codec = _TestHostApiCodec();

  void initialize();
  MessageSearchReply search(MessageSearchRequest request);
  static void setup(TestHostApi? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.MessageApi.initialize', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMockMessageHandler(null);
      } else {
        channel.setMockMessageHandler((Object? message) async {
          // ignore message
          api.initialize();
          return <Object?, Object?>{};
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.MessageApi.search', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMockMessageHandler(null);
      } else {
        channel.setMockMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.MessageApi.search was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final MessageSearchRequest? arg_request =
              (args[0] as MessageSearchRequest?);
          assert(arg_request != null,
              'Argument for dev.flutter.pigeon.MessageApi.search was null, expected non-null MessageSearchRequest.');
          final MessageSearchReply output = api.search(arg_request!);
          return <Object?, Object?>{'result': output};
        });
      }
    }
  }
}

class _TestNestedApiCodec extends StandardMessageCodec {
  const _TestNestedApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is MessageNested) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is MessageSearchReply) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is MessageSearchRequest) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return MessageNested.decode(readValue(buffer)!);

      case 129:
        return MessageSearchReply.decode(readValue(buffer)!);

      case 130:
        return MessageSearchRequest.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class TestNestedApi {
  static const MessageCodec<Object?> codec = _TestNestedApiCodec();

  MessageSearchReply search(MessageNested nested);
  static void setup(TestNestedApi? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.MessageNestedApi.search', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMockMessageHandler(null);
      } else {
        channel.setMockMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.MessageNestedApi.search was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final MessageNested? arg_nested = (args[0] as MessageNested?);
          assert(arg_nested != null,
              'Argument for dev.flutter.pigeon.MessageNestedApi.search was null, expected non-null MessageNested.');
          final MessageSearchReply output = api.search(arg_nested!);
          return <Object?, Object?>{'result': output};
        });
      }
    }
  }
}
