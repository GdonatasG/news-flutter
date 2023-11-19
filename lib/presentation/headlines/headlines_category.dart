enum HeadlinesCategory {
  business,
  entertainment,
  general,
  health,
  science,
  sports,
  technology
}

extension HeadlinesCategoryExtension on HeadlinesCategory {
  String get visualName {
    return switch (this) {
      HeadlinesCategory.business => "Business",
      HeadlinesCategory.entertainment => "Entertainment",
      HeadlinesCategory.general => "General",
      HeadlinesCategory.health => "Health",
      HeadlinesCategory.science => "Science",
      HeadlinesCategory.sports => "Sports",
      HeadlinesCategory.technology => "Technology"
    };
  }
}
