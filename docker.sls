docker_packages:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - curl
      - software-proper
      - docker-ce=18.06.2~ce~3-0~ubuntu

/etc/docker/daemon.json:
  file-managed:
    - contents: |
      {
        "exec-opts": ["native.cgroupdriver=systemd"],
        "log-driver": "json-file",
        "log-opts": {
        "max-size": "100m"
        },
        "storage-driver": "overlay2"
      }

running:
  service.running:
    - name: docker
    - enable: True
    - reload: True
