import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'promo_banner.dart';

class PromoCarousel extends StatefulWidget {
  const PromoCarousel({super.key});

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  final PageController _pageController = PageController(viewportFraction: 1.0);
  int _currentPage = 0;

  final List<Widget> _banners = const [
    PromoBanner(price: '\$200'),
    PromoBanner(price: '\$150'),
    PromoBanner(price: '\$100'),
  ];

  @override
  void initState() {
    super.initState();
    _autoScroll();
  }

  void _autoScroll() {
    Future.delayed(const Duration(seconds: 4), () { // 4 secondes
      if (!mounted) return;

      int nextPage = (_currentPage + 1) % _banners.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );

      setState(() {
        _currentPage = nextPage;
      });

      _autoScroll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 220,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _banners.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 0;
                  try {
                    value = _pageController.page! - index;
                  } catch (e) {
                    value = (_currentPage - index).toDouble();
                  }
                  value = value.clamp(-1.0, 1.0);

                  double rotationY = value * 0.5;
                  double scale = 1 - (value.abs() * 0.2);

                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.003)
                      ..rotateY(rotationY),
                    child: Transform.scale(
                      scale: scale,
                      child: child,
                    ),
                  );
                },
                child: _banners[index],
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_banners.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 16 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? AppColors.primary
                    : Colors.grey[400],
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}