// This is a generated file - do not edit.
//
// Generated from MarketDataFeed.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use typeDescriptor instead')
const Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'initial_feed', '2': 0},
    {'1': 'live_feed', '2': 1},
    {'1': 'market_info', '2': 2},
  ],
};

/// Descriptor for `Type`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List typeDescriptor = $convert.base64Decode(
    'CgRUeXBlEhAKDGluaXRpYWxfZmVlZBAAEg0KCWxpdmVfZmVlZBABEg8KC21hcmtldF9pbmZvEA'
    'I=');

@$core.Deprecated('Use requestModeDescriptor instead')
const RequestMode$json = {
  '1': 'RequestMode',
  '2': [
    {'1': 'ltpc', '2': 0},
    {'1': 'full_d5', '2': 1},
    {'1': 'option_greeks', '2': 2},
    {'1': 'full_d30', '2': 3},
  ],
};

/// Descriptor for `RequestMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List requestModeDescriptor = $convert.base64Decode(
    'CgtSZXF1ZXN0TW9kZRIICgRsdHBjEAASCwoHZnVsbF9kNRABEhEKDW9wdGlvbl9ncmVla3MQAh'
    'IMCghmdWxsX2QzMBAD');

@$core.Deprecated('Use marketStatusDescriptor instead')
const MarketStatus$json = {
  '1': 'MarketStatus',
  '2': [
    {'1': 'PRE_OPEN_START', '2': 0},
    {'1': 'PRE_OPEN_END', '2': 1},
    {'1': 'NORMAL_OPEN', '2': 2},
    {'1': 'NORMAL_CLOSE', '2': 3},
    {'1': 'CLOSING_START', '2': 4},
    {'1': 'CLOSING_END', '2': 5},
  ],
};

/// Descriptor for `MarketStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List marketStatusDescriptor = $convert.base64Decode(
    'CgxNYXJrZXRTdGF0dXMSEgoOUFJFX09QRU5fU1RBUlQQABIQCgxQUkVfT1BFTl9FTkQQARIPCg'
    'tOT1JNQUxfT1BFThACEhAKDE5PUk1BTF9DTE9TRRADEhEKDUNMT1NJTkdfU1RBUlQQBBIPCgtD'
    'TE9TSU5HX0VORBAF');

@$core.Deprecated('Use lTPCDescriptor instead')
const LTPC$json = {
  '1': 'LTPC',
  '2': [
    {'1': 'ltp', '3': 1, '4': 1, '5': 1, '10': 'ltp'},
    {'1': 'ltt', '3': 2, '4': 1, '5': 3, '10': 'ltt'},
    {'1': 'ltq', '3': 3, '4': 1, '5': 3, '10': 'ltq'},
    {'1': 'cp', '3': 4, '4': 1, '5': 1, '10': 'cp'},
    {
      '1': 'iep',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.DoubleValue',
      '10': 'iep'
    },
  ],
};

/// Descriptor for `LTPC`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lTPCDescriptor = $convert.base64Decode(
    'CgRMVFBDEhAKA2x0cBgBIAEoAVIDbHRwEhAKA2x0dBgCIAEoA1IDbHR0EhAKA2x0cRgDIAEoA1'
    'IDbHRxEg4KAmNwGAQgASgBUgJjcBIuCgNpZXAYBSABKAsyHC5nb29nbGUucHJvdG9idWYuRG91'
    'YmxlVmFsdWVSA2llcA==');

@$core.Deprecated('Use marketLevelDescriptor instead')
const MarketLevel$json = {
  '1': 'MarketLevel',
  '2': [
    {
      '1': 'bidAskQuote',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.Quote',
      '10': 'bidAskQuote'
    },
  ],
};

/// Descriptor for `MarketLevel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketLevelDescriptor = $convert.base64Decode(
    'CgtNYXJrZXRMZXZlbBJVCgtiaWRBc2tRdW90ZRgBIAMoCzIzLmNvbS51cHN0b3gubWFya2V0ZG'
    'F0YWZlZWRlcnYzdWRhcGkucnBjLnByb3RvLlF1b3RlUgtiaWRBc2tRdW90ZQ==');

@$core.Deprecated('Use marketOHLCDescriptor instead')
const MarketOHLC$json = {
  '1': 'MarketOHLC',
  '2': [
    {
      '1': 'ohlc',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.OHLC',
      '10': 'ohlc'
    },
  ],
};

