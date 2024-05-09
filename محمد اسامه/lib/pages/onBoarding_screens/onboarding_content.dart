class OnBoardingContent {
  final String image;
  final String title;
  final String desc;

  OnBoardingContent(
      {required this.image, required this.title, required this.desc});
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
    image: "assets/images/onboarding_1.png",
    title: "Fast response",
    desc:
        "We know when something's broken, it needs fixing quickly.",
  ),
  OnBoardingContent(
      image: "assets/images/onboarding_2.png",
      title: "Simple Booking",
      desc:
          "Choose a slot that works for you and we'll be there to fix your appliance at your convenience."),
  OnBoardingContent(
      image: "assets/images/onboarding_3.png",
      title: "Quality Parts and Tools",
      desc:
          "Precision tools and thousands of parts to get the job done, backed by our Lifetime Guarantee."),
];
