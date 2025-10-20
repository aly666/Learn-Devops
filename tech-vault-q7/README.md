Terjemahan (Bahasa Indonesia)

Tujuan

Tugas Anda adalah menulis sebuah playbook Ansible yang mengotomatiskan tugas berikut pada server Ubuntu remote:

Langkah 1: Memperbarui cache package manager.

Langkah 2: Menginstal paket web server Apache (apache2).

Langkah 3: Mengaktifkan dan menjalankan service Apache.

Langkah 4: Men-deploy file index.html sederhana ke document root /var/www/html/. HTML tersebut menampilkan teks "Hello, Ansible!"

Persyaratan

Playbook harus idempotent — artinya bisa dijalankan berulang kali tanpa mengubah hasil setelah sudah dalam keadaan yang diinginkan.

Host target didefinisikan di inventory Ansible.

Simpan playbook sebagai /home/ubuntu/tech-vault-ansible/web_server_setup.yml.

Jalankan ansible-playbook web_server_setup.yml untuk memastikan berjalan tanpa error.

Diasumsikan SSH key sudah dikonfigurasi untuk autentikasi ke server target.


ansible-playbook -i hosts.ini web_server_setup.yml

