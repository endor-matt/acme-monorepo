#!/bin/bash

# This script demonstrates a simple CI/CD pipeline using Tekton Chains

# Set up environment variables
NAMESPACE="your-namespace"
SERVICE_ACCOUNT="your-service-account"
CHAIN_NAME="your-chain-name"

# Apply Tekton Chains resources
kubectl apply -f https://storage.googleapis.com/tekton-releases/chains/latest/release.yaml

# Create a namespace for your chain if it doesn't exist
kubectl create namespace $NAMESPACE

# Apply service account
kubectl apply -f - <<EOF
apiVersion: v1
kind: ServiceAccount
metadata:
  name: $SERVICE_ACCOUNT
  namespace: $NAMESPACE
EOF

# Apply chain resources
kubectl apply -f your-chain.yaml -n $NAMESPACE

# Start the chain
kubectl apply -f - <<EOF
apiVersion: chains.tekton.dev/v1alpha1
kind: ChainRun
metadata:
  name: your-chain-run
  namespace: $NAMESPACE
spec:
  chainRef:
    name: $CHAIN_NAME
  serviceAccountName: $SERVICE_ACCOUNT
EOF

echo "Chain run started. You can check the status using 'kubectl get chainrun -n $NAMESPACE'"

kubectl get po -n tekton-chains --watch

