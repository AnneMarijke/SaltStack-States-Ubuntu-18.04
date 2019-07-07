kubernetes-repository:
  cmd.run:
    - names:
      - curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
      - sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
    - creates: /etc/kubernetes

kubernetes:
  pkg.installed:
    - name: kubeadm

no-swap:
  cmd.run:
    - name: sudo swapoff -a
