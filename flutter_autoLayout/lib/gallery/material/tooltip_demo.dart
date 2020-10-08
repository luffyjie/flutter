import 'package:flutter_autoLayout/public.dart';

class TooltipDemo extends StatelessWidget {
  const TooltipDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AutolayoutLocalizations.of(context).demoTooltipTitle),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AutolayoutLocalizations.of(context).demoTooltipInstructions,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Tooltip(
                message:
                    AutolayoutLocalizations.of(context).starterAppTooltipSearch,
                child: IconButton(
                  color: Theme.of(context).colorScheme.primary,
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