/// Descriptor for `MarketOHLC`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketOHLCDescriptor = $convert.base64Decode(
    'CgpNYXJrZXRPSExDEkYKBG9obGMYASADKAsyMi5jb20udXBzdG94Lm1hcmtldGRhdGFmZWVkZX'
    'J2M3VkYXBpLnJwYy5wcm90by5PSExDUgRvaGxj');

@$core.Deprecated('Use quoteDescriptor instead')
const Quote$json = {
  '1': 'Quote',
  '2': [
    {'1': 'bidQ', '3': 1, '4': 1, '5': 3, '10': 'bidQ'},
    {'1': 'bidP', '3': 2, '4': 1, '5': 1, '10': 'bidP'},
    {'1': 'askQ', '3': 3, '4': 1, '5': 3, '10': 'askQ'},
    {'1': 'askP', '3': 4, '4': 1, '5': 1, '10': 'askP'},
  ],
};

/// Descriptor for `Quote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List quoteDescriptor = $convert.base64Decode(
    'CgVRdW90ZRISCgRiaWRRGAEgASgDUgRiaWRREhIKBGJpZFAYAiABKAFSBGJpZFASEgoEYXNrUR'
    'gDIAEoA1IEYXNrURISCgRhc2tQGAQgASgBUgRhc2tQ');

@$core.Deprecated('Use optionGreeksDescriptor instead')
const OptionGreeks$json = {
  '1': 'OptionGreeks',
  '2': [
    {'1': 'delta', '3': 1, '4': 1, '5': 1, '10': 'delta'},
    {'1': 'theta', '3': 2, '4': 1, '5': 1, '10': 'theta'},
    {'1': 'gamma', '3': 3, '4': 1, '5': 1, '10': 'gamma'},
    {'1': 'vega', '3': 4, '4': 1, '5': 1, '10': 'vega'},
    {'1': 'rho', '3': 5, '4': 1, '5': 1, '10': 'rho'},
  ],
};

/// Descriptor for `OptionGreeks`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List optionGreeksDescriptor = $convert.base64Decode(
    'CgxPcHRpb25HcmVla3MSFAoFZGVsdGEYASABKAFSBWRlbHRhEhQKBXRoZXRhGAIgASgBUgV0aG'
    'V0YRIUCgVnYW1tYRgDIAEoAVIFZ2FtbWESEgoEdmVnYRgEIAEoAVIEdmVnYRIQCgNyaG8YBSAB'
    'KAFSA3Jobw==');

@$core.Deprecated('Use oHLCDescriptor instead')
const OHLC$json = {
  '1': 'OHLC',
  '2': [
    {'1': 'interval', '3': 1, '4': 1, '5': 9, '10': 'interval'},
    {'1': 'open', '3': 2, '4': 1, '5': 1, '10': 'open'},
    {'1': 'high', '3': 3, '4': 1, '5': 1, '10': 'high'},
    {'1': 'low', '3': 4, '4': 1, '5': 1, '10': 'low'},
    {'1': 'close', '3': 5, '4': 1, '5': 1, '10': 'close'},
    {'1': 'vol', '3': 6, '4': 1, '5': 3, '10': 'vol'},
    {'1': 'ts', '3': 7, '4': 1, '5': 3, '10': 'ts'},
  ],
};

/// Descriptor for `OHLC`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List oHLCDescriptor = $convert.base64Decode(
    'CgRPSExDEhoKCGludGVydmFsGAEgASgJUghpbnRlcnZhbBISCgRvcGVuGAIgASgBUgRvcGVuEh'
    'IKBGhpZ2gYAyABKAFSBGhpZ2gSEAoDbG93GAQgASgBUgNsb3cSFAoFY2xvc2UYBSABKAFSBWNs'
    'b3NlEhAKA3ZvbBgGIAEoA1IDdm9sEg4KAnRzGAcgASgDUgJ0cw==');

