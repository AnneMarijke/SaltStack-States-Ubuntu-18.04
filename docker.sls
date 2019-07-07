docker.packages:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - gnupg-agent
      - software-properties-common

docker:
  pkg.installed:
    - pkgs:
      - docker-ce
      - docker-ce-cli
      - containerd.io

/etc/docker/daemon.json:
  file.append:
    - text: |
        {
          "live-restore": true
        }

run_docker:
  service.running:
    - name: docker
    - enable: True
