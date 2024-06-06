import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumGray600 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray600,
      );
  static get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallSecondaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.secondaryContainer.withOpacity(0.5),
        fontSize: 12.fSize,
      );
  // Headline text style
  static get headlineSmallMontserratWhiteA70001 =>
      theme.textTheme.headlineSmall!.montserrat.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 25.fSize,
      );
  static get headlineSmallSecondaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.secondaryContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  // Title text style
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumWhiteA70001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 18.fSize,
      );
  static get titleMediumWhiteA70001_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA70001,
      );
  static get titleSmallBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallff000000 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF000000),
      );
  static get titleSmallff416e1d => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF416E1D),
      );
}

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }
  static get bodyLargeAbelPrimaryContainer =>
      theme.textTheme.bodyLarge!.abel.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeWhiteA70001 => theme.textTheme.bodyLarge!.copyWith(
    color: appTheme.whiteA70001,
    fontWeight: FontWeight.w400,
  );
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
    fontSize: 13.fSize,
  );
  static get bodyMedium72090f47 => theme.textTheme.bodyMedium!.copyWith(
    color: Color(0X72090F47),
  );

  static get bodyMediumErrorContainer => theme.textTheme.bodyMedium!.copyWith(
    color: theme.colorScheme.errorContainer,
  );
  static get bodyMediumLight => theme.textTheme.bodyMedium!.copyWith(
    fontWeight: FontWeight.w300,
  );
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
    color: theme.colorScheme.onPrimary,
  );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
    color: theme.colorScheme.primary,
  );
  static get bodyMediumPrimaryContainer => theme.textTheme.bodyMedium!.copyWith(
    color: theme.colorScheme.primaryContainer.withOpacity(0.62),
  );
  static get bodyMediumPrimaryContainer13 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(0.45),
        fontSize: 13.fSize,
      );
  static get bodyMediumPrimaryContainer13_1 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(0.45),
        fontSize: 13.fSize,
      );
  static get bodyMediumPrimaryContainer_1 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get bodyMediumSecondaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer.withOpacity(0.2),
      );
  static get bodyMediumSofiaPro => theme.textTheme.bodyMedium!.sofiaPro;
  static get bodyMediumff090f47 => theme.textTheme.bodyMedium!.copyWith(
    color: Color(0XFF090F47),
  );
  // Headline text style
  static get headlineMediumSecondaryContainer =>
      theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer.withOpacity(1),
      );

  static get headlineSmallWhiteA70001 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.whiteA70001,
      );
  // Label text style
  static get labelLarge12 => theme.textTheme.labelLarge!.copyWith(
    fontSize: 12.fSize,
  );
  static get labelLargeOnError => theme.textTheme.labelLarge!.copyWith(
    color: theme.colorScheme.onError,
    fontWeight: FontWeight.w500,
  );
  // Title text style
  static get titleLargeOnError => theme.textTheme.titleLarge!.copyWith(
    color: theme.colorScheme.onError,
    fontSize: 20.fSize,
  );
  static get titleLargeSecondaryContainer =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.secondaryContainer.withOpacity(0.2),
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.w700,
  );
  static get titleMediumBold18 => theme.textTheme.titleMedium!.copyWith(
    fontSize: 18.fSize,
    fontWeight: FontWeight.w700,
  );
  static get titleMediumOnPrimary => theme.textTheme.titleMedium!.copyWith(
    color: theme.colorScheme.onPrimary.withOpacity(0.5),
    fontSize: 18.fSize,
    fontWeight: FontWeight.w700,
  );

  static get titleMediumPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(0.45),
        fontWeight: FontWeight.w500,
      );
  static get titleMediumSecondaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get titleMediumWhiteA70001 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.whiteA70001,
    fontWeight: FontWeight.w700,
  );
  static get titleSmallOnError => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.onError,
    fontWeight: FontWeight.w500,
  );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.primary,
    fontWeight: FontWeight.w700,
  );
  static get titleSmallPrimaryContainer => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.primaryContainer.withOpacity(0.45),
    fontWeight: FontWeight.w500,
  );
  static get titleSmallPrimaryContainerMedium =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(0.75),
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
    color: Colors.black,
  );
  static get bodySmallBlack900_1 => theme.textTheme.bodySmall!.copyWith(
    color: Colors.black.withOpacity(0.75),
  );
  // Headline text style
  static get headlineSmallMedium => theme.textTheme.headlineSmall!.copyWith(
    fontWeight: FontWeight.w500,
  );
  static get headlineSmallPrimary => theme.textTheme.headlineSmall!.copyWith(
    color: theme.colorScheme.primary.withOpacity(1),
  );
  // Label text style
  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
    color: Colors.black,
  );
  static get labelLargeBlack900_1 => theme.textTheme.labelLarge!.copyWith(
    color: Colors.black.withOpacity(0.5),
  );
  static get labelLargeBlack900_2 => theme.textTheme.labelLarge!.copyWith(
    color: Colors.black,
  );
  // Title text style
  // static get titleMediumOnPrimary => theme.textTheme.titleMedium!.copyWith(
  //   color: theme.colorScheme.onPrimary,
  //   fontSize: 18.fSize,
  // );
  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumOnPrimary_1 => theme.textTheme.titleMedium!.copyWith(
    color: theme.colorScheme.onPrimary,
  );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
    color: theme.colorScheme.primary.withOpacity(1),
    fontSize: 18.fSize,
    fontWeight: FontWeight.w600,
  );
  static get titleMediumPrimary_1 => theme.textTheme.titleMedium!.copyWith(
    color: theme.colorScheme.primary.withOpacity(1),
  );
  static get titleMediumSemiBold => theme.textTheme.titleMedium!.copyWith(
    fontSize: 18.fSize,
    fontWeight: FontWeight.w600,
  );
  static get titleMediumSemiBold_1 => theme.textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.w600,
  );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
    color: Colors.black.withOpacity(0.5),
  );
  static get titleSmallBlack900SemiBold => theme.textTheme.titleSmall!.copyWith(
    color: Colors.black.withOpacity(0.5),
    fontWeight: FontWeight.w600,
  );
  static get titleSmallLightgreen900 => theme.textTheme.titleSmall!.copyWith(
    color:Colors.black,
  );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.onPrimary,
  );
  // static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
  //   color: theme.colorScheme.primary.withOpacity(1),
  // );
  static get titleSmallPrimary_1 => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.primary.withOpacity(1),
  );

  static get labelLargeOnPrimary => theme.textTheme.labelLarge!.copyWith(
    color: theme.colorScheme.onPrimary,
  );
  // Title text style

  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
    fontSize: 16.fSize,
    fontWeight: FontWeight.w500,
  );

  static get titleSmallErrorContainer => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.errorContainer,
  );

  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
    fontWeight: FontWeight.w600,
  );
}

extension on TextStyle {
  TextStyle get abel {
    return copyWith(
      fontFamily: 'Abel',
    );
  }

  TextStyle get sofiaPro {
    return copyWith(
      fontFamily: 'Sofia Pro',
    );
  }

  TextStyle get overpass {
    return copyWith(
      fontFamily: 'Overpass',
    );
  }
}