@$core.Deprecated('Use marketFullFeedDescriptor instead')
const MarketFullFeed$json = {
  '1': 'MarketFullFeed',
  '2': [
    {
      '1': 'ltpc',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.LTPC',
      '10': 'ltpc'
    },
    {
      '1': 'marketLevel',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.MarketLevel',
      '10': 'marketLevel'
    },
    {
      '1': 'optionGreeks',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.OptionGreeks',
      '10': 'optionGreeks'
    },
    {
      '1': 'marketOHLC',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.MarketOHLC',
      '10': 'marketOHLC'
    },
    {'1': 'atp', '3': 5, '4': 1, '5': 1, '10': 'atp'},
    {'1': 'vtt', '3': 6, '4': 1, '5': 3, '10': 'vtt'},
    {'1': 'oi', '3': 7, '4': 1, '5': 1, '10': 'oi'},
    {'1': 'iv', '3': 8, '4': 1, '5': 1, '10': 'iv'},
    {'1': 'tbq', '3': 9, '4': 1, '5': 1, '10': 'tbq'},
    {'1': 'tsq', '3': 10, '4': 1, '5': 1, '10': 'tsq'},
    {'1': 'iep', '3': 11, '4': 1, '5': 1, '10': 'iep'},
    {'1': 'rp', '3': 12, '4': 1, '5': 1, '10': 'rp'},
    {'1': 'ieq', '3': 13, '4': 1, '5': 3, '10': 'ieq'},
    {'1': 'iiqTotal', '3': 14, '4': 1, '5': 3, '10': 'iiqTotal'},
    {'1': 'iiqM', '3': 15, '4': 1, '5': 3, '10': 'iiqM'},
    {'1': 'casEligible', '3': 16, '4': 1, '5': 8, '10': 'casEligible'},
  ],
};

/// Descriptor for `MarketFullFeed`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketFullFeedDescriptor = $convert.base64Decode(
    'Cg5NYXJrZXRGdWxsRmVlZBJGCgRsdHBjGAEgASgLMjIuY29tLnVwc3RveC5tYXJrZXRkYXRhZm'
    'VlZGVydjN1ZGFwaS5ycGMucHJvdG8uTFRQQ1IEbHRwYxJbCgttYXJrZXRMZXZlbBgCIAEoCzI5'
    'LmNvbS51cHN0b3gubWFya2V0ZGF0YWZlZWRlcnYzdWRhcGkucnBjLnByb3RvLk1hcmtldExldm'
    'VsUgttYXJrZXRMZXZlbBJeCgxvcHRpb25HcmVla3MYAyABKAsyOi5jb20udXBzdG94Lm1hcmtl'
    'dGRhdGFmZWVkZXJ2M3VkYXBpLnJwYy5wcm90by5PcHRpb25HcmVla3NSDG9wdGlvbkdyZWVrcx'
    'JYCgptYXJrZXRPSExDGAQgASgLMjguY29tLnVwc3RveC5tYXJrZXRkYXRhZmVlZGVydjN1ZGFw'
    'aS5ycGMucHJvdG8uTWFya2V0T0hMQ1IKbWFya2V0T0hMQxIQCgNhdHAYBSABKAFSA2F0cBIQCg'
    'N2dHQYBiABKANSA3Z0dBIOCgJvaRgHIAEoAVICb2kSDgoCaXYYCCABKAFSAml2EhAKA3RicRgJ'
    'IAEoAVIDdGJxEhAKA3RzcRgKIAEoAVIDdHNxEhAKA2llcBgLIAEoAVIDaWVwEg4KAnJwGAwgAS'
    'gBUgJycBIQCgNpZXEYDSABKANSA2llcRIaCghpaXFUb3RhbBgOIAEoA1IIaWlxVG90YWwSEgoE'
    'aWlxTRgPIAEoA1IEaWlxTRIgCgtjYXNFbGlnaWJsZRgQIAEoCFILY2FzRWxpZ2libGU=');

@$core.Deprecated('Use indexFullFeedDescriptor instead')
const IndexFullFeed$json = {
  '1': 'IndexFullFeed',
  '2': [
    {
      '1': 'ltpc',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.LTPC',
      '10': 'ltpc'
    },
    {
      '1': 'marketOHLC',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.MarketOHLC',
      '10': 'marketOHLC'
    },
  ],
};

/// Descriptor for `IndexFullFeed`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List indexFullFeedDescriptor = $convert.base64Decode(
    'Cg1JbmRleEZ1bGxGZWVkEkYKBGx0cGMYASABKAsyMi5jb20udXBzdG94Lm1hcmtldGRhdGFmZW'
    'VkZXJ2M3VkYXBpLnJwYy5wcm90by5MVFBDUgRsdHBjElgKCm1hcmtldE9ITEMYAiABKAsyOC5j'
    'b20udXBzdG94Lm1hcmtldGRhdGFmZWVkZXJ2M3VkYXBpLnJwYy5wcm90by5NYXJrZXRPSExDUg'
    'ptYXJrZXRPSExD');

