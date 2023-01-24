resource "helm_release" "ingress_nginx_2" {
  name       = "ingress-nginx-2"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.ingress_nginx_helm_version

  namespace        = var.ingress_nginx_2_namespace
  create_namespace = true

  values = [file("nginx_ingress_2_values.yaml")]

  depends_on = [kind_cluster.default]
}

resource "null_resource" "wait_for_ingress_nginx_2" {
  triggers = {
    key = uuid()
  }

  provisioner "local-exec" {
    command = <<EOF
      printf "\nWaiting for the nginx ingress 2 controller...\n"
      kubectl wait --namespace ${helm_release.ingress_nginx_2.namespace} \
        --for=condition=ready pod \
        --selector=app.kubernetes.io/component=controller \
        --timeout=90s
    EOF
  }

  depends_on = [helm_release.ingress_nginx_2]
}
