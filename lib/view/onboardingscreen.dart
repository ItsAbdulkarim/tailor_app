import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:untitled4/view/authscreen/signupscreen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: IntroductionScreen(
          // autoScrollDuration: 3,
          pages: [
            PageViewModel(
              title: "Meet Our Skilled Tailors",
              decoration: PageDecoration(
                  pageColor: Color(
                      0xfFFBFBFB) // Set your desired background color here
                  ),
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Behind every exquisite piece of clothing is a team of highly skilled and passionate tailors.They bring precision and creativity to every cut, ensuring that your wardrobe reflects your unique style.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              image: Center(
                  child: Image.asset(
                'images/ssut.png',
              )),
            ),
            PageViewModel(
              title: "Tailored for You",
              decoration: PageDecoration(
                  pageColor: Color(
                      0xfFFBFBFB) // Set your desired background color here
                  ),
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Uncover the joy of personalized fashion. Our tailors are not just creators; they are storytellers. Your style journey begins here, where each piece is meticulously tailored to echo your personality and elevate your presence. ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              image: Center(
                  child: Image.asset(
                'images/menmach.png',
                color: Colors.purple,
              )),
            ),
            PageViewModel(
              title: "Crafting Simplicity, Elevating Style:",
              decoration: PageDecoration(
                  pageColor: Color(
                      0xfFFBFBFB) // Set your desired background color here
                  ),
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    " In our atelier, simplicity doesn't mean sacrificing style—it's an art form.Every piece is thoughtfully tailored to enhance your presence,allowing you to move through life with confidence and grace.From classic silhouettes to modern essentials,we curate a collection that embraces simplicity without compromising on chic.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              image: Center(
                  child: Image.asset(
                'images/book2.png',
                color: Colors.purple,
              )),
            ),
          ],
          next: Icon(Icons.arrow_forward),
          curve: Curves.fastOutSlowIn,
          showNextButton: true,
          showDoneButton: true,
          done:
              const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
          onDone: () {
            Get.to(SignUpScreen());
            // On Done button pressed
          },
          showSkipButton: true,
          skip: Text("Skip"),
          onSkip: () {
            Get.to(SignUpScreen());
            // On Skip button pressed
          },
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