@$core.Deprecated('Use fullFeedDescriptor instead')
const FullFeed$json = {
  '1': 'FullFeed',
  '2': [
    {
      '1': 'marketFF',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.MarketFullFeed',
      '9': 0,
      '10': 'marketFF'
    },
    {
      '1': 'indexFF',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.IndexFullFeed',
      '9': 0,
      '10': 'indexFF'
    },
  ],
  '8': [
    {'1': 'FullFeedUnion'},
  ],
};

/// Descriptor for `FullFeed`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fullFeedDescriptor = $convert.base64Decode(
    'CghGdWxsRmVlZBJaCghtYXJrZXRGRhgBIAEoCzI8LmNvbS51cHN0b3gubWFya2V0ZGF0YWZlZW'
    'RlcnYzdWRhcGkucnBjLnByb3RvLk1hcmtldEZ1bGxGZWVkSABSCG1hcmtldEZGElcKB2luZGV4'
    'RkYYAiABKAsyOy5jb20udXBzdG94Lm1hcmtldGRhdGFmZWVkZXJ2M3VkYXBpLnJwYy5wcm90by'
    '5JbmRleEZ1bGxGZWVkSABSB2luZGV4RkZCDwoNRnVsbEZlZWRVbmlvbg==');

@$core.Deprecated('Use firstLevelWithGreeksDescriptor instead')
const FirstLevelWithGreeks$json = {
  '1': 'FirstLevelWithGreeks',
  '2': [
    {
      '1': 'ltpc',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.LTPC',
      '10': 'ltpc'
    },
    {
      '1': 'firstDepth',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.Quote',
      '10': 'firstDepth'
    },
    {
      '1': 'optionGreeks',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.OptionGreeks',
      '10': 'optionGreeks'
    },
    {'1': 'vtt', '3': 4, '4': 1, '5': 3, '10': 'vtt'},
    {'1': 'oi', '3': 5, '4': 1, '5': 1, '10': 'oi'},
    {'1': 'iv', '3': 6, '4': 1, '5': 1, '10': 'iv'},
  ],
};

/// Descriptor for `FirstLevelWithGreeks`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List firstLevelWithGreeksDescriptor = $convert.base64Decode(
    'ChRGaXJzdExldmVsV2l0aEdyZWVrcxJGCgRsdHBjGAEgASgLMjIuY29tLnVwc3RveC5tYXJrZX'
    'RkYXRhZmVlZGVydjN1ZGFwaS5ycGMucHJvdG8uTFRQQ1IEbHRwYxJTCgpmaXJzdERlcHRoGAIg'
    'ASgLMjMuY29tLnVwc3RveC5tYXJrZXRkYXRhZmVlZGVydjN1ZGFwaS5ycGMucHJvdG8uUXVvdG'
    'VSCmZpcnN0RGVwdGgSXgoMb3B0aW9uR3JlZWtzGAMgASgLMjouY29tLnVwc3RveC5tYXJrZXRk'
    'YXRhZmVlZGVydjN1ZGFwaS5ycGMucHJvdG8uT3B0aW9uR3JlZWtzUgxvcHRpb25HcmVla3MSEA'
    'oDdnR0GAQgASgDUgN2dHQSDgoCb2kYBSABKAFSAm9pEg4KAml2GAYgASgBUgJpdg==');

@$core.Deprecated('Use feedDescriptor instead')
const Feed$json = {
  '1': 'Feed',
  '2': [
    {
      '1': 'ltpc',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.LTPC',
      '9': 0,
      '10': 'ltpc'
    },
    {
      '1': 'fullFeed',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.FullFeed',
      '9': 0,
      '10': 'fullFeed'
    },
    {
      '1': 'firstLevelWithGreeks',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.FirstLevelWithGreeks',
      '9': 0,
      '10': 'firstLevelWithGreeks'
    },
    {
      '1': 'requestMode',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.RequestMode',
      '10': 'requestMode'
    },
  ],
  '8': [
    {'1': 'FeedUnion'},
  ],
};

