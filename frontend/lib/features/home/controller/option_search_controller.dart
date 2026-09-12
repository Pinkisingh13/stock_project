import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:frontend/core/errors/upstox_exception.dart';
import 'package:frontend/features/home/model/search_option_model.dart';
import 'package:frontend/services/upstox_search_data_service.dart';

class OptionSearchController extends ChangeNotifier {

  
  final UpstoxSearchDataService searchDataService = UpstoxSearchDataService();


  List<SearchOptionModel> results = const [];
  bool isLoading = false;
  String query = '';
  String? errorMessage;


  final Map<String, CachedSearch> cache = {};
  Timer? debounce;
  int requestId = 0;

  bool get hasQuery => query.trim().isNotEmpty;

  // Search input handling
  void onQueryChanged(String value) {
    log(
      'Search input changed.\n'
      'query: "$value"\n'
      'previous debounce cancelled: ${debounce?.isActive ?? false}',
      name: 'OptionSearchController',
    );
    query = value;
    errorMessage = null;
    debounce?.cancel();

    if (value.trim().length < 2) {
      log(
        'Search query has fewer than two characters. '
        'Clearing results and waiting for more input.',
        name: 'OptionSearchController',
      );
      requestId++;
      results = const [];
      isLoading = false;
      notifyListeners();
      return;
    }

    isLoading = true;
    notifyListeners();
    log(
      'Search debounce for 450ms.\n'
      'query: "$value"',
      name: 'OptionSearchController',
    );
    debounce = Timer(const Duration(milliseconds: 450), () => search(value));
  }

  void clear() {
    debounce?.cancel();
    requestId++;
    query = '';
    results = const [];
    errorMessage = null;
    isLoading = false;
    notifyListeners();
  }

  // Search request and retry handling.
  Future<void> retry() {
    log('Retry requested for query: "$query"', name: 'OptionSearchController');
    return search(query);
  }

  Future<void> search(String value) async {
    final trimmedQuery = value.trim();

    if (trimmedQuery.length < 2) {
      log(
        'API search skipped because query is shorter than two characters.',
        name: 'OptionSearchController',
      );
      return;
    }

    final currentRequestId = ++requestId;
    final cacheKey = trimmedQuery.toUpperCase();
    final cached = cache[cacheKey];

    log(
      'Starting option search.\n'
      'request id: $currentRequestId\n'
      'query: "$trimmedQuery"\n'
      'cache key: "$cacheKey"',
      name: 'OptionSearchController',
    );

    if (cached != null &&
        DateTime.now().difference(cached.createdAt) <
            const Duration(seconds: 30)) {
      log(
        'Cache hit. Returning ${cached.results.length} results without an API call.',
        name: 'OptionSearchController',
      );
      results = cached.results;
      isLoading = false;
      errorMessage = null;
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      log(
        'Cache miss. Calling Upstox search service.',
        name: 'OptionSearchController',
      );
      final searchResults = await searchDataService.searchNiftyOptions(
        trimmedQuery,
      );
      if (currentRequestId != requestId || trimmedQuery != query.trim()) {
        log(
          'Ignoring stale search response.\n'
          'response request id: $currentRequestId\n'
          'current request id: $requestId\n'
          'response query: "$trimmedQuery"\n'
          'current query: "${query.trim()}"',
          name: 'OptionSearchController',
        );
        return;
      }

      cache[cacheKey] = CachedSearch(searchResults);
      results = searchResults;
      log(
        'Search completed successfully.\n'
        'results: ${searchResults.length}\n'
        'cached for: 30 seconds',
        name: 'OptionSearchController',
      );
    } on UpstoxApiException catch (error) {
      if (currentRequestId != requestId || trimmedQuery != query.trim()) {
        return;
      }
      results = const [];
      errorMessage = error.message;
      log(
        'Upstox search API error: ${error.message}',
        name: 'OptionSearchController',
        level: 1000,
      );
    } catch (error) {
      if (currentRequestId != requestId || trimmedQuery != query.trim()) {
        return;
      }
      results = const [];
      errorMessage = 'Unable to search options. Please try again.';
      log(
        'Unexpected option-search error.',
        name: 'OptionSearchController',
        level: 1000,
      );
    } finally {
      if (currentRequestId == requestId && trimmedQuery == query.trim()) {
        isLoading = false;
        notifyListeners();
        log(
          'Search loading state finished for request id: $currentRequestId.',
          name: 'OptionSearchController',
        );
      }
    }
  }

  // Controller cleanup.
  @override
  void dispose() {
    log(
      'Disposing OptionSearchController and cancelling debounce timer.',
      name: 'OptionSearchController',
    );
    debounce?.cancel();
    super.dispose();
  }
}

class CachedSearch {
  CachedSearch(this.results) : createdAt = DateTime.now();

  final List<SearchOptionModel> results;
  final DateTime createdAt;
}
