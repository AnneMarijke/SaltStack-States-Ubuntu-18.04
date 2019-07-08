kubeadm-join:
  cmd.run:
    - name: sudo kubeadm join 10.2.3.52:6443 --token mo2cqt.q97kw3ixqqlg8fxt --discovery-token-ca-cert-hash sha256:7a1894d29cc4856372a176e33f58cc4ded48333fed5bb4b345a2f1f914e3f947
    - creates: /etc/kubernetes/pki/ca.crt
