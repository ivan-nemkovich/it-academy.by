# 13.Kubernetes.Helm homework

## Wordpress installation
``` bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --set nfs.server=192.168.37.105 --set nfs.path=/mnt/IT-Academy/nfs-data/sa2-20-22/Ivan_Nemkovich
kubectl create namespace wordpress
helm install -n wordpress sa-wordpress --set global.storageClass=nfs-client,service.type=ClusterIP,wordpressUsername=admin,wordpressPassword=pass,mariadb.auth.rootPassword=secretpassword, bitnami/wordpress
vim wp_ingress.yml
kubectl apply -f wp_ingress.yml --namespace wordpress
```

## Wordpress screenshot
![wordpress](Wordpress.png)


