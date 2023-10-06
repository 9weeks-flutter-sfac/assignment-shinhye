import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class DefaultLayout extends StatefulWidget {
  final Widget child;
  final AppBar? appBar;
  final VoidCallback? onRefresh;

  const DefaultLayout({
    required this.child,
    this.appBar,
    this.onRefresh,
    super.key,
  });

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await SecretCatApi.fetchSecrets();

        if (widget.onRefresh != null) {
          widget.onRefresh!();
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: widget.appBar,
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/image/bg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 64,
                  vertical: 16,
                ),
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
