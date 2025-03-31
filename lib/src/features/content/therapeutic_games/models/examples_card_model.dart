class ExamplesCardsModels {
  int id;
  String title;
  String pathImage;

  ExamplesCardsModels({
    required this.id,
    required this.title,
    required this.pathImage,
  });

  factory ExamplesCardsModels.fromJson(Map<String, dynamic> json) {
    return ExamplesCardsModels(
      id: json['id'],
      title: json['title'],
      pathImage: json['pathImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'pathImage': pathImage,
    };
  }

  factory ExamplesCardsModels.initial() {
    return ExamplesCardsModels(
      id: 0,
      title: '',
      pathImage: '',
    );
  }

  static List<ExamplesCardsModels> getMock() {
    return [
      ExamplesCardsModels(
          id: 1, title: '1.', pathImage: 'assets/img/example1.png'),
      ExamplesCardsModels(
          id: 2, title: '2.', pathImage: 'assets/img/example2.png'),
      ExamplesCardsModels(
          id: 3, title: '3.', pathImage: 'assets/img/example3.png'),
      ExamplesCardsModels(
          id: 4, title: '4.', pathImage: 'assets/img/example4.png'),
      ExamplesCardsModels(
          id: 5, title: '5.', pathImage: 'assets/img/example5.png'),
      ExamplesCardsModels(
          id: 6, title: '6.', pathImage: 'assets/img/example6.png'),
    ];
  }
}
