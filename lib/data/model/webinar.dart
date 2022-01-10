class Webinar{
  String judul ;
  String penyelenggara ;
  String deskripsi ;
  String tglAcara ;
  String waktuAcara ;
  String lokasiAcara ;
  String harga ;
  String linkPendaftaran ;
  String contactPerson ;
  String sosmed ;
  String benefit ;
  String urlPoster ;
  String kategori ;
  bool isVerified ;

  Webinar({
    required this.judul,
    required this.penyelenggara,
    required this.deskripsi,
    required this.tglAcara,
    required this.waktuAcara,
    required this.lokasiAcara,
    required this.harga,
    required this.linkPendaftaran,
    required this.contactPerson,
    required this.sosmed,
    required this.benefit,
    required this.urlPoster,
    required this.kategori,
    required this.isVerified,
  });
  
  factory Webinar.fromJson(Map<String, dynamic> json) { 
      bool convertVerified = json['is_verified'] == 'true';
      return Webinar(
        judul: json['judul'],
        penyelenggara: json['penyelenggara'],
        deskripsi: json['deskripsi'],
        tglAcara: json['tgl_acara'],
        waktuAcara: json['waktu_acara'],
        lokasiAcara: json['lokasi_acara'],
        harga: json['harga'],
        linkPendaftaran: json['link_pendaftaran'],
        contactPerson: json['contact_person'],
        sosmed: json['sosmed'],
        benefit: json['benefit'],
        urlPoster:json['url_poster'],
        kategori: json['kategori'],
        isVerified: convertVerified
    );
  }

  Map<String,dynamic> toJson() => {
    'judul': judul,
    'penyelenggara': penyelenggara,
    'deskripsi': deskripsi,
    'tgl_acara': tglAcara,
    'waktu_acara': waktuAcara,
    'lokasi_acara': lokasiAcara,
    'harga': harga,
    'link_pendaftaran': linkPendaftaran,
    'contact_person': contactPerson,
    'sosmed': sosmed,
    'benefit':benefit,
    'url_poster': urlPoster,
    'kategori': kategori,
    'is_verified' : isVerified,
  };

 
}