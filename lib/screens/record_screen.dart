import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';
import '../models/workout_record.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  final List<WorkoutRecord> _workoutRecords = [];
  double _totalHours = 0.0;

  final List<Map<String, dynamic>> _workoutTypes = [
    {'name': 'Jump rope', 'icon': '🪢', 'color': 0xFFFF6B35},
    {'name': 'Play soccer', 'icon': '⚽', 'color': 0xFF4ECDC4},
    {'name': 'Yoga', 'icon': '🧘', 'color': 0xFF9B59B6},
    {'name': 'Kettlebell', 'icon': '🏋️', 'color': 0xFFFF6B35},
    {'name': 'Punching bag', 'icon': '🥊', 'color': 0xFF4ECDC4},
    {'name': 'Running', 'icon': '🏃', 'color': 0xFFE74C3C},
    {'name': 'Swimming', 'icon': '🏊', 'color': 0xFF3498DB},
    {'name': 'Cycling', 'icon': '🚴', 'color': 0xFF2ECC71},
    {'name': 'Weightlifting', 'icon': '💪', 'color': 0xFFE67E22},
    {'name': 'Boxing', 'icon': '🥊', 'color': 0xFFC0392B},
  ];

  @override
  void initState() {
    super.initState();
    _loadWorkoutRecords();
  }

  Future<void> _loadWorkoutRecords() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final recordsJson = prefs.getString('workout_records');
      
      if (recordsJson != null) {
        final List<dynamic> recordsList = json.decode(recordsJson);
        final records = recordsList.map((json) => WorkoutRecord(
          id: json['id'] as String,
          name: json['name'] as String,
          icon: json['icon'] as String,
          date: DateTime.parse(json['date'] as String),
          hours: (json['hours'] as num).toDouble(),
          days: json['days'] as int,
          accentColor: Color(json['color'] as int),
        )).toList();

        setState(() {
          _workoutRecords.clear();
          _workoutRecords.addAll(records);
          _totalHours = records.fold(0.0, (sum, record) => sum + record.hours);
        });
      }
    } catch (e) {
      debugPrint('Error loading workout records: $e');
    }
  }

  Future<void> _saveWorkoutRecords() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final recordsJson = json.encode(_workoutRecords.map((record) => {
        'id': record.id,
        'name': record.name,
        'icon': record.icon,
        'date': record.date.toIso8601String(),
        'hours': record.hours,
        'days': record.days,
        'color': record.accentColor.value,
      }).toList());
      await prefs.setString('workout_records', recordsJson);
    } catch (e) {
      debugPrint('Error saving workout records: $e');
    }
  }

  void _showPublishDialog() {
    String selectedName = _workoutTypes[0]['name'] as String;
    String selectedIcon = _workoutTypes[0]['icon'] as String;
    Color selectedColor = Color(_workoutTypes[0]['color'] as int);
    double hours = 0.5;
    int days = 1;
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: Colors.grey[900],
              title: const Text(
                'Publish Workout',
                style: TextStyle(color: Colors.white),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Workout Type
                    const Text(
                      'Workout Type',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _workoutTypes.map((type) {
                        final isSelected = selectedName == type['name'];
                        return GestureDetector(
                          onTap: () {
                            setDialogState(() {
                              selectedName = type['name'] as String;
                              selectedIcon = type['icon'] as String;
                              selectedColor = Color(type['color'] as int);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? selectedColor.withOpacity(0.3)
                                  : Colors.grey[800],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isSelected ? selectedColor : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(type['icon'] as String, style: const TextStyle(fontSize: 20)),
                                const SizedBox(width: 4),
                                Text(
                                  type['name'] as String,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    // Hours
                    const Text(
                      'Hours',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle, color: Colors.white),
                          onPressed: () {
                            if (hours > 0.1) {
                              setDialogState(() {
                                hours = (hours - 0.1).clamp(0.1, 24.0);
                              });
                            }
                          },
                        ),
                        Expanded(
                          child: Text(
                            hours.toStringAsFixed(1),
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle, color: Colors.white),
                          onPressed: () {
                            setDialogState(() {
                              hours = (hours + 0.1).clamp(0.1, 24.0);
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Days
                    const Text(
                      'Days',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle, color: Colors.white),
                          onPressed: () {
                            if (days > 1) {
                              setDialogState(() {
                                days = days - 1;
                              });
                            }
                          },
                        ),
                        Expanded(
                          child: Text(
                            '$days',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle, color: Colors.white),
                          onPressed: () {
                            setDialogState(() {
                              days = days + 1;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Date
                    const Text(
                      'Date',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          setDialogState(() {
                            selectedDate = picked;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_today, color: Colors.white70, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              _formatDate(selectedDate),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
                ),
                ElevatedButton(
                  onPressed: () {
                    final newRecord = WorkoutRecord(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: selectedName,
                      icon: selectedIcon,
                      date: selectedDate,
                      hours: hours,
                      days: days,
                      accentColor: selectedColor,
                    );
                    setState(() {
                      _workoutRecords.add(newRecord);
                      _totalHours = _workoutRecords.fold(0.0, (sum, record) => sum + record.hours);
                    });
                    _saveWorkoutRecords();
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Workout published successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                  ),
                  child: const Text('Publish'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}';
  }

  List<WorkoutRecord> _getRecordsByDate(DateTime date) {
    return _workoutRecords.where((record) {
      return record.date.year == date.year &&
          record.date.month == date.month &&
          record.date.day == date.day;
    }).toList();
  }

  List<DateTime> _getUniqueDates() {
    if (_workoutRecords.isEmpty) return [];
    final dates = _workoutRecords.map((r) => DateTime(
          r.date.year,
          r.date.month,
          r.date.day,
        )).toSet().toList();
    dates.sort((a, b) => b.compareTo(a));
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/keya_allbg.webp',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: Colors.black);
              },
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Fitness Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Publish Button
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryColor.withOpacity(0.5),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add, color: Colors.white, size: 24),
                          onPressed: _showPublishDialog,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _workoutRecords.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.fitness_center,
                                size: 80,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No workout records yet',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Tap the + button to publish your first workout',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          padding: const EdgeInsets.only(bottom: 100, top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Workout Summary
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Workout',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(
                                          Icons.bolt,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '${_totalHours.toStringAsFixed(1)} hours',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              // Workout Records
                              ..._getUniqueDates().map((date) {
                                final records = _getRecordsByDate(date);
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Date Separator
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              AppTheme.primaryColor,
                                              AppTheme.primaryColor.withOpacity(0.8),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(Icons.calendar_today, color: Colors.white, size: 18),
                                            const SizedBox(width: 8),
                                            Text(
                                              _formatDate(date),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    // Workout Cards
                                    ...records.map((record) => _buildWorkoutCard(record)),
                                    const SizedBox(height: 16),
                                  ],
                                );
                              }),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutCard(WorkoutRecord record) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900]!.withOpacity(0.6),
          borderRadius: BorderRadius.circular(16),
          border: Border(
            left: BorderSide(
              color: record.accentColor,
              width: 4,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: record.accentColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    record.icon,
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Lasted for ${record.days} ${record.days == 1 ? 'day' : 'days'}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              // Time Display
              Container(
                width: 80,
                height: 60,
                decoration: BoxDecoration(
                  color: record.accentColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.access_time, color: Colors.white, size: 20),
                    const SizedBox(height: 4),
                    Text(
                      '${record.hours.toStringAsFixed(1)} hours',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
