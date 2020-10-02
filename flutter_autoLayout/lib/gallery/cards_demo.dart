import 'package:flutter_autoLayout/public.dart';

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

enum CardType {
  standard,
  tappable,
  selectable,
}

class TravelDestination {
  final String assetName;
  final String assetPackage;
  final String title;
  final String description;
  final String city;
  final String location;
  final CardType cardType;

  const TravelDestination({
    @required this.assetName,
    @required this.assetPackage,
    @required this.title,
    @required this.description,
    @required this.city,
    @required this.location,
    this.cardType = CardType.standard,
  })  : assert(assetName != null),
        assert(assetPackage != null),
        assert(title != null),
        assert(description != null),
        assert(city != null),
        assert(location != null);
}

List<TravelDestination> destinations(BuildContext context) => [
      TravelDestination(
          assetName: 'places/india_thanjavur_market.png',
          assetPackage: _kGalleryAssetsPackage,
          title: AutolayoutLocalizations.of(context)
              .cardsDemoTravelDestinationTitle1,
          city: AutolayoutLocalizations.of(context)
              .cardsDemoTravelDestinationCity1,
          description: AutolayoutLocalizations.of(context)
              .cardsDemoTravelDestinationDescription1,
          location: AutolayoutLocalizations.of(context)
              .cardsDemoTravelDestinationLocation1),
      TravelDestination(
        assetName: 'places/india_chettinad_silk_maker.png',
        assetPackage: _kGalleryAssetsPackage,
        title: AutolayoutLocalizations.of(context)
            .cardsDemoTravelDestinationTitle2,
        description: AutolayoutLocalizations.of(context)
            .cardsDemoTravelDestinationDescription2,
        city:
            AutolayoutLocalizations.of(context).cardsDemoTravelDestinationCity2,
        location: AutolayoutLocalizations.of(context)
            .cardsDemoTravelDestinationLocation2,
        cardType: CardType.tappable,
      ),
      TravelDestination(
        assetName: 'places/india_tanjore_thanjavur_temple.png',
        assetPackage: _kGalleryAssetsPackage,
        title: AutolayoutLocalizations.of(context)
            .cardsDemoTravelDestinationTitle3,
        description: AutolayoutLocalizations.of(context)
            .cardsDemoTravelDestinationDescription3,
        city:
            AutolayoutLocalizations.of(context).cardsDemoTravelDestinationCity1,
        location: AutolayoutLocalizations.of(context)
            .cardsDemoTravelDestinationLocation1,
        cardType: CardType.selectable,
      ),
    ];

class TravelDestinationItem extends StatelessWidget {
  const TravelDestinationItem({Key key, @required this.destination, this.shape})
      : assert(destination != null),
        super(key: key);
  static const height = 360.0;
  final TravelDestination destination;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SectionTitle(
                title: AutolayoutLocalizations.of(context)
                    .settingsTextScalingNormal),
            SizedBox(
              height: height,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: TravelDestinationContent(destination: destination),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TappableTravelDestinationItem extends StatelessWidget {
  const TappableTravelDestinationItem(
      {Key key, @required this.destination, this.shape})
      : assert(destination != null),
        super(key: key);

  static const height = 298.0;
  final TravelDestination destination;
  final ShapeBorder shape;

  @override
  Widget build(Object context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SectionTitle(
              title: AutolayoutLocalizations.of(context).cardsDemoTappable,
            ),
            SizedBox(
              height: height,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: InkWell(
                  onTap: () {
                    print('Card was tapped');
                  },
                  splashColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  highlightColor: Colors.transparent,
                  child: TravelDestinationContent(
                    destination: destination,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectableTravelDestinationItem extends StatefulWidget {
  const SelectableTravelDestinationItem(
      {Key key, @required this.destination, this.shape})
      : assert(destination != null),
        super(key: key);
  final TravelDestination destination;
  final ShapeBorder shape;

  @override
  _SelectableTravelDestinationItemState createState() =>
      _SelectableTravelDestinationItemState();
}

class _SelectableTravelDestinationItemState
    extends State<SelectableTravelDestinationItem> {
  static const heigt = 298.0;
  var _isSelected = false;

  @override
  Widget build(Object context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SectionTitle(
              title: AutolayoutLocalizations.of(context).cardsDemoSelectable,
            ),
            SizedBox(
              height: heigt,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: widget.shape,
                child: InkWell(
                  onLongPress: () {
                    print('selectable card state changed');
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                  splashColor: colorScheme.onSurface.withOpacity(0.12),
                  highlightColor: Colors.transparent,
                  child: Stack(
                    children: [
                      Container(
                        color: _isSelected
                            ? colorScheme.primary.withOpacity(0.08)
                            : Colors.transparent,
                      ),
                      TravelDestinationContent(destination: widget.destination),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.check_circle,
                            color: _isSelected
                                ? colorScheme.primary
                                : Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}

class TravelDestinationContent extends StatelessWidget {
  const TravelDestinationContent({Key key, @required this.destination})
      : assert(destination != null),
        super(key: key);

  final TravelDestination destination;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headline5.copyWith(color: Colors.white);
    final descriptionStyle = theme.textTheme.subtitle1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 184,
          child: Stack(
            children: [
              Positioned.fill(
                child: Ink.image(
                  image: AssetImage(destination.assetName,
                      package: destination.assetPackage),
                  fit: BoxFit.cover,
                  child: Container(),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    destination.title,
                    style: titleStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: DefaultTextStyle(
            style: descriptionStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    destination.description,
                    style: descriptionStyle.copyWith(color: Colors.black54),
                  ),
                ),
                Text(destination.city),
                Text(destination.location),
              ],
            ),
          ),
        ),
        if (destination.cardType == CardType.standard)
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: () {
                  print("pressed");
                },
                child: Text(AutolayoutLocalizations.of(context).demoMenuShare),
                textColor: Colors.amber.shade500,
              ),
              FlatButton(
                onPressed: () {
                  print('pressed');
                },
                child: Text(
                  AutolayoutLocalizations.of(context).cardsDemoExplore,
                  semanticsLabel: AutolayoutLocalizations.of(context)
                      .cardsDemoExploreSemantics(destination.title),
                ),
                textColor: Colors.amber.shade500,
              ),
            ],
          ),
      ],
    );
  }
}

class CardsDemo extends StatefulWidget {
  const CardsDemo();

  @override
  _CardsDemoState createState() => _CardsDemoState();
}

class _CardsDemoState extends State<CardsDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AutolayoutLocalizations.of(context).demoCardTitle),
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            for (final destination in destinations(context))
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: (destination.cardType == CardType.standard)
                    ? TravelDestinationItem(destination: destination)
                    : destination.cardType == CardType.tappable
                        ? TappableTravelDestinationItem(
                            destination: destination)
                        : SelectableTravelDestinationItem(
                            destination: destination),
              ),
          ],
        ),
      ),
    );
  }
}
