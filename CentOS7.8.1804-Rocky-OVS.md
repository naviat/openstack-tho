# Install OpenStack with script - CentOS-7.8

Yêu cầu:

- Cài đặt trên CentOS 7.5 1804 64bits
- Mỗi máy đều có 02 NIC: public + private

Mặc định các script đều cài OpenStack với OpenvSwitch. không sử dụng linux bridge.

Mô hình cài đặt: (bổ sung sau)

Để thực hiện cài đặt, trước tiên chuyển bị máy chủ cài đặt

## Cấu hình

Sau đó, vào máy chủ cài đặt git để kéo mã nguồn cài đặt về.

```sh
yum update -y && yum install git -y
```

Sau đó tải script cài đặt về:

```sh
git clone https://github.com/naviat/openstack-tho.git
```

Cho script quyền thực thi.

```sh
chmod +x openstack-tho/CentOS7.8.1804-Rocky-OVS/*.sh
```

Chỉnh sửa lại các thông tin phù hợp trong file.

```sh
nano openstack-tho/CentOS7.8.1804-Rocky-OVS/config.sh
```

Chạy lệnh cài đặt trên node controller:

```sh
cd openstack-tho/CentOS7.8.1804-Rocky-OVS/ && ./ctl-all.sh
```

Chạy lệnh cài đặt trên node compute1:

```sh
cd openstack-tho/CentOS7.8.1804-Rocky-OVS/ && ./com-all.sh
```