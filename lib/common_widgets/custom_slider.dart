import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final PageController controller;
  const CustomSlider({super.key, required this.controller});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final List<String> _sliderItems = [
    'Special Offer: 20% Off First Booking!',
    'Trusted Professionals Guaranteed',
    'Instant Booking Confirmation',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        controller: widget.controller,
        itemCount: _sliderItems.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2575FC).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(25),
            child: Center(
              child: Text(_sliderItems[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2575FC),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}