/// Descriptor for `Feed`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedDescriptor = $convert.base64Decode(
    'CgRGZWVkEkgKBGx0cGMYASABKAsyMi5jb20udXBzdG94Lm1hcmtldGRhdGFmZWVkZXJ2M3VkYX'
    'BpLnJwYy5wcm90by5MVFBDSABSBGx0cGMSVAoIZnVsbEZlZWQYAiABKAsyNi5jb20udXBzdG94'
    'Lm1hcmtldGRhdGFmZWVkZXJ2M3VkYXBpLnJwYy5wcm90by5GdWxsRmVlZEgAUghmdWxsRmVlZB'
    'J4ChRmaXJzdExldmVsV2l0aEdyZWVrcxgDIAEoCzJCLmNvbS51cHN0b3gubWFya2V0ZGF0YWZl'
    'ZWRlcnYzdWRhcGkucnBjLnByb3RvLkZpcnN0TGV2ZWxXaXRoR3JlZWtzSABSFGZpcnN0TGV2ZW'
    'xXaXRoR3JlZWtzElsKC3JlcXVlc3RNb2RlGAQgASgOMjkuY29tLnVwc3RveC5tYXJrZXRkYXRh'
    'ZmVlZGVydjN1ZGFwaS5ycGMucHJvdG8uUmVxdWVzdE1vZGVSC3JlcXVlc3RNb2RlQgsKCUZlZW'
    'RVbmlvbg==');

@$core.Deprecated('Use statusInfoDescriptor instead')
const StatusInfo$json = {
  '1': 'StatusInfo',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    {'1': 'updatedTime', '3': 2, '4': 1, '5': 3, '10': 'updatedTime'},
  ],
};

/// Descriptor for `StatusInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusInfoDescriptor = $convert.base64Decode(
    'CgpTdGF0dXNJbmZvEhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVzEiAKC3VwZGF0ZWRUaW1lGAIgAS'
    'gDUgt1cGRhdGVkVGltZQ==');

@$core.Deprecated('Use marketInfoDescriptor instead')
const MarketInfo$json = {
  '1': 'MarketInfo',
  '2': [
    {
      '1': 'segmentStatus',
      '3': 1,
      '4': 3,
      '5': 11,
      '6':
          '.com.upstox.marketdatafeederv3udapi.rpc.proto.MarketInfo.SegmentStatusEntry',
      '10': 'segmentStatus'
    },
    {
      '1': 'casMarketStatus',
      '3': 2,
      '4': 3,
      '5': 11,
      '6':
          '.com.upstox.marketdatafeederv3udapi.rpc.proto.MarketInfo.CasMarketStatusEntry',
      '10': 'casMarketStatus'
    },
    {
      '1': 'preOpenSessionStatus',
      '3': 3,
      '4': 3,
      '5': 11,
      '6':
          '.com.upstox.marketdatafeederv3udapi.rpc.proto.MarketInfo.PreOpenSessionStatusEntry',
      '10': 'preOpenSessionStatus'
    },
  ],
  '3': [
    MarketInfo_SegmentStatusEntry$json,
    MarketInfo_CasMarketStatusEntry$json,
    MarketInfo_PreOpenSessionStatusEntry$json
  ],
};

