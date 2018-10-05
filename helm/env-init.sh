ssh root@host01 "curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash; kubectl create -f rbac-config.yaml;"
