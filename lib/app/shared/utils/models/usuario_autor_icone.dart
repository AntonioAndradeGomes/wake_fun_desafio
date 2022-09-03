class UsuarioAutorIcone {
  String? id;
  String? url;
  int? xpAmount;

  UsuarioAutorIcone({
    this.id,
    this.url,
    this.xpAmount,
  });

  UsuarioAutorIcone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    xpAmount = json['xp_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['xp_amount'] = xpAmount;
    return data;
  }
}
