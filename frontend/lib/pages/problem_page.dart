import 'dart:convert';

import 'package:continental_manual_helper/models/problem.dart';
import 'package:continental_manual_helper/models/step.dart';
import 'package:continental_manual_helper/screens/manual_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProblemPage extends StatefulWidget {
  const ProblemPage({super.key, required this.problem});

  final Problem problem;

  @override
  State<ProblemPage> createState() => _ProblemPageState();
}

class _ProblemPageState extends State<ProblemPage> {
  late List<int> scores = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.problem.description),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Solutions",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 44),
              ),
              (widget.problem.solutions == null ||
                      widget.problem.solutions!.isEmpty)
                  ? Expanded(
                      child: Center(
                        child: Text(
                          "No solutions yet",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: widget.problem.solutions!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Solution ${index + 1}",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  for (StepModel step
                                      in widget.problem.solutions![index].steps)
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          step.description,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        step.code == null
                                            ? const SizedBox(height: 1)
                                            : Text(
                                                step.code!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                        color: Colors.blue),
                                              ),
                                        step.link == null
                                            ? const SizedBox(height: 1)
                                            : GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Scaffold(
                                                        body: ManualScreen(
                                                          pageNumber: step.link,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  "Go to page ${step.link!}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                        step.imagePath == null
                                            ? const SizedBox(height: 1)
                                            : Image.network(step.imagePath!),
                                      ],
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          if (scores[index] > 0) {
                                            return;
                                          }
                                          final response = await http.get(Uri.parse(
                                              "https://manual.sunjet-project.de/faq/upvote/${widget.problem.solutions![index].id}"));
                                          final responseBody =
                                              json.decode(response.body)
                                                  as Map<String, dynamic>;
                                          scores[index] =
                                              responseBody['score'] as int;
                                          setState(() {});

                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  "Solution ${index + 1} is liked"),
                                            ),
                                          );
                                        },
                                        icon: const Icon(Icons.favorite),
                                      ),
                                      Text(
                                        scores[index].toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          if (scores[index] < 0) {
                                            return;
                                          }
                                          final response = await http.get(Uri.parse(
                                              "https://manual.sunjet-project.de/faq/downvote/${widget.problem.solutions![index].id}"));
                                          final responseBody =
                                              json.decode(response.body)
                                                  as Map<String, dynamic>;
                                          setState(() {
                                            scores[index] =
                                                responseBody['score'] as int;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  "Solution ${index + 1} is disliked"),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                            Icons.favorite_border_rounded),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
