// This is a generated file - do not edit.
//
// Generated from MarketDataFeed.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Type extends $pb.ProtobufEnum {
  static const Type initial_feed =
      Type._(0, _omitEnumNames ? '' : 'initial_feed');
  static const Type live_feed = Type._(1, _omitEnumNames ? '' : 'live_feed');
  static const Type market_info =
      Type._(2, _omitEnumNames ? '' : 'market_info');

  static const $core.List<Type> values = <Type>[
    initial_feed,
    live_feed,
    market_info,
  ];

  static final $core.List<Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Type._(super.value, super.name);
}

class RequestMode extends $pb.ProtobufEnum {
  static const RequestMode ltpc =
      RequestMode._(0, _omitEnumNames ? '' : 'ltpc');
  static const RequestMode full_d5 =
      RequestMode._(1, _omitEnumNames ? '' : 'full_d5');
  static const RequestMode option_greeks =
      RequestMode._(2, _omitEnumNames ? '' : 'option_greeks');
  static const RequestMode full_d30 =
      RequestMode._(3, _omitEnumNames ? '' : 'full_d30');

  static const $core.List<RequestMode> values = <RequestMode>[
    ltpc,
    full_d5,
    option_greeks,
    full_d30,
  ];

  static final $core.List<RequestMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static RequestMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RequestMode._(super.value, super.name);
}

class MarketStatus extends $pb.ProtobufEnum {
  static const MarketStatus PRE_OPEN_START =
      MarketStatus._(0, _omitEnumNames ? '' : 'PRE_OPEN_START');
  static const MarketStatus PRE_OPEN_END =
      MarketStatus._(1, _omitEnumNames ? '' : 'PRE_OPEN_END');
  static const MarketStatus NORMAL_OPEN =
      MarketStatus._(2, _omitEnumNames ? '' : 'NORMAL_OPEN');
  static const MarketStatus NORMAL_CLOSE =
      MarketStatus._(3, _omitEnumNames ? '' : 'NORMAL_CLOSE');
  static const MarketStatus CLOSING_START =
      MarketStatus._(4, _omitEnumNames ? '' : 'CLOSING_START');
  static const MarketStatus CLOSING_END =
      MarketStatus._(5, _omitEnumNames ? '' : 'CLOSING_END');

  static const $core.List<MarketStatus> values = <MarketStatus>[
    PRE_OPEN_START,
    PRE_OPEN_END,
    NORMAL_OPEN,
    NORMAL_CLOSE,
    CLOSING_START,
    CLOSING_END,
  ];

  static final $core.List<MarketStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static MarketStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MarketStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
