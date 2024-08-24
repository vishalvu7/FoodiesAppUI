class OnboardingEntity {
  final String image;
  final String title;
  final String description;

  OnboardingEntity(
      {required this.image, required this.title, required this.description});

  static List<OnboardingEntity> onboardingItems = [
    OnboardingEntity(
        image: "food-delivery.png",
        title: "On demand & runtime \nlocation",
        description:
            "Pick from your location at \nyour preferred date \nand time."),
    OnboardingEntity(
        image: "free-shipping.png",
        title: "Anything, anytime, \nanywhere.",
        description:
            "Whether it's a parcel, a cheque, or \nan important doc, we'll parcel."),
    OnboardingEntity(
        image: "cash-on-delivery.png",
        title: "Live track your \nshipments",
        description:
            "See a realtime view of your courier \non the map on the day of delivery."),
  ];
}
