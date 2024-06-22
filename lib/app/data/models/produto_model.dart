class ProdutoModel {
  final String title;
  final String description;
  final double price;
  final double rating;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  //! construtor da classe com os parametros nomeados e obrigatorios
  ProdutoModel(
      {required this.title,
      required this.description,
      required this.price,
      required this.rating,
      required this.brand,
      required this.category,
      required this.thumbnail,
      required this.images});

  //! construtor nomeado chamado map onde vai retornar a chave vai ser string e o tipo dinamico (JSON de retorno da api)
  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      title: map['title'],
      description: map['description'],
      price: map['price'] * 1.0, // * 1.0 transforma inteiro em double
      rating: map['rating'] * 1.0, // * 1.0 transforma  inteiro em double
      brand: map['brand'],
      category: map['category'],
      thumbnail: map['thumbnail'],
      images: List<String>.from((map['images'] as List)),
    );
  }
}
