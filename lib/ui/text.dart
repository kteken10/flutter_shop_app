import 'package:flutter/material.dart';
import '../constants/typography.dart';
enum TextType {
  textXs,
  textSm,
  textBase,
  textLg,
  textXl,
  text2Xl,
  text3Xl,
  text4Xl,
  text5Xl,
  text6Xl,
  text7Xl,
  text8Xl,
  text9Xl,
}
class TextWidget extends Text {
  final TextType? typeText; 
  const TextWidget(
    super.data, 
    {
      super.key,
      this.typeText, 
      super.style,
      super.textAlign,
      super.maxLines,
      super.overflow,
      super.locale,
      super.selectionColor,
      super.semanticsLabel,
      super.softWrap,
      super.strutStyle,
      super.textDirection,
      super.textHeightBehavior,
      super.textScaleFactor,
      super.textWidthBasis,
    });

  @override
  Widget build(BuildContext context) {
  
    TextStyle baseStyle;
    switch (typeText) {
      case TextType.textXs:
        baseStyle = AppTypography.textXs(context);
        break;
      case TextType.textSm:
        baseStyle = AppTypography.textSm(context);
        break;
      case TextType.textLg:
        baseStyle = AppTypography.textLg(context);
        break;
      case TextType.textXl:
        baseStyle = AppTypography.textXl(context);
        break;
      case TextType.text2Xl:
        baseStyle = AppTypography.text2Xl(context);
        break;
      case TextType.text3Xl:
        baseStyle = AppTypography.text3Xl(context);
        break;
      case TextType.text4Xl:
        baseStyle = AppTypography.text4Xl(context);
        break;
      case TextType.text5Xl:
        baseStyle = AppTypography.text5Xl(context);
        break;
      case TextType.text6Xl:
        baseStyle = AppTypography.text6Xl(context);
        break;
      case TextType.text7Xl:
        baseStyle = AppTypography.text7Xl(context);
        break;
      case TextType.text8Xl:
        baseStyle = AppTypography.text8Xl(context);
        break;
      case TextType.text9Xl:
        baseStyle = AppTypography.text9Xl(context);
        break;
      default:
        baseStyle = AppTypography.textBase(context);
        break;
    }

    TextStyle effectiveStyle = baseStyle.merge(style);

    return Text(
      data!,
      style: effectiveStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      locale: locale,
      selectionColor: selectionColor,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      textDirection: textDirection,
     
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
    );
  }
}