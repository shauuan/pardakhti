import 'package:flutter/material.dart';

import '../../config/app_config.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';

/// لوگوی مینیمال پرداختی — فیش حقوق + تأیید.
class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size = 36,
    this.showBackground = true,
    this.borderRadius,
  });

  final double size;
  final bool showBackground;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = borderRadius ?? AppRadii.mdAll;

    return Semantics(
      label: AppConfig.appName,
      child: SizedBox(
        width: size,
        height: size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: showBackground ? colors.primary : Colors.transparent,
            borderRadius: radius,
          ),
          child: CustomPaint(
            painter: _PardakhtiLogoPainter(
              primary: colors.primary,
              accent: colors.accent,
              onPrimary: colors.textOnPrimary,
              drawBackground: false,
            ),
          ),
        ),
      ),
    );
  }
}

/// نسخهٔ تصویری لوگو (PNG) برای جاهایی که asset لازم است.
class AppLogoImage extends StatelessWidget {
  const AppLogoImage({
    super.key,
    this.size = 36,
    this.borderRadius,
  });

  final double size;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? AppRadii.mdAll;

    return Semantics(
      label: AppConfig.appName,
      child: ClipRRect(
        borderRadius: radius,
        child: Image.asset(
          AppConfig.logoAsset,
          width: size,
          height: size,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}

class _PardakhtiLogoPainter extends CustomPainter {
  const _PardakhtiLogoPainter({
    required this.primary,
    required this.accent,
    required this.onPrimary,
    this.drawBackground = true,
  });

  final Color primary;
  final Color accent;
  final Color onPrimary;
  final bool drawBackground;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final origin = Offset((size.width - s) / 2, (size.height - s) / 2);

    if (drawBackground) {
      final bg = Paint()..color = primary;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(origin.dx, origin.dy, s, s),
          Radius.circular(s * 0.22),
        ),
        bg,
      );
    }

    final stroke = Paint()
      ..color = onPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.058
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fill = Paint()
      ..color = onPrimary
      ..style = PaintingStyle.fill;

    // فیش
    final doc = RRect.fromRectAndRadius(
      Rect.fromLTRB(
        origin.dx + s * 0.30,
        origin.dy + s * 0.22,
        origin.dx + s * 0.70,
        origin.dy + s * 0.70,
      ),
      Radius.circular(s * 0.09),
    );

    final cx = origin.dx + s * 0.66;
    final cy = origin.dy + s * 0.66;
    final cr = s * 0.125;
    final bite = cr + stroke.strokeWidth * 0.85;

    canvas.save();
    canvas.clipPath(
      Path()
        ..addRect(Rect.fromLTWH(origin.dx, origin.dy, s, s))
        ..addOval(Rect.fromCircle(center: Offset(cx, cy), radius: bite))
        ..fillType = PathFillType.evenOdd,
    );
    canvas.drawRRect(doc, stroke);
    canvas.restore();

    // خطوط متن
    final lineH = s * 0.045;
    final lineLeft = origin.dx + s * 0.38;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(lineLeft, origin.dy + s * 0.38, s * 0.16, lineH),
        Radius.circular(lineH / 2),
      ),
      fill,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(lineLeft, origin.dy + s * 0.48, s * 0.22, lineH),
        Radius.circular(lineH / 2),
      ),
      fill,
    );

    // نشان تأیید
    canvas.drawCircle(Offset(cx, cy), cr, Paint()..color = accent);

    final check = Paint()
      ..color = onPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.052
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path()
      ..moveTo(cx - cr * 0.38, cy + cr * 0.02)
      ..lineTo(cx - cr * 0.08, cy + cr * 0.35)
      ..lineTo(cx + cr * 0.40, cy - cr * 0.32);
    canvas.drawPath(path, check);
  }

  @override
  bool shouldRepaint(covariant _PardakhtiLogoPainter oldDelegate) {
    return oldDelegate.primary != primary ||
        oldDelegate.accent != accent ||
        oldDelegate.onPrimary != onPrimary ||
        oldDelegate.drawBackground != drawBackground;
  }
}
