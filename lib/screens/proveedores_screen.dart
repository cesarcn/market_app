import 'package:flutter/material.dart';
import '../widgets/menu_lateral.dart';

class ProveedoresScreen extends StatelessWidget {
  // Es la clase principal de la pantalla principal
  List<_Photo> _photos() {
    return [
      // Lista de fotos
      _Photo(
          imageUrl: 'https://www.calle.es/fotos/3/e/7/place-81.jpg',
          title: 'Deltron',
          subtitle: 'Av Santiago de Surco 458\n 945278209'),
      _Photo(
          imageUrl:
              'https://image.cnbcfm.com/api/v1/image/106168859-1570492551169gettyimages-1170111998.jpeg?v=1612488388&w=929&h=523',
          title: 'Samsung',
          subtitle: 'Av Aviacion 7898\n 978456123'),
      _Photo(
          imageUrl:
              'https://cdn.pixabay.com/photo/2014/10/30/00/28/apple-inc-508812_960_720.jpg',
          title: 'Apple',
          subtitle: 'Av Larco 585\n 936587412'),
      _Photo(
          imageUrl:
              'https://besthqwallpapers.com/Uploads/2-11-2021/179909/thumb2-lenovo-carbon-logo-4k-grunge-art-carbon-background-creative.jpg',
          title: 'Lenovo',
          subtitle: 'Av Arequipa 7854\n 945821456'),
      _Photo(
          imageUrl:
              'https://images.news18.com/ibnlive/uploads/2012/04/hp_061010.jpg?impolicy=website&width=510&height=356',
          title: 'HP',
          subtitle: 'Av Wilson 2589\n 921478523'),
      _Photo(
          imageUrl:
              'https://salaguamotors.com/wp-content/uploads/2021/05/shutterstock_640658905-e1601319244459.jpg',
          title: 'DELL',
          subtitle: 'Av Benavides 7458\n 936412587'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Es la función que se ejecuta cuando se crea la pantalla
    return Scaffold(
      appBar: AppBar(
        title: Text('TechStore'),
        backgroundColor: Color.fromARGB(255, 133, 9, 9),
      ),
      drawer: MenuLateral(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              padding: const EdgeInsets.all(8),
              childAspectRatio: 1,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: _photos().map<Widget>((photo) {
                return _GridDemoPhotoItem(
                  photo: photo,
                );
              }).toList()),
        ),
      ),
    );
  }
}

class _Photo {
  // Clase que representa una foto
  _Photo({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  final String imageUrl;
  final String title;
  final String subtitle;
}

class GridSubject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        'Normal List',
        style: TextStyle(
            fontFamily: 'ConcertOne-Regular',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text),
    );
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  _GridDemoPhotoItem({Key? key, required this.photo}) : super(key: key);

  final _Photo photo;

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        photo.imageUrl,
        fit: BoxFit.cover,
      ),
    );

    return GridTile(
      footer: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: _GridTitleText(photo.title),
          subtitle: _GridTitleText(photo.subtitle),
        ),
      ),
      child: image,
    );
  }
}
