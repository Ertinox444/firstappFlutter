import 'package:flutter/material.dart';

class Album {
  final String? nomAlbum;
  final String? description;
  final String? nomGroupe;
  final String? image;

  Album({this.nomAlbum, this.description, this.nomGroupe, this.image});
}

class AlbumCard extends StatelessWidget {
  final Album album;

  const AlbumCard({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("images/" + album.image!),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      album.nomAlbum!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(album.description!),
                    Text("Groupe: " + album.nomGroupe!),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SettingBody extends StatefulWidget {
  const SettingBody({Key? key}) : super(key: key);

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  List<Album> albums = [
    Album(
      nomAlbum: "And Justice for All",
      description:
          "And Justice for All est le quatrième album studio du groupe de thrash metal Metallica, sorti le 25 août 1988. C'est le premier album du groupe sans la participation du bassiste Cliff Burton, décédé dans un accident de bus pendant la tournée de promotion de l'album précédent, Master of Puppets.",
      nomGroupe: "Metallica",
      image: "And justice for all.jpg",
    ),
    Album(
      nomAlbum: "Hardwired... to Self-Destruct",
      description:
          "Hardwired... to Self-Destruct est le dixième album studio du groupe de heavy metal Metallica, sorti le 18 novembre 2016. C'est le premier album studio du groupe en huit ans depuis Death Magnetic (2008), marquant ainsi la plus longue période entre deux albums studio.",
      nomGroupe: "Metallica",
      image: "hardwired.jpg",
    ),
    Album(
      nomAlbum: "Kill 'Em All",
      description:
          "Kill 'Em All est le premier album studio du groupe de thrash metal Metallica, sorti le 25 juillet 1983. L'album a été suivi de leur première grande tournée en Europe où ils ont servi de support à des groupes tels que Raven, Twisted Sister et Diamond Head.",
      nomGroupe: "Metallica",
      image: "Kill'em all.jpg",
    ),
    Album(
      nomAlbum: "Master of Puppets",
      description:
          "Master of Puppets est le troisième album studio du groupe de thrash metal Metallica, sorti le 3 mars 1986 chez Elektra Records. Cet album est souvent considéré comme un classique du genre.",
      nomGroupe: "Metallica",
      image: "Master of puppets.jpg",
    ),
    Album(
      nomAlbum: "Ride the Lightning",
      description:
          "Ride the Lightning est le deuxième album studio du groupe de thrash metal Metallica, sorti le 27 juillet 1984. Cet album a consolidé le succès commercial et critique du groupe.",
      nomGroupe: "Metallica",
      image: "Ride the lightning.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        itemCount: albums.length,
        itemBuilder: (BuildContext context, int index) {
          return AlbumCard(album: albums[index]);
        },
      ),
    );
  }
}
