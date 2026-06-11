import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // paleta de color vino
    final vinoColor = const Color(0xFF722F37);

    return MaterialApp(
      title: 'Lugares Turísticos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: vinoColor),
        primaryColor: vinoColor,
        appBarTheme: AppBarTheme(
          backgroundColor: vinoColor,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomeListScreen(),
    );
  }
}

// MODELO DE DATOS
class TouristSite {
  final String name;
  final String location;
  final String description;
  final String imageUrl;
  final int initialFavorites;

  TouristSite({
    required this.name,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.initialFavorites,
  });
}

// Pantalla
class HomeListScreen extends StatelessWidget {
  const HomeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de 10 sitios
    final List<TouristSite> sites = [
      TouristSite(
        name: 'Islas Galápagos',
        location: 'Provincia de Galápagos',
        description: 'Archipiélago del océano Pacífico conocido como uno de los destinos más famosos del mundo para la observación de fauna.',
        imageUrl: 'https://www.galapatours.com/_next/image?url=https%3A%2F%2Fmedia.venturatravel.org%2Funsafe%2F1200x%2Fsmart%2Ffilters%3Aquality(75)%3Aformat(webp)%2Fimg%2F2048x1536%2F137843.jpg&w=480&q=75',
        initialFavorites: 952,
      ),
      TouristSite(
        name: 'Volcán Cotopaxi',
        location: 'Provincia de Cotopaxi',
        description: 'Uno de los volcanes activos más altos del mundo, con un cono nevado casi perfectamente simétrico.',
        imageUrl: 'https://www.goecuadortravel.com/archivos/destinos/cotopaxi-1200x600-1_Mediano.jpg',
        initialFavorites: 850,
      ),
      TouristSite(
        name: 'Laguna de Quilotoa',
        location: 'Provincia de Cotopaxi',
        description: 'Una impresionante laguna de cráter de color verde esmeralda ubicada en la cordillera de los Andes.',
        imageUrl: 'https://ame.gob.ec/wp-content/uploads/2025/05/WhatsApp-Image-2025-05-01-at-15.52.37-1.jpeg',
        initialFavorites: 920,
      ),
      TouristSite(
        name: 'Centro Histórico',
        location: 'Quito, Pichincha',
        description: 'El centro histórico más grande, menos alterado y mejor conservado de América, Patrimonio de la Humanidad.',
        imageUrl: 'https://images.trvl-media.com/place/6112364/f2101755-9cd4-4445-b7ea-cb0c00c3eb87.jpg',
        initialFavorites: 1200,
      ),
      TouristSite(
        name: 'Pailón del Diablo',
        location: 'Baños de Agua Santa',
        description: 'Una de las cascadas más impresionantes del país, rodeada de espesa vegetación y escaleras talladas en piedra.',
        imageUrl: 'https://www.explorsierra.com/archivos/blogs/Pailon-del-diablo.jpg',
        initialFavorites: 740,
      ),
      TouristSite(
        name: 'Mitad del Mundo',
        location: 'Pichincha',
        description: 'Monumento que resalta la ubicación exacta de la línea ecuatorial, dividiendo el hemisferio norte del sur.',
        imageUrl: 'https://www.andbeyond.com/wp-content/uploads/sites/5/Mitad-del-Mundo-in-Quito-Ecuador.jpg',
        initialFavorites: 630,
      ),
      TouristSite(
        name: 'Parque Nacional Cajas',
        location: 'Azuay',
        description: 'Área protegida conocida por sus páramos y cientos de lagos interconectados. Ideal para el senderismo.',
        imageUrl: 'https://media.tacdn.com/media/attractions-splice-spp-674x446/13/5b/56/dd.jpg',
        initialFavorites: 450,
      ),
      TouristSite(
        name: 'Cúpulas de Cuenca',
        location: 'Cuenca, Azuay',
        description: 'La Catedral de la Inmaculada Concepción con sus icónicas cúpulas azules es el símbolo de esta ciudad colonial.',
        imageUrl: 'https://previews.123rf.com/images/mindstormphoto/mindstormphoto1710/mindstormphoto171000021/89430335-the-domes-of-the-new-cathedral-is-a-central-feature-of-the-cuenca-ecuador-skyline.jpg',
        initialFavorites: 890,
      ),
      TouristSite(
        name: 'Ruinas de Ingapirca',
        location: 'Cañar',
        description: 'El complejo arqueológico inca más importante del país, destacando el imponente Templo del Sol.',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1852xj0IzG4vjF0a4hJMf0pYMutHq7owOfw&s',
        initialFavorites: 510,
      ),
      TouristSite(
        name: 'Cuyabeno',
        location: 'Sucumbíos',
        description: 'Reserva de producción faunística en la Amazonía, hogar de delfines rosados, caimanes y exuberante flora.',
        imageUrl: 'https://www.geotoursbanios.com/archivos/tours/GREEN-FOREST-1.jpg',
        initialFavorites: 680,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 10 Destinos de Ecuador', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      // Usamos ListView.builder para mostrar la lista de 10 elementos eficientemente
      body: ListView.builder(
        itemCount: sites.length,
        itemBuilder: (context, index) {
          final site = sites[index];
          return Card(
            margin: const EdgeInsets.all(16),
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                ImageSection(image: site.imageUrl),
                TitleSection(name: site.name, location: site.location, initialFavs: site.initialFavorites),
                const ButtonSection(),
                TextSection(description: site.description),
              ],
            ),
          );
        },
      ),
    );
  }
}

// WIDGETS

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
    required this.initialFavs,
  });

  final String name;
  final String location;
  final int initialFavs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
          FavoriteWidget(initialCount: initialFavs),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(color: color, icon: Icons.call, label: 'LLAMAR'),
          ButtonWithText(color: color, icon: Icons.near_me, label: 'RUTA'),
          ButtonWithText(color: color, icon: Icons.share, label: 'COMPARTIR'),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      child: Text(
        description,
        style: const TextStyle(fontSize: 15, height: 1.5),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      width: double.infinity,
      height: 240,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: 240,
          color: Colors.grey[300],
          child: const Center(child: Icon(Icons.broken_image, size: 50, color: Colors.grey)),
        );
      },
    );
  }
}

// WIDGET INTERACTIVO DE FAVORITOS

class FavoriteWidget extends StatefulWidget {
  final int initialCount;
  const FavoriteWidget({super.key, required this.initialCount});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  late int _favoriteCount;

  @override
  void initState() {
    super.initState();
    _favoriteCount = widget.initialCount;
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).primaryColor;
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? const Icon(Icons.star) : const Icon(Icons.star_border)),
            color: _isFavorited ? iconColor : Colors.grey,
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 40,
          child: Text('$_favoriteCount', style: const TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}