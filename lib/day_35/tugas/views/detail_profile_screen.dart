import 'package:flutter/material.dart';
import 'package:flutter_application_1/day_35/tugas/models/profile_response.dart'
    as profile_model;
import 'package:intl/intl.dart';

class DetailProfileScreen extends StatelessWidget {
  final profile_model.Data profileData;

  const DetailProfileScreen({super.key, required this.profileData});

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    return DateFormat('dd MMMM yyyy', 'id_ID').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final data = profileData;
    final batch = data.batch;
    final training = data.training;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ── Gradient Header ──
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF327AF4), Color(0xFF60A5FA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      // Top bar
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          const Text(
                            'Detail Profil',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Avatar
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.5),
                            width: 2.5,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 48,
                          backgroundColor: Colors.white.withOpacity(0.2),
                          backgroundImage: data.profilePhotoUrl != null
                              ? NetworkImage(data.profilePhotoUrl!)
                              : null,
                          child: data.profilePhotoUrl == null
                              ? const Icon(
                                  Icons.person_rounded,
                                  size: 48,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Name
                      Text(
                        data.name ?? '-',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data.email ?? '-',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.85),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── Informasi Pribadi ──
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
            sliver: SliverToBoxAdapter(
              child: _buildSection(
                title: 'Informasi Pribadi',
                icon: Icons.person_outline_rounded,
                children: [
                  _buildInfoTile(
                    icon: Icons.badge_outlined,
                    label: 'Nama Lengkap',
                    value: data.name ?? '-',
                    isFirst: true,
                  ),
                  _divider(),
                  _buildInfoTile(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: data.email ?? '-',
                  ),
                  _divider(),
                  _buildInfoTile(
                    icon: Icons.wc_rounded,
                    label: 'Jenis Kelamin',
                    value: data.jenisKelamin?.toString() ?? '-',
                  ),
                  _divider(),
                  _buildInfoTile(
                    icon: Icons.fingerprint_rounded,
                    label: 'ID Pengguna',
                    value: data.id?.toString() ?? '-',
                    isLast: true,
                  ),
                ],
              ),
            ),
          ),

          // ── Informasi Batch ──
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            sliver: SliverToBoxAdapter(
              child: _buildSection(
                title: 'Informasi Batch',
                icon: Icons.group_work_outlined,
                children: [
                  _buildInfoTile(
                    icon: Icons.group_work_outlined,
                    label: 'Batch',
                    value: data.batchKe ?? batch?.batchKe ?? '-',
                    isFirst: true,
                  ),
                  _divider(),
                  _buildInfoTile(
                    icon: Icons.calendar_today_rounded,
                    label: 'Tanggal Mulai',
                    value: _formatDate(batch?.startDate),
                  ),
                  _divider(),
                  _buildInfoTile(
                    icon: Icons.event_rounded,
                    label: 'Tanggal Selesai',
                    value: _formatDate(batch?.endDate),
                    isLast: true,
                  ),
                ],
              ),
            ),
          ),

          // ── Informasi Training ──
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            sliver: SliverToBoxAdapter(
              child: _buildSection(
                title: 'Informasi Training',
                icon: Icons.school_outlined,
                children: [
                  _buildInfoTile(
                    icon: Icons.school_outlined,
                    label: 'Judul Training',
                    value: data.trainingTitle ?? training?.title ?? '-',
                    isFirst: true,
                  ),
                  _divider(),
                  _buildInfoTile(
                    icon: Icons.description_outlined,
                    label: 'Deskripsi',
                    value: training?.description?.toString() ?? '-',
                  ),
                  _divider(),
                  _buildInfoTile(
                    icon: Icons.people_outline_rounded,
                    label: 'Jumlah Peserta',
                    value: training?.participantCount?.toString() ?? '-',
                  ),
                  _divider(),
                  _buildInfoTile(
                    icon: Icons.verified_outlined,
                    label: 'Standar',
                    value: training?.standard?.toString() ?? '-',
                  ),
                  _divider(),
                  _buildInfoTile(
                    icon: Icons.timer_outlined,
                    label: 'Durasi',
                    value: training?.duration?.toString() ?? '-',
                    isLast: true,
                  ),
                ],
              ),
            ),
          ),

          // Bottom padding
          const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
        ],
      ),
    );
  }

  // ─── Section Builder ─────────────────────────────────────────────────
  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 18,
              decoration: BoxDecoration(
                color: const Color(0xFF327AF4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 10),
            Icon(icon, size: 18, color: const Color(0xFF327AF4)),
            const SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF327AF4).withOpacity(0.06),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _divider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey.shade100,
      indent: 56,
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: isFirst ? 4 : 0, bottom: isLast ? 4 : 0),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF327AF4).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 20, color: const Color(0xFF327AF4)),
        ),
        title: Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
