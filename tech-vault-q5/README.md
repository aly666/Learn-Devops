Anda diminta untuk melengkapi berkas definisi di /home/ubuntu/tech-vault-q5/cluster-role-def.yml. Berkas itu harus mengandung konfigurasi untuk melakukan tindakan berikut:

Langkah 1: Buat ServiceAccount baru bernama chief-admin.

Langkah 2: Buat ClusterRole baru bernama monitor, yang memberikan izin pada semua API groups, semua resources, dan semua verbs (yakni wildcard *).

Langkah 3: Buat ClusterRoleBinding bernama chiefadmin-monitor yang mengikat (bind) ServiceAccount chief-admin dengan ClusterRole monitor.

Catatan: Solusi akan diverifikasi di lingkungan baru (fresh). Pastikan semua perubahan hanya ada pada berkas cluster-role-def.yml di /home/ubuntu/tech-vault-q5. Setelah selesai, jalankan sudo validate dari direktori soal untuk memverifikasi dan menyelesaikan tugas.
