import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar(
      {super.key,
      this.title,
      this.centerTitle,
      this.leading,
      this.onSearchChanged,
      this.onSearchReset,
      this.color,
      this.searchPos,
      this.size,
      this.actions});
  final Text? title;
  final bool? centerTitle;
  final Widget? leading;
  final Color? color;
  final bool? searchPos;
  final double? size;
  final List<Widget>? actions;
  final void Function(String)? onSearchChanged;
  final void Function()? onSearchReset;

  @override
  SearchAppBarState createState() => SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(size ?? 70.0);
}

class SearchAppBarState extends State<SearchAppBar>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = Tween<double>(begin: -130, end: 0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  var isSearch = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Column(
          children: [
            AppBar(
              backgroundColor: widget.color ?? theme.colorScheme.background,
              centerTitle: true,
              title: widget.title,
              leading: widget.searchPos != null
                  ? InkWell(
                      onTap: isSearch
                          ? () {}
                          : () {
                              controller.forward();
                              isSearch = true;
                            },
                      child: Center(
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            'assets/images/search.png',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  : widget.leading,
              actions: widget.searchPos != null
                  ? widget.actions
                  : [
                      InkWell(
                        onTap: isSearch
                            ? () {}
                            : () {
                                controller.forward();
                                isSearch = true;
                              },
                        child: Center(
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset(
                              'assets/images/search.png',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.075),
                      ),
                    ],
            ),
          ],
        ),
        Positioned(
          height: 110,
          width: MediaQuery.of(context).size.width,
          top: animation.value,
          child: Container(
            decoration: BoxDecoration(
              color: widget.color ?? theme.colorScheme.background,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: TextFormField(
                            controller: textController,
                            cursorColor: theme.colorScheme.secondary,
                            maxLines: 1,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: theme.colorScheme.brightness ==
                                      Brightness.light
                                  ? const Color.fromARGB(50, 0, 0, 0)
                                  : const Color.fromARGB(50, 255, 255, 255),
                              // suffixIcon: InkWell(
                              //   child: const DSvgIcon(
                              //     assetName: 'assets/images/mic.svg',
                              //     color: Color.fromRGBO(255, 255, 255, 0.6),
                              //     height: 30,
                              //   ),
                              //   onTap: () {},
                              // ),
                              prefixIcon: SizedBox(
                                height: 15,
                                width: 15,
                                child: Image.asset(
                                  'assets/images/search_grey.png',
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.95),
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              contentPadding: EdgeInsets.zero,
                              hintText: 'Поиск',
                              hintStyle: theme.textTheme.headlineSmall,
                            ),
                            onChanged: (value) =>
                                widget.onSearchChanged!(value),
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: InkWell(
                          child: Image.asset(
                            'assets/images/close.png',
                            color: Colors.black,
                            height: 15,
                          ),
                          onTap: () {
                            controller.reverse();
                            isSearch = false;
                            widget.onSearchReset!();
                            textController.clear();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
