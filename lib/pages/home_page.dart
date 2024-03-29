import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../widgets/cards/emoticon_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _extent = 0.51;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[700],
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            return Stack(
              children: [
                const TopBar(),
                Positioned(
                  bottom: _extent * constraints.maxHeight * 0.99,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: SizedBox(
                      width: constraints.maxWidth,
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                        ),
                        child: Divider(
                          thickness: 10,
                          indent: 170,
                          endIndent: 170,
                        ),
                      ),
                    ),
                  ),
                ),
                // https://github.com/danialtham/draggablescrollablesheet_with_hovering_fab/blob/master/lib/main.dart
                NotificationListener<DraggableScrollableNotification>(
                  onNotification: (notification) {
                    setState(
                      () => _extent = notification.extent,
                    );
                    return false;
                  },
                  child: const ExerciseBar(),
                ),
              ],
            );
          }),
        ));
  }
}

class ExerciseBar extends StatelessWidget {
  const ExerciseBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.51,
      minChildSize: 0.51,
      maxChildSize: 0.84,
      builder: (context, scrollController) {
        return Container(
          color: Colors.white,
          child: ListView.builder(
            controller: scrollController,
            itemCount: 20,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 28.0,
                      right: 24.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Exercises",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_horiz),
                        ),
                      ],
                    ),
                  );
                default:
                  return const ExerciseTile();
              }
            },
          ),
        );
      },
    );
  }
}

class ExerciseTile extends StatelessWidget {
  const ExerciseTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        bottom: 12.0,
      ),
      child: ListTile(
        leading: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.blue[700],
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Speaking skills",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.more_horiz),
              ],
            ),
            Text(
              "16 Exercises",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 32.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hi, Jared!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "23 Jan, 2021",
                    style: TextStyle(
                      color: Colors.white.withAlpha(180),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(40),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        TextField(
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
            prefixIcon: const Padding(
              padding: EdgeInsets.only(
                left: 24.0,
                right: 12,
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            filled: true,
            fillColor: Colors.white.withAlpha(60),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "How do you feel?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
              color: Colors.white,
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EmoticonCard(
              emotion: "Badly",
            ),
            EmoticonCard(
              emotion: "Fine",
            ),
            EmoticonCard(
              emotion: "Well",
            ),
            EmoticonCard(
              emotion: "Excellent",
            ),
          ],
        ),
      ]),
    );
  }
}
