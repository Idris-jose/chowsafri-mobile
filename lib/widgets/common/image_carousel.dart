import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodImageCarousel extends StatefulWidget {
  final List<String> images;
  final double height;
  final bool isNetwork;

  const FoodImageCarousel({
    super.key,
    required this.images,
    this.height = 250,
    this.isNetwork = false,
  });

  @override
  State<FoodImageCarousel> createState() => _FoodImageCarouselState();
}

class _FoodImageCarouselState extends State<FoodImageCarousel> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openFullscreen(BuildContext context, int initialIndex) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black87,
        pageBuilder: (_, __, ___) => _FullscreenCarousel(
          images: widget.images,
          initialIndex: initialIndex,
          isNetwork: widget.isNetwork,
        ),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return SizedBox(
        height: widget.height,
        child: const Center(child: Icon(Icons.image_not_supported, size: 48)),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          child: Stack(
            children: [
              PageView.builder(
                controller: _controller,
                itemCount: widget.images.length,
                itemBuilder: (context, index) {
                  return widget.isNetwork
                      ? Image.network(
                          widget.images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (_, __, ___) => const _ImageError(),
                        )
                      : Image.asset(
                          widget.images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (_, __, ___) => const _ImageError(),
                        );
                },
              ),

              Positioned(
                bottom: 12,
                right: 12,
                child: GestureDetector(
                  onTap: () {
                    final page = _controller.page?.round() ?? 0;
                    _openFullscreen(context, page);
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.45),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.open_in_full_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        if (widget.images.length > 1) ...[
          const SizedBox(height: 12),
          SmoothPageIndicator(
            controller: _controller,
            count: widget.images.length,
            effect: const WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              spacing: 6,
              dotColor: Color(0xFFCCCCCC),
              activeDotColor: Color(0xFF8CA83A),
            ),
          ),
        ],
      ],
    );
  }
}

class _FullscreenCarousel extends StatefulWidget {
  final List<String> images;
  final int initialIndex;
  final bool isNetwork;

  const _FullscreenCarousel({
    required this.images,
    required this.initialIndex,
    required this.isNetwork,
  });

  @override
  State<_FullscreenCarousel> createState() => _FullscreenCarouselState();
}

class _FullscreenCarouselState extends State<_FullscreenCarousel> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              final child = widget.isNetwork
                  ? Image.network(widget.images[index], fit: BoxFit.contain)
                  : Image.asset(widget.images[index], fit: BoxFit.contain);
              return InteractiveViewer(child: child);
            },
          ),

          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFF18280C).withOpacity(0.45),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
              ),
            ),
          ),

          if (widget.images.length > 1)
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 24,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: widget.images.length,
                  effect: const WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 6,
                    dotColor: Colors.white38,
                    activeDotColor: Color(0xFF8CA83A),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ImageError extends StatelessWidget {
  const _ImageError();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F2F2),
      child: const Center(
        child: Icon(Icons.broken_image_outlined, size: 48, color: Colors.grey),
      ),
    );
  }
}