kubeadm-join:
  cmd.run:
    - name: sudo kubeadm join 10.2.3.52:6443 --token 653sxm.1jd6fzhxmgp68kkr --discovery-token-ca-cert-hash sha256:381b05695468a020a4ed9376ef48e0f5a32e89c68bc2ed55e66ed085da6d5d52
    - creates: /etc/kubernetes/pki/ca.crt
