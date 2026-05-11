import 'package:flutter/material.dart';

class TrackJobScreen extends StatelessWidget {
  const TrackJobScreen({super.key});

  final List<Map<String, dynamic>> _applications = const [
    {
      'title': 'Graphic Designer',
      'company': 'Polar Web-design',
      'logo': Icons.design_services_rounded,
      'color': 0xFF6366F1,
      'location': 'California, United States',
      'salary': '\$15k - \$35k / month',
      'time': '1 Month ago',
      'status': 'Accepted',
      'step': 4,
    },
    {
      'title': 'Graphic Designer',
      'company': 'Polar Web-design',
      'logo': Icons.design_services_rounded,
      'color': 0xFF6366F1,
      'location': 'California, United States',
      'salary': '\$15k - \$35k / month',
      'time': '1 Month ago',
      'status': 'Rejected',
      'step': 3,
    },
    {
      'title': 'Graphic Designer',
      'company': 'Polar Web-design',
      'logo': Icons.design_services_rounded,
      'color': 0xFF6366F1,
      'location': 'California, United States',
      'salary': '\$15k - \$35k / month',
      'time': '1 Month ago',
      'status': 'Review',
      'step': 2,
    },
  ];

  Color _statusColor(String status) {
    switch (status) {
      case 'Accepted':
        return const Color(0xFF10B981);
      case 'Rejected':
        return const Color(0xFFEF4444);
      default:
        return const Color(0xFFF59E0B);
    }
  }

  IconData _statusIcon(String status) {
    switch (status) {
      case 'Accepted':
        return Icons.check_circle;
      case 'Rejected':
        return Icons.cancel;
      default:
        return Icons.rate_review_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back, size: 20, color: Colors.black),
                    SizedBox(width: 8),
                    Text(
                      'Track Job',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: _applications.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.track_changes_outlined,
                            size: 64,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No Applied Job',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Your job applications will appear here',
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _applications.length,
                      itemBuilder: (context, i) {
                        final job = _applications[i];
                        final color = Color(job['color'] as int);
                        final status = job['status'] as String;
                        final step = job['step'] as int;
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFEEEEEE)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Job info
                              Center(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 52,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        color: color.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Icon(
                                        job['logo'] as IconData,
                                        color: color,
                                        size: 28,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      job['title'] as String,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      job['company'] as String,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF2563EB),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 13,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    job['location'] as String,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                job['salary'] as String,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2563EB),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    size: 12,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    job['time'] as String,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 16),
                              const Divider(color: Color(0xFFEEEEEE)),
                              const SizedBox(height: 12),

                              // ── Multi-step status flow ──
                              const Text(
                                'Application Status',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 12),
                              _buildStatusStepper(step, status),

                              const SizedBox(height: 12),
                              // Status badge
                              Row(
                                children: [
                                  Icon(
                                    _statusIcon(status),
                                    size: 18,
                                    color: _statusColor(status),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    status,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: _statusColor(status),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusStepper(int currentStep, String status) {
    final steps = ['Applied', 'Screening', 'Interview', 'Decision'];
    final stepColors = [
      const Color(0xFF2563EB),
      const Color(0xFF2563EB),
      const Color(0xFFF59E0B),
      const Color(0xFF10B981),
    ];
    final rejectedColor = const Color(0xFFEF4444);

    return Row(
      children: List.generate(steps.length, (i) {
        final isCompleted = i < currentStep;
        final isCurrent = i == currentStep - 1;
        final isRejected = status == 'Rejected' && i == currentStep - 1;
        Color dotColor;
        if (isRejected) {
          dotColor = rejectedColor;
        } else if (isCompleted || isCurrent) {
          dotColor = stepColors[i];
        } else {
          dotColor = const Color(0xFFDDE1E7);
        }

        return Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  if (i > 0)
                    Expanded(
                      child: Container(
                        height: 2,
                        color: i <= currentStep - 1
                            ? const Color(0xFF2563EB)
                            : const Color(0xFFDDE1E7),
                      ),
                    ),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: dotColor,
                    ),
                    child: Icon(
                      isRejected
                          ? Icons.close
                          : (isCompleted || isCurrent
                                ? Icons.check
                                : Icons.circle_outlined),
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                  if (i < steps.length - 1)
                    Expanded(
                      child: Container(
                        height: 2,
                        color: i < currentStep - 1
                            ? const Color(0xFF2563EB)
                            : const Color(0xFFDDE1E7),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                steps[i],
                style: TextStyle(
                  fontSize: 9,
                  color: isCompleted || isCurrent
                      ? Colors.black87
                      : Colors.grey,
                  fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }),
    );
  }
}
