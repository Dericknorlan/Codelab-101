import 'package:flutter/material.dart';
import 'login.dart';
import 'model/products.dart';

const double _kFlingVelocity = 2.0;  // Kecepatan animasi untuk transisi lapisan.

/// Widget ini mewakili lapisan depan dari Backdrop.
/// Lapisan ini dapat menerima input tap untuk menunjukkan lapisan belakang.
class _FrontLayer extends StatelessWidget {
  const _FrontLayer({
    super.key,
    this.onTap,  // Fungsi yang dijalankan saat lapisan depan di-tap.
    required this.child,  // Konten yang akan ditampilkan di lapisan depan.
  });

  final VoidCallback? onTap;  // Fungsi yang dipanggil saat lapisan di-tap.
  final Widget child;  // Konten yang ditampilkan di lapisan depan.

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16.0,  // Memberikan efek bayangan pada lapisan.
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(46.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // GestureDetector untuk mendeteksi tap pada lapisan depan.
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,  // Menjalankan fungsi ketika lapisan ditap.
            child: Container(
              height: 40.0,  // Menentukan tinggi area untuk tap.
              alignment: AlignmentDirectional.centerStart,
            ),
          ),
          // Menampilkan konten yang diberikan di lapisan depan.
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}

/// Widget yang menangani animasi judul antara lapisan depan dan belakang.
class _BackdropTitle extends AnimatedWidget {
  final void Function() onPress;  // Fungsi untuk menangani tap pada judul.
  final Widget frontTitle;  // Judul yang ditampilkan di lapisan depan.
  final Widget backTitle;  // Judul yang ditampilkan di lapisan belakang.

  const _BackdropTitle({
    super.key,
    required Animation<double> super.listenable,  // Animasi untuk mengontrol transisi.
    required this.onPress,
    required this.frontTitle,
    required this.backTitle,
  })  : _listenable = listenable;

  final Animation<double> _listenable;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = _listenable;

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.titleLarge!,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      child: Row(children: <Widget>[
        // Tombol untuk membuka atau menutup kategori menu.
        SizedBox(
          width: 72.0,
          child: IconButton(
            padding: const EdgeInsets.only(right: 8.0),
            onPressed: onPress,  // Menjalankan fungsi untuk toggle lapisan.
            icon: Stack(children: <Widget>[
              Opacity(
                opacity: animation.value,  // Mengatur opasitas untuk animasi.
                child: const ImageIcon(AssetImage('assets/slanted_menu.png')),
              ),
              FractionalTranslation(
                translation: Tween<Offset>(begin: Offset.zero, end: const Offset(1.0, 0.0))
                    .evaluate(animation),
                child: const ImageIcon(AssetImage('pedulipanti.png')),
              )
            ]),
          ),
        ),
        // Transisi antara judul depan dan belakang.
        Stack(
          children: <Widget>[
            Opacity(
              opacity: CurvedAnimation(
                parent: ReverseAnimation(animation),
                curve: const Interval(0.5, 1.0),
              ).value,
              child: FractionalTranslation(
                translation: Tween<Offset>(begin: Offset.zero, end: const Offset(0.5, 0.0))
                    .evaluate(animation),
                child: ExcludeSemantics(child: backTitle),  // Menyembunyikan judul belakang saat animasi.
              ),
            ),
            Opacity(
              opacity: CurvedAnimation(
                parent: animation,
                curve: const Interval(0.5, 1.0),
              ).value,
              child: FractionalTranslation(
                translation: Tween<Offset>(begin: const Offset(-0.25, 0.0), end: Offset.zero)
                    .evaluate(animation),
                child: ExcludeSemantics(child: frontTitle),  // Menyembunyikan judul depan saat animasi.
              ),
            ),
          ],
        )
      ]),
    );
  }
}

/// Widget utama yang membangun Backdrop (lapisan depan dan belakang).
/// Menyediakan dua lapisan dengan animasi transisi.
class Backdrop extends StatefulWidget {
  final Category currentCategory;  // Kategori yang sedang dipilih.
  final Widget frontLayer;  // Konten yang ditampilkan di lapisan depan.
  final Widget backLayer;  // Konten yang ditampilkan di lapisan belakang.
  final Widget frontTitle;  // Judul untuk lapisan depan.
  final Widget backTitle;  // Judul untuk lapisan belakang.

  const Backdrop({
    required this.currentCategory,
    required this.frontLayer,
    required this.backLayer,
    required this.frontTitle,
    required this.backTitle,
    super.key,
  });

  @override
  _BackdropState createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop> with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');
  late AnimationController _controller;  // Mengatur animasi transisi.

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(Backdrop old) {
    super.didUpdateWidget(old);

    if (widget.currentCategory != old.currentCategory) {
      _toggleBackdropLayerVisibility();  // Toggle visibilitas lapisan saat kategori berubah.
    } else if (!_frontLayerVisible) {
      _controller.fling(velocity: _kFlingVelocity);  // Animasi ketika lapisan depan tidak terlihat.
    }
  }

  @override
  void dispose() {
    _controller.dispose();  // Membebaskan controller saat widget dihapus.
    super.dispose();
  }

  bool get _frontLayerVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed || status == AnimationStatus.forward;
  }

  void _toggleBackdropLayerVisibility() {
    _controller.fling(
        velocity: _frontLayerVisible ? -_kFlingVelocity : _kFlingVelocity);  // Toggle lapisan.
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double layerTitleHeight = 48.0;
    final Size layerSize = constraints.biggest;
    final double layerTop = layerSize.height - layerTitleHeight;

    Animation<RelativeRect> layerAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(
          0.0, layerTop, 0.0, layerTop - layerSize.height),
      end: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(_controller.view);

    return Stack(
      key: _backdropKey,
      children: <Widget>[
        ExcludeSemantics(
          excluding: _frontLayerVisible,
          child: widget.backLayer,  // Menampilkan lapisan belakang ketika perlu.
        ),
        PositionedTransition(
          rect: layerAnimation,
          child: _FrontLayer(
            onTap: _toggleBackdropLayerVisibility,  // Fungsi untuk menangani tap pada lapisan depan.
            child: widget.frontLayer,  // Konten lapisan depan.
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      elevation: 0.0,
      titleSpacing: 0.0,
      title: _BackdropTitle(
        listenable: _controller.view,  // Menambahkan animasi pada judul.
        onPress: _toggleBackdropLayerVisibility,  // Fungsi untuk toggle lapisan.
        frontTitle: widget.frontTitle,  // Judul untuk lapisan depan.
        backTitle: widget.backTitle,  // Judul untuk lapisan belakang.
      ),
      actions: <Widget>[
        // Tombol pencarian untuk membuka halaman login.
        IconButton(
          icon: const Icon(Icons.search, semanticLabel: 'login'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => const LoginPage()),
            );
          },
        ),
        // Tombol untuk mengatur kategori atau filter.
        IconButton(
          icon: const Icon(Icons.tune, semanticLabel: 'login'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => const LoginPage()),
            );
          },
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,  // Menggunakan AppBar dengan animasi judul.
      body: LayoutBuilder(
        builder: _buildStack,  // Membangun stack dengan animasi lapisan.
      ),
    );
  }
}
