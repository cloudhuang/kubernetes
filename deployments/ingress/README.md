Kubernetes Ingress Controller
=================================================


- Traefik
    ```
    helm repo add traefik https://helm.traefik.io/traefik
    helm repo update
    kubectl create ns traefik-v2
    helm install --namespace=traefik-v2 traefik traefik/traefik
    ```