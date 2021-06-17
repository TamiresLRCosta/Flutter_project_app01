class ItemFatura {
  late String id;
  late String data;
  late String desc;
  late String valor;

  ItemFatura(this.id, this.data, this.desc, this.valor);

  ItemFatura.fromJson(Map<String, dynamic> mapa, String id) {
    this.id = id;
    this.data = mapa['data'];
    this.desc = mapa['desc'];
    this.valor = mapa['valor'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'data': this.data,
      'desc': this.desc,
      'valor': this.valor,
    };
  }
}
