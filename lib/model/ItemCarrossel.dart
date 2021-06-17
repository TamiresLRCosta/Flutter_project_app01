class ItemCarrossel {
  late String id;
  late String desc;
  late String img;
  late String valorAntigo;
  late String valorNovo;

  ItemCarrossel(this.id, this.desc, this.img, this.valorAntigo, this.valorNovo);

  ItemCarrossel.fromJson(Map<String, dynamic> mapa, String id) {
    this.id = id;
    this.desc = mapa['desc'];
    this.img = mapa['img'];
    this.valorAntigo = mapa['valorAntigo'];
    this.valorNovo = mapa['valorNovo'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'desc': this.desc,
      'img': this.img,
      'valorAntigo': this.valorAntigo,
      'valorNovo': this.valorNovo,
    };
  }
}
