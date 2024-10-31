echo 'Deploying App on Kubernetes'
rancher login $RANCHER_URL --context $RANCHER_CONTEXT --token $RANCHER_CREDS_USR:$RANCHER_CREDS_PSW
envsubst < k8s/petclinic_chart/values-template.yaml > k8s/petclinic_chart/values.yaml
sed -i s/HELM_VERSION/${BUILD_NUMBER}/ k8s/petclinic_chart/Chart.yaml
rancher kubectl create ns petclinic-prod-ns || echo "namespace petclinic-prod-ns already exists"
rancher kubectl delete secret regcred -n petclinic-prod-ns || echo "there is no regcred secret in petclinic-prod-ns namespace"
rancher kubectl create secret generic regcred -n petclinic-prod-ns \
    --from-file=.dockerconfigjson=/var/lib/jenkins/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson
rm -f k8s/config
rancher cluster kf $CLUSTERID > k8s/config
chmod 400 k8s/config
AWS_REGION=$AWS_REGION helm repo add stable-petclinic s3://petclinic-helm-charts-seryum26/stable/myapp/ || echo "repository name already exists"
AWS_REGION=$AWS_REGION helm repo update
helm package k8s/petclinic_chart
helm s3 push --force petclinic_chart-${BUILD_NUMBER}.tgz stable-petclinic
helm repo update
AWS_REGION=$AWS_REGION helm upgrade --install petclinic-app-release stable-petclinic/petclinic_chart --version ${BUILD_NUMBER} --namespace petclinic-prod-ns --kubeconfig k8s/config
