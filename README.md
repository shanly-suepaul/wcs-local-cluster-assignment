# Kind K8s Cluster with Two Nginx Pods

Much of the code here is based on an example repo from [Nick Janetakis](https://nickjanetakis.com/blog/configuring-a-kind-cluster-with-nginx-ingress-using-terraform-and-helm).

This repository contains the infrastructure config for a locally hosted Kubernetes cluster with two Nginx pods.

The pods are configured to run on separate namespaces, as they both set up an ingress.

## Installation

1. Install Kind.
2. Install `kubectl`, the Kubernetes CLI tool.
3. Install Terraform.
4. Run `terraform apply`.
5. Confirm the changes are acceptable.

## Validation

After all steps are complete, you can configure `kubectl` to use your local cluster and check for the running pods:

1. Run `kubectl config set-cluster kind-demo-local`
2. Run `kubectl get pods --all-namespaces | grep nginx`. You should see a pod in each ingress namespace.

## Next Steps

You can create further pods and services to use the ingress in each namespace.
