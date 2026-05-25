import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fooood/app/routes/app_routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  var _page = 0;

  static const _slides = <_OnboardingSlide>[
    _OnboardingSlide(
      icon: Icons.storefront_rounded,
      title: 'Your favorite restaurants',
      body: 'Browse local picks, trending meals, and fresh offers in seconds.',
      image: 'assets/images/pizza big.png',
    ),
    _OnboardingSlide(
      icon: Icons.delivery_dining_rounded,
      title: 'Fast delivery tracking',
      body: 'Choose your drop-off point and see the fee before checkout.',
      image: 'assets/images/food.png',
    ),
    _OnboardingSlide(
      icon: Icons.payments_rounded,
      title: 'Easy checkout',
      body: 'Pay by card, wallet, or cash and get back to the good part.',
      image: 'assets/images/salad.png',
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _finish() {
    Get.offAllNamed(AppRoutes.dashboard);
  }

  void _next() {
    if (_page == _slides.length - 1) {
      _finish();
      return;
    }
    _controller.nextPage(
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _page == _slides.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _finish,
                  child: const Text('Skip'),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (value) => setState(() => _page = value),
                  itemCount: _slides.length,
                  itemBuilder: (context, index) => _OnboardingContent(
                    slide: _slides[index],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  _slides.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: index == _page ? 28 : 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: index == _page
                          ? const Color(0xFFFC8019)
                          : const Color(0xFFE1E5EA),
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              FilledButton(
                onPressed: _next,
                child: Text(isLast ? 'Start ordering' : 'Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingContent extends StatelessWidget {
  const _OnboardingContent({required this.slide});

  final _OnboardingSlide slide;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 280,
                height: 280,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFEFE3),
                  shape: BoxShape.circle,
                ),
              ),
              Image.asset(
                slide.image,
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ),
              Positioned(
                right: 42,
                top: 70,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: const Color(0xFFFC8019),
                  child: Icon(slide.icon, color: Colors.white, size: 30),
                ),
              ),
            ],
          ),
        ),
        Text(
          slide.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          slide.body,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: const Color(0xFF6B7280),
                height: 1.45,
              ),
        ),
      ],
    );
  }
}

class _OnboardingSlide {
  const _OnboardingSlide({
    required this.icon,
    required this.title,
    required this.body,
    required this.image,
  });

  final IconData icon;
  final String title;
  final String body;
  final String image;
}
