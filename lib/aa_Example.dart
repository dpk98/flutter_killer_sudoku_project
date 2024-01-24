import 'dart:math';

import 'package:flutter/material.dart';

class KillerSudokuGrid extends StatelessWidget {
  final int gridSize;
  final List<List<int>> cageConfig;

  KillerSudokuGrid({required this.gridSize, required this.cageConfig});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: KillerSudokuGridPainter(
          gridSize: gridSize,
          cageConfig: cageConfig,
        ),
      ),
    );
  }
}

class KillerSudokuGridPainter extends CustomPainter {
  final int gridSize;
  final List<List<int>> cageConfig;

  KillerSudokuGridPainter({required this.gridSize, required this.cageConfig});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    final Paint dottedPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final double cellWidth = size.width / gridSize;
    final double cellHeight = size.height / gridSize;

    // Draw horizontal lines
    for (int i = 1; i < gridSize; i++) {
      canvas.drawLine(
        Offset(0, i * cellHeight),
        Offset(size.width, i * cellHeight),
        paint,
      );
    }

    // Draw vertical lines
    for (int i = 1; i < gridSize; i++) {
      canvas.drawLine(
        Offset(i * cellWidth, 0),
        Offset(i * cellWidth, size.height),
        paint,
      );
    }

    // Draw dotted borders and color random boxes for cages based on the configuration
    for (int row = 0; row < cageConfig.length; row++) {
      for (int col = 0; col < cageConfig[row].length; col++) {
        if (cageConfig[row][col] == 1) {
          // Draw horizontal dotted line
          drawDottedLine(
            canvas,
            Offset(0, row * cellHeight),
            Offset(size.width, row * cellHeight),
            dottedPaint,
          );
        }
        if (cageConfig[row][col] == 2) {
          // Draw vertical dotted line
          drawDottedLine(
            canvas,
            Offset(col * cellWidth, 0),
            Offset(col * cellWidth, size.height),
            dottedPaint,
          );
        }
        if (cageConfig[row][col] == 3) {
          // Color the box with a random color
          paint.color = getRandomColor();
          canvas.drawRect(
            Rect.fromPoints(
              Offset(col * cellWidth, row * cellHeight),
              Offset((col + 1) * cellWidth, (row + 1) * cellHeight),
            ),
            paint,
          );
        }
      }
    }
  }

  void drawDottedLine(Canvas canvas, Offset p1, Offset p2, Paint paint) {
    final double dashLength = 8;
    final double spaceLength = 8;

    final double distance = sqrt(pow(p2.dx - p1.dx, 2) + pow(p2.dy - p1.dy, 2));
    final int segments = (distance / (dashLength + spaceLength)).ceil();

    final double dx = (p2.dx - p1.dx) / segments;
    final double dy = (p2.dy - p1.dy) / segments;

    Path path = Path();
    for (int i = 0; i < segments; i++) {
      double x = p1.dx + i * dx;
      double y = p1.dy + i * dy;
      if (i % 2 == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Killer Sudoku Grid'),
        ),
        body: Center(
          child: KillerSudokuGrid(
            gridSize: 9,
            cageConfig: generateRandomCageConfig(9),
          ),
        ),
      ),
    ),
  );
}

List<List<int>> generateRandomCageConfig(int gridSize) {
  Random random = Random();
  List<List<int>> cageConfig = List.generate(gridSize, (row) {
    return List.generate(gridSize, (col) {
      // 0: No border, 1: Horizontal border, 2: Vertical border, 3: Random color box
      return random.nextInt(4);
    });
  });
  return cageConfig;
}