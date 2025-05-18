import 'package:flutter/material.dart';
import 'promo_banner.dart';

class PromoCarousel extends StatefulWidget {
  const PromoCarousel({super.key});

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;

  // Liste originale des bannières
  final List<Widget> _banners = const [
    PromoBanner(price: '\$200'),
    PromoBanner(price: '\$150'),
    PromoBanner(price: '\$100'),
  ];

  // Liste étendue avec une page fantôme = copie de la première bannière
  late final List<Widget> _bannersWithFakeLast;

  @override
  void initState() {
    super.initState();

    // On crée la liste avec la page fantôme à la fin
    _bannersWithFakeLast = [..._banners, _banners[0]];

    // Le controller commence à la page 0
    _pageController = PageController(initialPage: 0);

    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;

      int nextPage = _pageController.page!.toInt() + 1;

      // Animation vers la page suivante
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      setState(() {
        // Si on est sur la dernière page fantôme, on remet à 0
        if (nextPage == _bannersWithFakeLast.length - 1) {
          _currentPage = 0;
        } else {
          _currentPage = nextPage;
        }
      });

      _startAutoScroll();
    });
  }

  void _handlePageChanged(int page) {
    if (page == _bannersWithFakeLast.length - 1) {
      // Dès qu'on arrive sur la page fantôme (fin), on saute sans animation à la vraie première page
      Future.delayed(const Duration(milliseconds: 300), () {
        _pageController.jumpToPage(0);
      });

      setState(() {
        _currentPage = 0;
      });
    } else {
      setState(() {
        _currentPage = page;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _bannersWithFakeLast.length,
            onPageChanged: _handlePageChanged,
            itemBuilder: (_, index) => _bannersWithFakeLast[index],
          ),
        ),
      
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _banners.length, // On utilise la longueur sans la page fantôme ici
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 10 : 6,
              height: _currentPage == index ? 10 : 6,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.orange : Colors.orange[200],
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
