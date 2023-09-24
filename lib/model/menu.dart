class Menu {
  String photo;
  String name;

  Menu({
    required this.photo,
    required this.name
  });
}

var menuList = [
  Menu(
      photo: 'images/listrik.png',
      name: 'PLN'
  ),
  Menu(
      photo: 'images/pulsa.png',
      name: 'Pulsa'
  ),
  Menu(
      photo: 'images/paket_data.png',
      name: 'Paket Data'
  ),
  Menu(
      photo: 'images/pasca_bayar.png',
      name: 'Pasca Bayar'
  ),
  Menu(
      photo: 'images/bpjs.png',
      name: 'BPJS'
  ),
  Menu(
      photo: 'images/tv_kabel.png',
      name: 'TV Kabel'
  ),
  Menu(
      photo: 'images/asuransi.png',
      name: 'Asuransi'
  ),
  Menu(
      photo: 'images/lihat_semua.png',
      name: 'Lihat Semua'
  ),
];