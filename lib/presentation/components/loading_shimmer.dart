import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Reusable loading shimmer for grid layouts
class LoadingShimmer extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;
  final double childAspectRatio;
  final double spacing;
  final EdgeInsets padding;
  final double borderRadius;

  const LoadingShimmer({
    super.key,
    this.itemCount = 6,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.75,
    this.spacing = 12,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 16,
  });

  /// Preset for product grid
  factory LoadingShimmer.productGrid() {
    return const LoadingShimmer(
      itemCount: 6,
      crossAxisCount: 2,
      childAspectRatio: 0.75,
    );
  }

  /// Preset for list items
  factory LoadingShimmer.list({int count = 3}) {
    return LoadingShimmer(
      itemCount: count,
      crossAxisCount: 1,
      childAspectRatio: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}

/// Shimmer for sliver grids
class SliverLoadingShimmer extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;
  final double childAspectRatio;
  final double spacing;
  final EdgeInsets padding;
  final double borderRadius;

  const SliverLoadingShimmer({
    super.key,
    this.itemCount = 6,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.75,
    this.spacing = 12,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding,
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
          childCount: itemCount,
        ),
      ),
    );
  }
}
