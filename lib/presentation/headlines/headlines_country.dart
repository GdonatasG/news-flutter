import 'package:icons_plus/icons_plus.dart';

enum HeadlinesCountry { us, it, lt }

extension HeadlinesCountryExtension on HeadlinesCountry {
  String get visualName {
    return switch (this) {
      HeadlinesCountry.us => "United States",
      HeadlinesCountry.it => "Italy",
      HeadlinesCountry.lt => "Lithuania"
    };
  }

  Flag flag({double size = 20.0}) {
    return Flag(
      switch (this) {
        HeadlinesCountry.us => Flags.united_states_of_america,
        HeadlinesCountry.it => Flags.italy,
        HeadlinesCountry.lt => Flags.lithuania
      },
      size: size,
    );
  }
}
