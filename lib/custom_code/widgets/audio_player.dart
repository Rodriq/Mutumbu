// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:audioplayers/audioplayers.dart' as ap;
import 'dart:math' as math;

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({
    super.key,
    this.width,
    this.height,
    required this.musicRes,
  });

  final double? width;
  final double? height;
  final MusicResStruct musicRes;

  @override
  State<AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  late ap.AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = ap.AudioPlayer();
    _initializePlayer();
  }

  void _initializePlayer() async {
    // Listen to player state changes
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == ap.PlayerState.playing;
        });
      }
    });

    // Listen to duration changes
    _audioPlayer.onDurationChanged.listen((duration) {
      if (mounted) {
        setState(() {
          _duration = duration;
        });
      }
    });

    // Listen to position changes
    _audioPlayer.onPositionChanged.listen((position) {
      if (mounted) {
        setState(() {
          _position = position;
        });
      }
    });

    // Set the audio source
    await _audioPlayer.setSourceUrl(widget.musicRes.audioUrl1);
  }

  Future<void> _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.resume();
    }
  }

  Future<void> _seekForward() async {
    final newPosition = _position + const Duration(seconds: 10);
    if (newPosition < _duration) {
      await _audioPlayer.seek(newPosition);
    } else {
      await _audioPlayer.seek(_duration);
    }
  }

  Future<void> _seekBackward() async {
    final newPosition = _position - const Duration(seconds: 10);
    if (newPosition > Duration.zero) {
      await _audioPlayer.seek(newPosition);
    } else {
      await _audioPlayer.seek(Duration.zero);
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF1A1A2E),
            const Color(0xFF0F0F1E),
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Cover Image with Waveform
              LayoutBuilder(
                builder: (context, constraints) {
                  final imageSize = math.min(
                    constraints.maxWidth * 0.8,
                    300.0,
                  );
                  final imageHeight = imageSize * 0.67;

                  return Container(
                    width: imageSize,
                    height: imageHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF9D4EDD),
                          const Color(0xFF7B2CBF),
                        ],
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        children: [
                          // Cover Image
                          if (widget.musicRes.hasAlbumCover() &&
                              widget.musicRes.albumCover.isNotEmpty)
                            Image.network(
                              widget.musicRes.albumCover,
                              width: imageSize,
                              height: imageHeight,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: const Color(0xFF7B2CBF),
                                  child: const Icon(
                                    Icons.music_note,
                                    color: Colors.white,
                                    size: 64,
                                  ),
                                );
                              },
                            ),
                          // Waveform visualization overlay
                          CustomPaint(
                            size: Size(imageSize, imageHeight),
                            painter: WaveformPainter(
                              progress: _duration.inMilliseconds > 0
                                  ? _position.inMilliseconds /
                                      _duration.inMilliseconds
                                  : 0.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Track Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.musicRes.hasTitle() && widget.musicRes.title.isNotEmpty
                      ? widget.musicRes.title
                      : 'Untitled Track',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.musicRes.hasGenre() && widget.musicRes.genre.isNotEmpty
                      ? widget.musicRes.genre
                      : 'AI Generated Track',
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 24),

              // Progress Bar
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 3,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 6),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 12),
                  activeTrackColor: const Color(0xFF9D4EDD),
                  inactiveTrackColor: Colors.white24,
                  thumbColor: const Color(0xFF9D4EDD),
                ),
                child: Slider(
                  value: _position.inMilliseconds.toDouble(),
                  max: _duration.inMilliseconds
                      .toDouble()
                      .clamp(1.0, double.infinity),
                  onChanged: (value) async {
                    await _audioPlayer
                        .seek(Duration(milliseconds: value.toInt()));
                  },
                ),
              ),

              // Time Labels
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formatDuration(_position),
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      _formatDuration(_duration),
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Control Buttons
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: [
                  // Shuffle Button
                  IconButton(
                    icon: const Icon(Icons.shuffle, color: Colors.white54),
                    onPressed: () {},
                    iconSize: 24,
                  ),

                  // Previous/Backward Button
                  IconButton(
                    icon: const Icon(Icons.skip_previous, color: Colors.white),
                    onPressed: _seekBackward,
                    iconSize: 32,
                  ),

                  // Play/Pause Button
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF9D4EDD),
                          const Color(0xFF7B2CBF),
                        ],
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: _togglePlayPause,
                      iconSize: 32,
                    ),
                  ),

                  // Next/Forward Button
                  IconButton(
                    icon: const Icon(Icons.skip_next, color: Colors.white),
                    onPressed: _seekForward,
                    iconSize: 32,
                  ),

                  // Repeat Button
                  IconButton(
                    icon: const Icon(Icons.repeat, color: Colors.white54),
                    onPressed: () {},
                    iconSize: 24,
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class WaveformPainter extends CustomPainter {
  final double progress;

  WaveformPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final playedPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    // Generate waveform bars
    final barCount = 12;
    final barWidth = 3.0;
    final spacing = (size.width - (barCount * barWidth)) / (barCount + 1);
    final heights = [60, 90, 50, 100, 70, 85, 95, 75, 65, 80, 50, 90];

    for (int i = 0; i < barCount; i++) {
      final x = spacing + (i * (barWidth + spacing)) + (barWidth / 2);
      final barHeight = heights[i % heights.length];
      final y1 = (size.height - barHeight) / 2;
      final y2 = y1 + barHeight;

      final currentPaint = (i / barCount) <= progress ? playedPaint : paint;

      canvas.drawLine(
        Offset(x, y1),
        Offset(x, y2),
        currentPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant WaveformPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