@$core.Deprecated('Use marketInfoDescriptor instead')
const MarketInfo_SegmentStatusEntry$json = {
  '1': 'SegmentStatusEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.MarketStatus',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use marketInfoDescriptor instead')
const MarketInfo_CasMarketStatusEntry$json = {
  '1': 'CasMarketStatusEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.StatusInfo',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use marketInfoDescriptor instead')
const MarketInfo_PreOpenSessionStatusEntry$json = {
  '1': 'PreOpenSessionStatusEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.StatusInfo',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `MarketInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketInfoDescriptor = $convert.base64Decode(
    'CgpNYXJrZXRJbmZvEnEKDXNlZ21lbnRTdGF0dXMYASADKAsySy5jb20udXBzdG94Lm1hcmtldG'
    'RhdGFmZWVkZXJ2M3VkYXBpLnJwYy5wcm90by5NYXJrZXRJbmZvLlNlZ21lbnRTdGF0dXNFbnRy'
    'eVINc2VnbWVudFN0YXR1cxJ3Cg9jYXNNYXJrZXRTdGF0dXMYAiADKAsyTS5jb20udXBzdG94Lm'
    '1hcmtldGRhdGFmZWVkZXJ2M3VkYXBpLnJwYy5wcm90by5NYXJrZXRJbmZvLkNhc01hcmtldFN0'
    'YXR1c0VudHJ5Ug9jYXNNYXJrZXRTdGF0dXMShgEKFHByZU9wZW5TZXNzaW9uU3RhdHVzGAMgAy'
    'gLMlIuY29tLnVwc3RveC5tYXJrZXRkYXRhZmVlZGVydjN1ZGFwaS5ycGMucHJvdG8uTWFya2V0'
    'SW5mby5QcmVPcGVuU2Vzc2lvblN0YXR1c0VudHJ5UhRwcmVPcGVuU2Vzc2lvblN0YXR1cxp8Ch'
    'JTZWdtZW50U3RhdHVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSUAoFdmFsdWUYAiABKA4yOi5j'
    'b20udXBzdG94Lm1hcmtldGRhdGFmZWVkZXJ2M3VkYXBpLnJwYy5wcm90by5NYXJrZXRTdGF0dX'
    'NSBXZhbHVlOgI4ARp8ChRDYXNNYXJrZXRTdGF0dXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRJO'
    'CgV2YWx1ZRgCIAEoCzI4LmNvbS51cHN0b3gubWFya2V0ZGF0YWZlZWRlcnYzdWRhcGkucnBjLn'
    'Byb3RvLlN0YXR1c0luZm9SBXZhbHVlOgI4ARqBAQoZUHJlT3BlblNlc3Npb25TdGF0dXNFbnRy'
    'eRIQCgNrZXkYASABKAlSA2tleRJOCgV2YWx1ZRgCIAEoCzI4LmNvbS51cHN0b3gubWFya2V0ZG'
    'F0YWZlZWRlcnYzdWRhcGkucnBjLnByb3RvLlN0YXR1c0luZm9SBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use feedResponseDescriptor instead')
const FeedResponse$json = {
  '1': 'FeedResponse',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.Type',
      '10': 'type'
    },
    {
      '1': 'feeds',
      '3': 2,
      '4': 3,
      '5': 11,
      '6':
          '.com.upstox.marketdatafeederv3udapi.rpc.proto.FeedResponse.FeedsEntry',
      '10': 'feeds'
    },
    {'1': 'currentTs', '3': 3, '4': 1, '5': 3, '10': 'currentTs'},
    {
      '1': 'marketInfo',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.MarketInfo',
      '10': 'marketInfo'
    },
  ],
  '3': [FeedResponse_FeedsEntry$json],
};

@$core.Deprecated('Use feedResponseDescriptor instead')
const FeedResponse_FeedsEntry$json = {
  '1': 'FeedsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.com.upstox.marketdatafeederv3udapi.rpc.proto.Feed',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `FeedResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedResponseDescriptor = $convert.base64Decode(
    'CgxGZWVkUmVzcG9uc2USRgoEdHlwZRgBIAEoDjIyLmNvbS51cHN0b3gubWFya2V0ZGF0YWZlZW'
    'RlcnYzdWRhcGkucnBjLnByb3RvLlR5cGVSBHR5cGUSWwoFZmVlZHMYAiADKAsyRS5jb20udXBz'
    'dG94Lm1hcmtldGRhdGFmZWVkZXJ2M3VkYXBpLnJwYy5wcm90by5GZWVkUmVzcG9uc2UuRmVlZH'
    'NFbnRyeVIFZmVlZHMSHAoJY3VycmVudFRzGAMgASgDUgljdXJyZW50VHMSWAoKbWFya2V0SW5m'
    'bxgEIAEoCzI4LmNvbS51cHN0b3gubWFya2V0ZGF0YWZlZWRlcnYzdWRhcGkucnBjLnByb3RvLk'
    '1hcmtldEluZm9SCm1hcmtldEluZm8abAoKRmVlZHNFbnRyeRIQCgNrZXkYASABKAlSA2tleRJI'
    'CgV2YWx1ZRgCIAEoCzIyLmNvbS51cHN0b3gubWFya2V0ZGF0YWZlZWRlcnYzdWRhcGkucnBjLn'
    'Byb3RvLkZlZWRSBXZhbHVlOgI4AQ==');
