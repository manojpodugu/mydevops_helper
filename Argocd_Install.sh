#NOTE:
#1) argocd installation only works with "kubectl".
#2) To use kubectl, we need created cluster first.

#Installation steps
kubectl create namespace argocd  #Create the namespace for argoCD
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml  #Install ArgoCD
#------------ Installation done---------------
kubectl get all -n argocd # After installing the ArgoCD, to check what resources it has created.
kubectl edit svc argocd-server -n argocd # entering into service file with "ClusterIP" type.

#reference when file is opened. Find the below pattern and change "ClusterIP" to "NodePort". After save and exit.

 #selector:
 #   app.kubernetes.io/name: argocd-server
 # sessionAffinity: None
 # type: ClusterIP
#status:
#  loadBalancer: {}

#--------------------reference ends here--------------------

#Note: Make sure, the port number: 30000 to 32767 are open on eks Worker nodes.


 


