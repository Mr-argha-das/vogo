import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Sample filter state
  Map<String, bool> categoryFilters = {
    'Eggs': true,
    'Noodles & Pasta': false,
    'Chips & Crisps': false,
    'Fast Food': false,
  };

  Map<String, bool> brandFilters = {
    'Individual Collection': false,
    'Cocola': true,
    'Ifad': false,
    'Kazi Farmas': false,
  };

  Widget customCheckbox(String title, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: isSelected ? Colors.green : Colors.transparent,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(4),
            ),
            child: isSelected
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : null,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.green : Colors.black,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // ✅ FIXED: pop instead of push
                    },
                    child: const Icon(Icons.close, size: 28),
                  ),
                  const Text(
                    'Filters',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 28), // to balance close icon
                ],
              ),
              const SizedBox(height: 24),

              // Filter Sections
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...categoryFilters.entries.map(
                      (entry) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: customCheckbox(
                          entry.key,
                          entry.value,
                          () {
                            setState(() {
                              categoryFilters[entry.key] = !entry.value;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Brand',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...brandFilters.entries.map(
                      (entry) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: customCheckbox(
                          entry.key,
                          entry.value,
                          () {
                            setState(() {
                              brandFilters[entry.key] = !entry.value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),

              // Apply Filter Button
              GestureDetector(
                onTap: () {
                  // Apply filter logic if needed
                  Navigator.pop(context); // ✅ Just close the filter screen
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.green[900],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      'Apply Filter',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
