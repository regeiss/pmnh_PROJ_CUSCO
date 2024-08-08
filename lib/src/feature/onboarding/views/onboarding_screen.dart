import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gtk_flutter/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends ConsumerWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      skipStyle: ButtonStyle(textStyle: WidgetStateProperty.all(TextStyle(fontSize: 17)), foregroundColor: WidgetStateProperty.all(Colors.redAccent)),
      allowImplicitScrolling: true,
      autoScrollDuration: 300000,
      infiniteAutoScroll: true,
      pages: [
        PageViewModel(
          title: '',
          bodyWidget: Column(
            children: [
              Text('Lorem Ipsum sic amet',
                  style: GoogleFonts.mochiyPopOne(fontSize: 25, fontWeight: FontWeight.w500, color: const Color.fromARGB(255, 248, 64, 64))),
              const SizedBox(height: 20),
              const Image(image: AssetImage('assets/image_placeholder.png')),
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(image: AssetImage('assets/image_placeholder.png')),
              const SizedBox(height: 20),
              Text('Lorem Ipsum sic amet',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.mochiyPopOne(fontSize: 30, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 119, 56, 199)))
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lorem Ipsum sic amet',
                  style: GoogleFonts.mochiyPopOne(fontSize: 33, fontWeight: FontWeight.w500, color: const Color.fromARGB(255, 248, 64, 64))),
              const SizedBox(height: 20),
              const Image(image: AssetImage('assets/image_placeholder.png')),
            ],
          ),
        ),
        PageViewModel(
          title: "Lorem",
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Image(image: AssetImage('assets/image_placeholder.png')),
              const SizedBox(height: 20),
              Text('Lorem Ipsum sic amet',
                  style: GoogleFonts.mochiyPopOne(fontSize: 33, fontWeight: FontWeight.w500, color: const Color.fromARGB(255, 119, 56, 199))),
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lorem Ipsum sic amet',
                  style: GoogleFonts.mochiyPopOne(fontSize: 33, fontWeight: FontWeight.w500, color: const Color.fromARGB(255, 248, 64, 64))),
              const SizedBox(height: 20),
              const Image(image: AssetImage('assets/image_placeholder.png')),
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Image(image: AssetImage('assets/image_placeholder.png')),
              const SizedBox(height: 20),
              Text('Lorem Ipsum sic amet',
                  style: GoogleFonts.mochiyPopOne(fontSize: 33, fontWeight: FontWeight.w500, color: const Color.fromARGB(255, 119, 56, 199))),
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [
              Text("Lorem Ipsum sic amet!",
                  style: GoogleFonts.mochiyPopOne(fontSize: 28, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 40, 183, 125))),
              const SizedBox(height: 30),
              Image(
                image: const AssetImage('assets/image_placeholder.png'),
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),
              Text("Ameno dori me ",
                  style: GoogleFonts.mochiyPopOne(fontSize: 28, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 37, 119, 128))),
            ],
          ),
        ),
      ],
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      // onChange: (val) {},
      skip: const Text('Pular', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(
        Icons.arrow_forward,
      ),
      done: const Text('Pronto', style: TextStyle(fontWeight: FontWeight.w600, color: Color.fromARGB(255, 248, 64, 64))),
      onDone: () => {ref.read(onboardingNotifierProvider.notifier).completeOnboarding(), context.go('/home')},
      nextStyle: ButtonStyle(foregroundColor: WidgetStateProperty.all(Color.fromARGB(255, 248, 64, 64))),
      dotsDecorator: const DotsDecorator(
        size: Size.square(10),
        activeColor: Colors.redAccent,
        activeSize: Size.square(17),
      ),
    );
  }
}
