# Install OpenStack with script - Queen in Ubuntu 16.04

Yêu cầu:

- Cài đặt trên Ubuntu Server 16.04 64bits LTS
- Mỗi máy đều có 02 NIC: public + private

Mặc định các script đều cài OpenStack với OpenvSwitch. không sử dụng linux bridge.

Mô hình cài đặt: (bổ sung sau)

Để thực hiện cài đặt, trước tiên chuẩn bị máy chủ cài đặt

Cấu hình:

Nếu có repo offline thì sử dụng, không có thì bỏ qua đoạn thêm repo này.

```sh
echo 'Acquire::http::Proxy "http://172.16.68.18:3142";' >  /etc/apt/apt.conf
```

Sau đó, vào máy chủ, cài đặt git và kéo mã nguồn cài đặt về.

```sh
apt update -y && apt dist-upgrade -y && apt install git -y
```

Sau đó tải script cài đặt về:

```sh
git clone https://github.com/naviat/openstack-tho.git
```

Cho script quyền thực thi. Ở đây tôi cài Queens trên Ubuntu 16.04. Sử dụng Switch là OpenvSwitch

```sh
chmod +x openstack-tho/Ubuntu1604-Queens-OVS/*.sh
```

Chỉnh sửa lại thông tin trong file `openstack-tho/Ubuntu1604-Queens-OVS/config.sh` các thông tin phù hợp

Chạy lệnh cài đặt trên node controller:

```sh
cd openstack-tho/Ubuntu1604-Queens-OVS/ && ./ctl-all.sh
```

Chạy lệnh cài đặt trên node compute1:

```sh
cd openstack-tho/Ubuntu1604-Queens-OVS/ && ./com-all.sh
```