import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/features/home/controller/option_search_controller.dart';
import 'package:frontend/features/home/view/result/search_result.dart';
import 'package:frontend/shared/widgets/template.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  late final OptionSearchController optionSearchController;

  @override
  void initState() {
    super.initState();
    optionSearchController = context.read<OptionSearchController>();
    optionSearchController.addListener(syncSearchField);
  }

  void syncSearchField() {
    final currentQuery = optionSearchController.query;

    if (searchController.text == currentQuery) {
      return;
    }

    searchController.value = TextEditingValue(
      text: currentQuery,
      selection: TextSelection.collapsed(offset: currentQuery.length),
    );
  }

  @override
  void dispose() {
    optionSearchController.removeListener(syncSearchField);
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      title: 'Option Search',
      body: Consumer<OptionSearchController>(
        builder: (context, search, child) {
          return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Explore contracts',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'NSE F&O',
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Search by symbol, strike, CE, or PE.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: searchController,
                    focusNode: searchFocusNode,
                    autofocus: false,
                    textCapitalization: TextCapitalization.characters,
                    inputFormatters: [
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        return newValue.copyWith(
                          text: newValue.text.toUpperCase(),
                          composing: TextRange.empty,
                        );
                      }),
                    ],
                    onChanged: search.onQueryChanged,
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: InputDecoration(
                      hintText: 'Search NIFTY options',
                      hintStyle: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                          ),
                      prefixIcon: const Icon(Icons.search_rounded, size: 25),
                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                          width: 1.2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: const SearchResults()),
            ],
          );
        },
      ),
    );
  }
}
