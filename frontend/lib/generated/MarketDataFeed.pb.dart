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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/wrappers.pb.dart'
    as $0;

import 'MarketDataFeed.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'MarketDataFeed.pbenum.dart';

class LTPC extends $pb.GeneratedMessage {
  factory LTPC({
    $core.double? ltp,
    $fixnum.Int64? ltt,
    $fixnum.Int64? ltq,
    $core.double? cp,
    $0.DoubleValue? iep,
  }) {
    final result = create();
    if (ltp != null) result.ltp = ltp;
    if (ltt != null) result.ltt = ltt;
    if (ltq != null) result.ltq = ltq;
    if (cp != null) result.cp = cp;
    if (iep != null) result.iep = iep;
    return result;
  }

  LTPC._();

  factory LTPC.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LTPC.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LTPC',
      package: const $pb.PackageName(_omitMessageNames
          ? ''
          : 'com.upstox.marketdatafeederv3udapi.rpc.proto'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'ltp')
    ..aInt64(2, _omitFieldNames ? '' : 'ltt')
    ..aInt64(3, _omitFieldNames ? '' : 'ltq')
    ..aD(4, _omitFieldNames ? '' : 'cp')
    ..aOM<$0.DoubleValue>(5, _omitFieldNames ? '' : 'iep',
        subBuilder: $0.DoubleValue.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LTPC clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LTPC copyWith(void Function(LTPC) updates) =>
      super.copyWith((message) => updates(message as LTPC)) as LTPC;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LTPC create() => LTPC._();
  @$core.override
  LTPC createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LTPC getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LTPC>(create);
  static LTPC? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get ltp => $_getN(0);
  @$pb.TagNumber(1)
  set ltp($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLtp() => $_has(0);
  @$pb.TagNumber(1)
  void clearLtp() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get ltt => $_getI64(1);
  @$pb.TagNumber(2)
  set ltt($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLtt() => $_has(1);
  @$pb.TagNumber(2)
  void clearLtt() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get ltq => $_getI64(2);
  @$pb.TagNumber(3)
  set ltq($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLtq() => $_has(2);
  @$pb.TagNumber(3)
  void clearLtq() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get cp => $_getN(3);
  @$pb.TagNumber(4)
  set cp($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCp() => $_has(3);
  @$pb.TagNumber(4)
  void clearCp() => $_clearField(4);

  @$pb.TagNumber(5)
  $0.DoubleValue get iep => $_getN(4);
  @$pb.TagNumber(5)
  set iep($0.DoubleValue value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasIep() => $_has(4);
  @$pb.TagNumber(5)
  void clearIep() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.DoubleValue ensureIep() => $_ensure(4);
}

class MarketLevel extends $pb.GeneratedMessage {
  factory MarketLevel({
    $core.Iterable<Quote>? bidAskQuote,
  }) {
    final result = create();
    if (bidAskQuote != null) result.bidAskQuote.addAll(bidAskQuote);
    return result;
  }

  MarketLevel._();

  factory MarketLevel.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarketLevel.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarketLevel',
      package: const $pb.PackageName(_omitMessageNames
          ? ''
          : 'com.upstox.marketdatafeederv3udapi.rpc.proto'),
      createEmptyInstance: create)
    ..pPM<Quote>(1, _omitFieldNames ? '' : 'bidAskQuote',
        protoName: 'bidAskQuote', subBuilder: Quote.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketLevel clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketLevel copyWith(void Function(MarketLevel) updates) =>
      super.copyWith((message) => updates(message as MarketLevel))
          as MarketLevel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketLevel create() => MarketLevel._();
  @$core.override
  MarketLevel createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MarketLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarketLevel>(create);
  static MarketLevel? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Quote> get bidAskQuote => $_getList(0);
}

class MarketOHLC extends $pb.GeneratedMessage {
  factory MarketOHLC({
    $core.Iterable<OHLC>? ohlc,
  }) {
    final result = create();
    if (ohlc != null) result.ohlc.addAll(ohlc);
    return result;
  }

  MarketOHLC._();

  factory MarketOHLC.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarketOHLC.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarketOHLC',
      package: const $pb.PackageName(_omitMessageNames
          ? ''
          : 'com.upstox.marketdatafeederv3udapi.rpc.proto'),
      createEmptyInstance: create)
    ..pPM<OHLC>(1, _omitFieldNames ? '' : 'ohlc', subBuilder: OHLC.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketOHLC clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketOHLC copyWith(void Function(MarketOHLC) updates) =>
      super.copyWith((message) => updates(message as MarketOHLC)) as MarketOHLC;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketOHLC create() => MarketOHLC._();
  @$core.override
  MarketOHLC createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MarketOHLC getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarketOHLC>(create);
  static MarketOHLC? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<OHLC> get ohlc => $_getList(0);
}

class Quote extends $pb.GeneratedMessage {
  factory Quote({
    $fixnum.Int64? bidQ,
    $core.double? bidP,
    $fixnum.Int64? askQ,
    $core.double? askP,
  }) {
    final result = create();
    if (bidQ != null) result.bidQ = bidQ;
    if (bidP != null) result.bidP = bidP;
    if (askQ != null) result.askQ = askQ;
    if (askP != null) result.askP = askP;
    return result;
  }

  Quote._();

  factory Quote.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Quote.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Quote',
      package: const $pb.PackageName(_omitMessageNames
          ? ''
          : 'com.upstox.marketdatafeederv3udapi.rpc.proto'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'bidQ', protoName: 'bidQ')
    ..aD(2, _omitFieldNames ? '' : 'bidP', protoName: 'bidP')
    ..aInt64(3, _omitFieldNames ? '' : 'askQ', protoName: 'askQ')
    ..aD(4, _omitFieldNames ? '' : 'askP', protoName: 'askP')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Quote clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Quote copyWith(void Function(Quote) updates) =>
      super.copyWith((message) => updates(message as Quote)) as Quote;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Quote create() => Quote._();
  @$core.override
  Quote createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Quote getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Quote>(create);
  static Quote? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get bidQ => $_getI64(0);
  @$pb.TagNumber(1)
  set bidQ($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBidQ() => $_has(0);
  @$pb.TagNumber(1)
  void clearBidQ() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get bidP => $_getN(1);
  @$pb.TagNumber(2)
  set bidP($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBidP() => $_has(1);
  @$pb.TagNumber(2)
  void clearBidP() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get askQ => $_getI64(2);
  @$pb.TagNumber(3)
  set askQ($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAskQ() => $_has(2);
  @$pb.TagNumber(3)
  void clearAskQ() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get askP => $_getN(3);
  @$pb.TagNumber(4)
  set askP($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAskP() => $_has(3);
  @$pb.TagNumber(4)
  void clearAskP() => $_clearField(4);
}

class OptionGreeks extends $pb.GeneratedMessage {
  factory OptionGreeks({
    $core.double? delta,
    $core.double? theta,
    $core.double? gamma,
    $core.double? vega,
    $core.double? rho,
  }) {
    final result = create();
    if (delta != null) result.delta = delta;
    if (theta != null) result.theta = theta;
    if (gamma != null) result.gamma = gamma;
    if (vega != null) result.vega = vega;
    if (rho != null) result.rho = rho;
    return result;
  }

  OptionGreeks._();

  factory OptionGreeks.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OptionGreeks.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OptionGreeks',
      package: const $pb.PackageName(_omitMessageNames
          ? ''
          : 'com.upstox.marketdatafeederv3udapi.rpc.proto'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'delta')
    ..aD(2, _omitFieldNames ? '' : 'theta')
    ..aD(3, _omitFieldNames ? '' : 'gamma')
    ..aD(4, _omitFieldNames ? '' : 'vega')
    ..aD(5, _omitFieldNames ? '' : 'rho')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OptionGreeks clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OptionGreeks copyWith(void Function(OptionGreeks) updates) =>
      super.copyWith((message) => updates(message as OptionGreeks))
          as OptionGreeks;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OptionGreeks create() => OptionGreeks._();
  @$core.override
  OptionGreeks createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OptionGreeks getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OptionGreeks>(create);
  static OptionGreeks? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get delta => $_getN(0);
  @$pb.TagNumber(1)
  set delta($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDelta() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelta() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get theta => $_getN(1);
  @$pb.TagNumber(2)
  set theta($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTheta() => $_has(1);
  @$pb.TagNumber(2)
  void clearTheta() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get gamma => $_getN(2);
  @$pb.TagNumber(3)
  set gamma($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGamma() => $_has(2);
  @$pb.TagNumber(3)
  void clearGamma() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get vega => $_getN(3);
  @$pb.TagNumber(4)
  set vega($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVega() => $_has(3);
  @$pb.TagNumber(4)
  void clearVega() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get rho => $_getN(4);
  @$pb.TagNumber(5)
  set rho($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRho() => $_has(4);
  @$pb.TagNumber(5)
  void clearRho() => $_clearField(5);
}

class OHLC extends $pb.GeneratedMessage {
  factory OHLC({
    $core.String? interval,
    $core.double? open,
    $core.double? high,
    $core.double? low,
    $core.double? close,
    $fixnum.Int64? vol,
    $fixnum.Int64? ts,
  }) {
    final result = create();
    if (interval != null) result.interval = interval;
    if (open != null) result.open = open;
    if (high != null) result.high = high;
    if (low != null) result.low = low;
    if (close != null) result.close = close;
    if (vol != null) result.vol = vol;
    if (ts != null) result.ts = ts;
    return result;
  }

  OHLC._();

  factory OHLC.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OHLC.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OHLC',
      package: const $pb.PackageName(_omitMessageNames
          ? ''
          : 'com.upstox.marketdatafeederv3udapi.rpc.proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'interval')
    ..aD(2, _omitFieldNames ? '' : 'open')
    ..aD(3, _omitFieldNames ? '' : 'high')
    ..aD(4, _omitFieldNames ? '' : 'low')
    ..aD(5, _omitFieldNames ? '' : 'close')
    ..aInt64(6, _omitFieldNames ? '' : 'vol')
    ..aInt64(7, _omitFieldNames ? '' : 'ts')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OHLC clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OHLC copyWith(void Function(OHLC) updates) =>
      super.copyWith((message) => updates(message as OHLC)) as OHLC;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OHLC create() => OHLC._();
  @$core.override
  OHLC createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OHLC getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OHLC>(create);
  static OHLC? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get interval => $_getSZ(0);
  @$pb.TagNumber(1)
  set interval($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInterval() => $_has(0);
  @$pb.TagNumber(1)
  void clearInterval() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get open => $_getN(1);
  @$pb.TagNumber(2)
  set open($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOpen() => $_has(1);
  @$pb.TagNumber(2)
  void clearOpen() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get high => $_getN(2);
  @$pb.TagNumber(3)
  set high($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHigh() => $_has(2);
  @$pb.TagNumber(3)
  void clearHigh() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get low => $_getN(3);
  @$pb.TagNumber(4)
  set low($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLow() => $_has(3);
  @$pb.TagNumber(4)
  void clearLow() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get close => $_getN(4);
  @$pb.TagNumber(5)
  set close($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasClose() => $_has(4);
  @$pb.TagNumber(5)
  void clearClose() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get vol => $_getI64(5);
  @$pb.TagNumber(6)
  set vol($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasVol() => $_has(5);
  @$pb.TagNumber(6)
  void clearVol() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get ts => $_getI64(6);
  @$pb.TagNumber(7)
  set ts($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTs() => $_has(6);
  @$pb.TagNumber(7)
  void clearTs() => $_clearField(7);
}

class MarketFullFeed extends $pb.GeneratedMessage {
  factory MarketFullFeed({
    LTPC? ltpc,
    MarketLevel? marketLevel,
    OptionGreeks? optionGreeks,
    MarketOHLC? marketOHLC,
    $core.double? atp,
    $fixnum.Int64? vtt,
    $core.double? oi,
    $core.double? iv,
    $core.double? tbq,
    $core.double? tsq,
    $core.double? iep,
    $core.double? rp,
    $fixnum.Int64? ieq,
    $fixnum.Int64? iiqTotal,
    $fixnum.Int64? iiqM,
    $core.bool? casEligible,
  }) {
    final result = create();
    if (ltpc != null) result.ltpc = ltpc;
    if (marketLevel != null) result.marketLevel = marketLevel;
    if (optionGreeks != null) result.optionGreeks = optionGreeks;
    if (marketOHLC != null) result.marketOHLC = marketOHLC;
    if (atp != null) result.atp = atp;
    if (vtt != null) result.vtt = vtt;
    if (oi != null) result.oi = oi;
    if (iv != null) result.iv = iv;
    if (tbq != null) result.tbq = tbq;
    if (tsq != null) result.tsq = tsq;
    if (iep != null) result.iep = iep;
    if (rp != null) result.rp = rp;
    if (ieq != null) result.ieq = ieq;
    if (iiqTotal != null) result.iiqTotal = iiqTotal;
    if (iiqM != null) result.iiqM = iiqM;
    if (casEligible != null) result.casEligible = casEligible;
    return result;
  }

  MarketFullFeed._();

  factory MarketFullFeed.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarketFullFeed.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarketFullFeed',
      package: const $pb.PackageName(_omitMessageNames
          ? ''
          : 'com.upstox.marketdatafeederv3udapi.rpc.proto'),
      createEmptyInstance: create)
    ..aOM<LTPC>(1, _omitFieldNames ? '' : 'ltpc', subBuilder: LTPC.create)
    ..aOM<MarketLevel>(2, _omitFieldNames ? '' : 'marketLevel',
        protoName: 'marketLevel', subBuilder: MarketLevel.create)
    ..aOM<OptionGreeks>(3, _omitFieldNames ? '' : 'optionGreeks',
        protoName: 'optionGreeks', subBuilder: OptionGreeks.create)
    ..aOM<MarketOHLC>(4, _omitFieldNames ? '' : 'marketOHLC',
        protoName: 'marketOHLC', subBuilder: MarketOHLC.create)
    ..aD(5, _omitFieldNames ? '' : 'atp')
    ..aInt64(6, _omitFieldNames ? '' : 'vtt')
    ..aD(7, _omitFieldNames ? '' : 'oi')
    ..aD(8, _omitFieldNames ? '' : 'iv')
    ..aD(9, _omitFieldNames ? '' : 'tbq')
    ..aD(10, _omitFieldNames ? '' : 'tsq')
    ..aD(11, _omitFieldNames ? '' : 'iep')
    ..aD(12, _omitFieldNames ? '' : 'rp')
    ..aInt64(13, _omitFieldNames ? '' : 'ieq')
    ..aInt64(14, _omitFieldNames ? '' : 'iiqTotal', protoName: 'iiqTotal')
    ..aInt64(15, _omitFieldNames ? '' : 'iiqM', protoName: 'iiqM')
    ..aOB(16, _omitFieldNames ? '' : 'casEligible', protoName: 'casEligible')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketFullFeed clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketFullFeed copyWith(void Function(MarketFullFeed) updates) =>
      super.copyWith((message) => updates(message as MarketFullFeed))
          as MarketFullFeed;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketFullFeed create() => MarketFullFeed._();
  @$core.override
  MarketFullFeed createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MarketFullFeed getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarketFullFeed>(create);
  static MarketFullFeed? _defaultInstance;

  @$pb.TagNumber(1)
  LTPC get ltpc => $_getN(0);
  @$pb.TagNumber(1)
  set ltpc(LTPC value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLtpc() => $_has(0);
  @$pb.TagNumber(1)
  void clearLtpc() => $_clearField(1);
  @$pb.TagNumber(1)
  LTPC ensureLtpc() => $_ensure(0);

  @$pb.TagNumber(2)
  MarketLevel get marketLevel => $_getN(1);
  @$pb.TagNumber(2)
  set marketLevel(MarketLevel value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMarketLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarketLevel() => $_clearField(2);
  @$pb.TagNumber(2)
  MarketLevel ensureMarketLevel() => $_ensure(1);

  @$pb.TagNumber(3)
  OptionGreeks get optionGreeks => $_getN(2);
  @$pb.TagNumber(3)
  set optionGreeks(OptionGreeks value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasOptionGreeks() => $_has(2);
  @$pb.TagNumber(3)
  void clearOptionGreeks() => $_clearField(3);
  @$pb.TagNumber(3)
  OptionGreeks ensureOptionGreeks() => $_ensure(2);

  @$pb.TagNumber(4)
  MarketOHLC get marketOHLC => $_getN(3);
  @$pb.TagNumber(4)
  set marketOHLC(MarketOHLC value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasMarketOHLC() => $_has(3);
  @$pb.TagNumber(4)
  void clearMarketOHLC() => $_clearField(4);
  @$pb.TagNumber(4)
  MarketOHLC ensureMarketOHLC() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.double get atp => $_getN(4);
  @$pb.TagNumber(5)
  set atp($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAtp() => $_has(4);
  @$pb.TagNumber(5)
  void clearAtp() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get vtt => $_getI64(5);
  @$pb.TagNumber(6)
  set vtt($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasVtt() => $_has(5);
  @$pb.TagNumber(6)
  void clearVtt() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get oi => $_getN(6);
  @$pb.TagNumber(7)
  set oi($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasOi() => $_has(6);
  @$pb.TagNumber(7)
  void clearOi() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get iv => $_getN(7);
  @$pb.TagNumber(8)
  set iv($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIv() => $_has(7);
  @$pb.TagNumber(8)
  void clearIv() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get tbq => $_getN(8);
  @$pb.TagNumber(9)
  set tbq($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(9)
  $core.bool hasTbq() => $_has(8);
  @$pb.TagNumber(9)
  void clearTbq() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get tsq => $_getN(9);
  @$pb.TagNumber(10)
  set tsq($core.double value) => $_setDouble(9, value);
  @$pb.TagNumber(10)
  $core.bool hasTsq() => $_has(9);
  @$pb.TagNumber(10)
  void clearTsq() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.double get iep => $_getN(10);
  @$pb.TagNumber(11)
  set iep($core.double value) => $_setDouble(10, value);
  @$pb.TagNumber(11)
  $core.bool hasIep() => $_has(10);
  @$pb.TagNumber(11)
  void clearIep() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get rp => $_getN(11);
  @$pb.TagNumber(12)
  set rp($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(12)
  $core.bool hasRp() => $_has(11);
  @$pb.TagNumber(12)
  void clearRp() => $_clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get ieq => $_getI64(12);
  @$pb.TagNumber(13)
  set ieq($fixnum.Int64 value) => $_setInt64(12, value);
  @$pb.TagNumber(13)
  $core.bool hasIeq() => $_has(12);
  @$pb.TagNumber(13)
  void clearIeq() => $_clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get iiqTotal => $_getI64(13);
  @$pb.TagNumber(14)
  set iiqTotal($fixnum.Int64 value) => $_setInt64(13, value);
  @$pb.TagNumber(14)
  $core.bool hasIiqTotal() => $_has(13);
  @$pb.TagNumber(14)
  void clearIiqTotal() => $_clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get iiqM => $_getI64(14);
  @$pb.TagNumber(15)
  set iiqM($fixnum.Int64 value) => $_setInt64(14, value);
  @$pb.TagNumber(15)
  $core.bool hasIiqM() => $_has(14);
  @$pb.TagNumber(15)
  void clearIiqM() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.bool get casEligible => $_getBF(15);
  @$pb.TagNumber(16)
  set casEligible($core.bool value) => $_setBool(15, value);
  @$pb.TagNumber(16)
  $core.bool hasCasEligible() => $_has(15);
  @$pb.TagNumber(16)
  void clearCasEligible() => $_clearField(16);
}

class IndexFullFeed extends $pb.GeneratedMessage {
  factory IndexFullFeed({
    LTPC? ltpc,
    MarketOHLC? marketOHLC,
  }) {
    final result = create();
    if (ltpc != null) result.ltpc = ltpc;
    if (marketOHLC != null) result.marketOHLC = marketOHLC;
    return result;
  }

  IndexFullFeed._();

  factory IndexFullFeed.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IndexFullFeed.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IndexFullFeed',
      package: const $pb.PackageName(_omitMessageNames
          ? ''
          : 'com.upstox.marketdatafeederv3udapi.rpc.proto'),
      createEmptyInstance: create)
    ..aOM<LTPC>(1, _omitFieldNames ? '' : 'ltpc', subBuilder: LTPC.create)
    ..aOM<MarketOHLC>(2, _omitFieldNames ? '' : 'marketOHLC',
        protoName: 'marketOHLC', subBuilder: MarketOHLC.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IndexFullFeed clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IndexFullFeed copyWith(void Function(IndexFullFeed) updates) =>
      super.copyWith((message) => updates(message as IndexFullFeed))
          as IndexFullFeed;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IndexFullFeed create() => IndexFullFeed._();
  @$core.override
  IndexFullFeed createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IndexFullFeed getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IndexFullFeed>(create);
  static IndexFullFeed? _defaultInstance;

  @$pb.TagNumber(1)
  LTPC get ltpc => $_getN(0);
  @$pb.TagNumber(1)
  set ltpc(LTPC value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLtpc() => $_has(0);
  @$pb.TagNumber(1)
  void clearLtpc() => $_clearField(1);
  @$pb.TagNumber(1)
  LTPC ensureLtpc() => $_ensure(0);

  @$pb.TagNumber(2)
  MarketOHLC get marketOHLC => $_getN(1);
  @$pb.TagNumber(2)
  set marketOHLC(MarketOHLC value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMarketOHLC() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarketOHLC() => $_clearField(2);
  @$pb.TagNumber(2)
  MarketOHLC ensureMarketOHLC() => $_ensure(1);
}

enum FullFeed_FullFeedUnion { marketFF, indexFF, notSet }

class FullFeed extends $pb.GeneratedMessage {
  factory FullFeed({
    MarketFullFeed? marketFF,
    IndexFullFeed? indexFF,
  }) {
    final result = create();
    if (marketFF != null) result.marketFF = marketFF;
    if (indexFF != null) result.indexFF = indexFF;
    return result;
  }

  FullFeed._();

  factory FullFeed.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FullFeed.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, FullFeed_FullFeedUnion>
      _FullFeed_FullFeedUnionByTag = {
    1: FullFeed_FullFeedUnion.marketFF,
    2: FullFeed_FullFeedUnion.indexFF,
    0: FullFeed_FullFeedUnion.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FullFeed',
      package: const $pb.PackageName(_omitMessageNames
          ? ''
          : 'com.upstox.marketdatafeederv3udapi.rpc.proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<MarketFullFeed>(1, _omitFieldNames ? '' : 'marketFF',
        protoName: 'marketFF', subBuilder: MarketFullFeed.create)
    ..aOM<IndexFullFeed>(2, _omitFieldNames ? '' : 'indexFF',
        protoName: 'indexFF', subBuilder: IndexFullFeed.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FullFeed clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FullFeed copyWith(void Function(FullFeed) updates) =>
      super.copyWith((message) => updates(message as FullFeed)) as FullFeed;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FullFeed create() => FullFeed._();
  @$core.override
  FullFeed createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FullFeed getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FullFeed>(create);
  static FullFeed? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  FullFeed_FullFeedUnion whichFullFeedUnion() =>
      _FullFeed_FullFeedUnionByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearFullFeedUnion() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  MarketFullFeed get marketFF => $_getN(0);
  @$pb.TagNumber(1)
  set marketFF(MarketFullFeed value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMarketFF() => $_has(0);
  @$pb.TagNumber(1)
  void clearMarketFF() => $_clearField(1);
  @$pb.TagNumber(1)
  MarketFullFeed ensureMarketFF() => $_ensure(0);

  @$pb.TagNumber(2)
  IndexFullFeed get indexFF => $_getN(1);
  @$pb.TagNumber(2)
  set indexFF(IndexFullFeed value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasIndexFF() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndexFF() => $_clearField(2);
  @$pb.TagNumber(2)
  IndexFullFeed ensureIndexFF() => $_ensure(1);
}

class FirstLevelWithGreeks extends $pb.GeneratedMessage {
  factory FirstLevelWithGreeks({
    LTPC? ltpc,
    Quote? firstDepth,
    OptionGreeks? optionGreeks,
    $fixnum.Int64? vtt,
    $core.double? oi,
    $core.double? iv,
  }) {
    final result = create();
    if (ltpc != null) result.ltpc = ltpc;
    if (firstDepth != null) result.firstDepth = firstDepth;
    if (optionGreeks != null) result.optionGreeks = optionGreeks;
    if (vtt != null) result.vtt = vtt;
    if (oi != null) result.oi = oi;
    if (iv != null) result.iv = iv;
    return result;
  }

  FirstLevelWithGreeks._();

  factory FirstLevelWithGreeks.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FirstLevelWithGreeks.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FirstLevelWithGreeks',
      package: const $pb.PackageName(_omitMessageNames
          ? ''
          : 'com.upstox.marketdatafeederv3udapi.rpc.proto'),
      createEmptyInstance: create)
    ..aOM<LTPC>(1, _omitFieldNames ? '' : 'ltpc', subBuilder: LTPC.create)
    ..aOM<Quote>(2, _omitFieldNames ? '' : 'firstDepth',
        protoName: 'firstDepth', subBuilder: Quote.create)
    ..aOM<OptionGreeks>(3, _omitFieldNames ? '' : 'optionGreeks',
        protoName: 'optionGreeks', subBuilder: OptionGreeks.create)
    ..aInt64(4, _omitFieldNames ? '' : 'vtt')
    ..aD(5, _omitFieldNames ? '' : 'oi')
    ..aD(6, _omitFieldNames ? '' : 'iv')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FirstLevelWithGreeks clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FirstLevelWithGreeks copyWith(void Function(FirstLevelWithGreeks) updates) =>
      super.copyWith((message) => updates(message as FirstLevelWithGreeks))
          as FirstLevelWithGreeks;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FirstLevelWithGreeks create() => FirstLevelWithGreeks._();
  @$core.override
  FirstLevelWithGreeks createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FirstLevelWithGreeks getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FirstLevelWithGreeks>(create);
  static FirstLevelWithGreeks? _defaultInstance;

  @$pb.TagNumber(1)
  LTPC get ltpc => $_getN(0);
  @$pb.TagNumber(1)
  set ltpc(LTPC value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLtpc() => $_has(0);
  @$pb.TagNumber(1)
  void clearLtpc() => $_clearField(1);
  @$pb.TagNumber(1)
  LTPC ensureLtpc() => $_ensure(0);

  @$pb.TagNumber(2)
  Quote get firstDepth => $_getN(1);
  @$pb.TagNumber(2)
  set firstDepth(Quote value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFirstDepth() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstDepth() => $_clearField(2);
  @$pb.TagNumber(2)
  Quote ensureFirstDepth() => $_ensure(1);

  @$pb.TagNumber(3)
  OptionGreeks get optionGreeks => $_getN(2);
  @$pb.TagNumber(3)
  set optionGreeks(OptionGreeks value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasOptionGreeks() => $_has(2);
  @$pb.TagNumber(3)
  void clearOptionGreeks() => $_clearField(3);
  @$pb.TagNumber(3)
  OptionGreeks ensureOptionGreeks() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get vtt => $_getI64(3);
  @$pb.TagNumber(4)
  set vtt($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVtt() => $_has(3);
  @$pb.TagNumber(4)
  void clearVtt() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get oi => $_getN(4);
  @$pb.TagNumber(5)
  set oi($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOi() => $_has(4);
  @$pb.TagNumber(5)
  void clearOi() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get iv => $_getN(5);
  @$pb.TagNumber(6)
  set iv($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIv() => $_has(5);
  @$pb.TagNumber(6)
  void clearIv() => $_clearField(6);
}

enum Feed_FeedUnion { ltpc, fullFeed, firstLevelWithGreeks, notSet }

class Feed extends $pb.GeneratedMessage {
  factory Feed({
    LTPC? ltpc,
    FullFeed? fullFeed,
    FirstLevelWithGreeks? firstLevelWithGreeks,
    RequestMode? requestMode,
  }) {
    final result = create();
    if (ltpc != null) result.ltpc = ltpc;
    if (fullFeed != null) result.fullFeed = fullFeed;
    if (firstLevelWithGreeks != null)
      result.firstLevelWithGreeks = firstLevelWithGreeks;
    if (requestMode != null) result.requestMode = requestMode;
    return result;
  }

  Feed._();

  factory Feed.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Feed.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Feed_FeedUnion> _Feed_FeedUnionByTag = {
    1: Feed_FeedUnion.ltpc,
    2: Feed_FeedUnion.fullFeed,
    3: Feed_FeedUnion.firstLevelWithGreeks,
    0: Feed_FeedUnion.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Feed',
      package: const $pb.PackageName(_omitMessageNames
          ? ''
          : 'com.upstox.marketdatafeederv3udapi.rpc.proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<LTPC>(1, _omitFieldNames ? '' : 'ltpc', subBuilder: LTPC.create)
    ..aOM<FullFeed>(2, _omitFieldNames ? '' : 'fullFeed',
        protoName: 'fullFeed', subBuilder: FullFeed.create)
    ..aOM<FirstLevelWithGreeks>(
        3, _omitFieldNames ? '' : 'firstLevelWithGreeks',
        protoName: 'firstLevelWithGreeks',
        subBuilder: FirstLevelWithGreeks.create)
    ..aE<RequestMode>(4, _omitFieldNames ? '' : 'requestMode',
        protoName: 'requestMode', enumValues: RequestMode.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Feed clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Feed copyWith(void Function(Feed) updates) =>
      super.copyWith((message) => updates(message as Feed)) as Feed;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Feed create() => Feed._();
  @$core.override
  Feed createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Feed getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Feed>(create);
  static Feed? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  Feed_FeedUnion whichFeedUnion() => _Feed_FeedUnionByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearFeedUnion() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  LTPC get ltpc => $_getN(0);
  @$pb.TagNumber(1)
  set ltpc(LTPC value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLtpc() => $_has(0);
  @$pb.TagNumber(1)
  void clearLtpc() => $_clearField(1);
  @$pb.TagNumber(1)
  LTPC ensureLtpc() => $_ensure(0);

  @$pb.TagNumber(2)
  FullFeed get fullFeed => $_getN(1);
  @$pb.TagNumber(2)
  set fullFeed(FullFeed value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFullFeed() => $_has(1);
  @$pb.TagNumber(2)
  void clearFullFeed() => $_clearField(2);
  @$pb.TagNumber(2)
  FullFeed ensureFullFeed() => $_ensure(1);

  @$pb.TagNumber(3)
  FirstLevelWithGreeks get firstLevelWithGreeks => $_getN(2);
  @$pb.TagNumber(3)
  set firstLevelWithGreeks(FirstLevelWithGreeks value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFirstLevelWithGreeks() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstLevelWithGreeks() => $_clearField(3);
  @$pb.TagNumber(3)
  FirstLevelWithGreeks ensureFirstLevelWithGreeks() => $_ensure(2);

  @$pb.TagNumber(4)
  RequestMode get requestMode => $_getN(3);
  @$pb.TagNumber(4)
  set requestMode(RequestMode value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRequestMode() => $_has(3);
  @$pb.TagNumber(4)
  void clearRequestMode() => $_clearField(4);
}

class StatusInfo extends $pb.GeneratedMessage {
  factory StatusInfo({
    $core.String? status,
    $fixnum.Int64? updatedTime,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (updatedTime != null) result.updatedTime = updatedTime;
    return result;
  }

  StatusInfo._();

  factory StatusInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StatusInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StatusInfo',
      package: const $pb.PackageName(_omitMessageNames
          ? ''
          : 'com.upstox.marketdatafeederv3udapi.rpc.proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..aInt64(2, _omitFieldNames ? '' : 'updatedTime', protoName: 'updatedTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StatusInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StatusInfo copyWith(void Function(StatusInfo) updates) =>
      super.copyWith((message) => updates(message as StatusInfo)) as StatusInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StatusInfo create() => StatusInfo._();
  @$core.override
  StatusInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StatusInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StatusInfo>(create);
  static StatusInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get updatedTime => $_getI64(1);
  @$pb.TagNumber(2)
  set updatedTime($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUpdatedTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdatedTime() => $_clearField(2);
}

class MarketInfo extends $pb.GeneratedMessage {
  factory MarketInfo({
    $core.Iterable<$core.MapEntry<$core.String, MarketStatus>>? segmentStatus,
    $core.Iterable<$core.MapEntry<$core.String, StatusInfo>>? casMarketStatus,
    $core.Iterable<$core.MapEntry<$core.String, StatusInfo>>?
        preOpenSessionStatus,
  }) {
    final result = create();
    if (segmentStatus != null) result.segmentStatus.addEntries(segmentStatus);
    if (casMarketStatus != null)
      result.casMarketStatus.addEntries(casMarketStatus);
    if (preOpenSessionStatus != null)
      result.preOpenSessionStatus.addEntries(preOpenSessionStatus);
    return result;
  }

  MarketInfo._();

  factory MarketInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarketInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarketInfo',
      package: const $pb.PackageName(_omitMessageNames
          ? ''
          : 'com.upstox.marketdatafeederv3udapi.rpc.proto'),
      createEmptyInstance: create)
    ..m<$core.String, MarketStatus>(1, _omitFieldNames ? '' : 'segmentStatus',
        protoName: 'segmentStatus',
        entryClassName: 'MarketInfo.SegmentStatusEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OE,
        valueOf: MarketStatus.valueOf,
        enumValues: MarketStatus.values,
        valueDefaultOrMaker: MarketStatus.PRE_OPEN_START,
        defaultEnumValue: MarketStatus.PRE_OPEN_START,
        packageName: const $pb.PackageName(
            'com.upstox.marketdatafeederv3udapi.rpc.proto'))
    ..m<$core.String, StatusInfo>(2, _omitFieldNames ? '' : 'casMarketStatus',
        protoName: 'casMarketStatus',
        entryClassName: 'MarketInfo.CasMarketStatusEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: StatusInfo.create,
        valueDefaultOrMaker: StatusInfo.getDefault,
        packageName: const $pb.PackageName(
            'com.upstox.marketdatafeederv3udapi.rpc.proto'))
    ..m<$core.String, StatusInfo>(
        3, _omitFieldNames ? '' : 'preOpenSessionStatus',
        protoName: 'preOpenSessionStatus',
        entryClassName: 'MarketInfo.PreOpenSessionStatusEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: StatusInfo.create,
        valueDefaultOrMaker: StatusInfo.getDefault,
        packageName: const $pb.PackageName(
            'com.upstox.marketdatafeederv3udapi.rpc.proto'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketInfo copyWith(void Function(MarketInfo) updates) =>
      super.copyWith((message) => updates(message as MarketInfo)) as MarketInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketInfo create() => MarketInfo._();
  @$core.override
  MarketInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MarketInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarketInfo>(create);
  static MarketInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, MarketStatus> get segmentStatus => $_getMap(0);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, StatusInfo> get casMarketStatus => $_getMap(1);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, StatusInfo> get preOpenSessionStatus => $_getMap(2);
}

class FeedResponse extends $pb.GeneratedMessage {
  factory FeedResponse({
    Type? type,
    $core.Iterable<$core.MapEntry<$core.String, Feed>>? feeds,
    $fixnum.Int64? currentTs,
    MarketInfo? marketInfo,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (feeds != null) result.feeds.addEntries(feeds);
    if (currentTs != null) result.currentTs = currentTs;
    if (marketInfo != null) result.marketInfo = marketInfo;
    return result;
  }

  FeedResponse._();

  factory FeedResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FeedResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FeedResponse',
      package: const $pb.PackageName(_omitMessageNames
          ? ''
          : 'com.upstox.marketdatafeederv3udapi.rpc.proto'),
      createEmptyInstance: create)
    ..aE<Type>(1, _omitFieldNames ? '' : 'type', enumValues: Type.values)
    ..m<$core.String, Feed>(2, _omitFieldNames ? '' : 'feeds',
        entryClassName: 'FeedResponse.FeedsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: Feed.create,
        valueDefaultOrMaker: Feed.getDefault,
        packageName: const $pb.PackageName(
            'com.upstox.marketdatafeederv3udapi.rpc.proto'))
    ..aInt64(3, _omitFieldNames ? '' : 'currentTs', protoName: 'currentTs')
    ..aOM<MarketInfo>(4, _omitFieldNames ? '' : 'marketInfo',
        protoName: 'marketInfo', subBuilder: MarketInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FeedResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FeedResponse copyWith(void Function(FeedResponse) updates) =>
      super.copyWith((message) => updates(message as FeedResponse))
          as FeedResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FeedResponse create() => FeedResponse._();
  @$core.override
  FeedResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FeedResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FeedResponse>(create);
  static FeedResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Type get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Type value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, Feed> get feeds => $_getMap(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get currentTs => $_getI64(2);
  @$pb.TagNumber(3)
  set currentTs($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCurrentTs() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentTs() => $_clearField(3);

  @$pb.TagNumber(4)
  MarketInfo get marketInfo => $_getN(3);
  @$pb.TagNumber(4)
  set marketInfo(MarketInfo value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasMarketInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMarketInfo() => $_clearField(4);
  @$pb.TagNumber(4)
  MarketInfo ensureMarketInfo() => $_ensure(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
