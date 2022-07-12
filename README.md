# Terraform Demo

<img src="https://camo.githubusercontent.com/1a4ed08978379480a9b1ca95d7f4cc8eb80b45ad47c056a7cfb5c597e9315ae5/68747470733a2f2f7777772e6461746f636d732d6173736574732e636f6d2f323838352f313632393934313234322d6c6f676f2d7465727261666f726d2d6d61696e2e737667" alt="drawing" width="400"/>

Terraform is mainly used for the construction of virtual environments, including virtual machines or resources from cloud providers. The communication with the provider (VM Server, Cloud Provider) is through the API released by the provider.

Terraform is not limited to the construction of virtual resources, you can customize any module with GO, as long as you have the corresponding API, you can tell terraform to do anything.

Here is some simple demo of what terraform can do.

## 1. Create K8s cluster on GCP

This demo shows how to build a Kubernetes cluster using cloud resources.

Of course, you can have better options in the cloud, such as GKE, EKS

## 2. Add worker node to existing cluster
Terraform is the best choice if you want to quickly build multiple virtual machines with similar functions
