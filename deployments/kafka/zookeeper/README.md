# Deploy
	kustomize build . | kubectl apply -f -

# Undeploy
	kustomize build . | kubectl delete -f -