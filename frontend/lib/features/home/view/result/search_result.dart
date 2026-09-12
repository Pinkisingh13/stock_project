import 'package:flutter/material.dart';
import 'package:frontend/features/home/controller/option_search_controller.dart';
import 'package:frontend/features/home/view/result/search_option_result_card.dart';
import 'package:frontend/features/home/view/widgets/search_states.dart';
import 'package:provider/provider.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OptionSearchController>(
      builder: (context, search, child) {

        
        if (!search.hasQuery) {
          return const SearchHintState();
        }

        if (search.query.trim().length < 2) {
          return const SearchHintState(
            title: 'Keep typing',
            message: 'Enter at least two characters to search NIFTY option contracts.',
          );
        }

        if (search.isLoading && search.results.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (search.errorMessage != null) {
          return SearchErrorState(
            message: search.errorMessage!,
            onRetry: search.retry,
          );
        }

        if (search.results.isEmpty) {
          return EmptySearchState(query: search.query);
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 10),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${search.results.length} contracts found',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (search.isLoading)
                    const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                itemCount: search.results.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) =>
                    OptionResultCard(option: search.results[index]),
              ),
            ),
          ],
        );
      },
    );
  }
}
