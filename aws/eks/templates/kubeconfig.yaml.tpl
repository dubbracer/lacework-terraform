apiVersion: v1
clusters:
  - cluster:
      server: ${endpoint-url}
      certificate-authority-data: ${base64-encoded-ca-cert}
    name: kubernetes
contexts:
  - context:
      cluster: kubernetes
      user: aws
    name: aws
current-context: aws
kind: Config
preferences: {}
users:
  - name: aws
    user:
      exec:
        apiVersion: client.authentication.k8s.io/v1alpha1
        command: aws
        args:
          - "eks"
          - "get-token"
          - "--cluster-name"
          - "${cluster-name}"
          # - "--role-arn"
          # - "<role-arn>"
        # env:
        # - name: AWS_PROFILE
        #   value: "<aws-profile>"
