import 'package:flutter/material.dart';
import 'package:meals/main.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/mian_drawar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actriveFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filter'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: actriveFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Gluiten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include gluten-free meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: actriveFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include Lactose-free meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: actriveFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'Vegan-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include vegan-free meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: actriveFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              'Vegetarian-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include vegetarian-free meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
