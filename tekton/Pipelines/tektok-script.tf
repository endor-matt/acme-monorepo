provider "kubernetes" {
  config_context_cluster    = "your-cluster-name"  # Name of your Kubernetes cluster context
  config_context_auth_info = "your-auth-info"    # Authentication info for your cluster context
  config_context_namespace  = "your-namespace"    # Namespace where you want to deploy Tekton resources
}

# Tekton Pipeline Resource - Source Repo
resource "kubernetes_manifest" "source_repo" {
  manifest = <<-EOT
apiVersion: tekton.dev/v1alpha1
kind: PipelineResource
metadata:
  name: your-git-resource
spec:
  type: git
  params:
    - name: revision
      value: master
    - name: url
      value: https://github.com/your-org/your-repo.git
EOT
}

# Tekton Pipeline
resource "kubernetes_manifest" "pipeline" {
  manifest = <<-EOT
apiVersion: tekton.dev/v1alpha1
kind: Pipeline
metadata:
  name: your-pipeline
spec:
  resources:
    - name: source-repo
      type: git
  tasks:
    - name: your-task
      taskRef:
        name: your-task
      resources:
        inputs:
          - name: source
            resource: source-repo
EOT
}

# Tekton Task
resource "kubernetes_manifest" "task" {
  manifest = <<-EOT
apiVersion: tekton.dev/v1alpha1
kind: Task
metadata:
  name: your-task
spec:
  steps:
    - name: your-step
      image: alpine
      command:
        - "echo"
      args:
        - "Hello, Tekton!"
EOT
}

chain:
  disabled: false                  # - `disabled` : if the value set as `true`, chains feature will be disabled (default: `false`)
  targetNamespace: tekton-pipelines
  controllerEnvs:
    - name: MONGO_SERVER_URL      # This is the only field supported at the moment which is optional and when added by user, it is added as env to Chains controller
      value: #value               # This can be provided same as env field of container
  artifacts.taskrun.format: in-toto
  artifacts.taskrun.storage: tekton,oci (comma separated values)
  artifacts.taskrun.signer: x509
  artifacts.oci.storage: oci (comma separated values)
  artifacts.oci.format: simplesigning
  artifacts.oci.signer: x509
  artifacts.pipelinerun.format: in-toto
  artifacts.pipelinerun.storage: tekton,oci (comma separated values)
  artifacts.pipelinerun.signer: x509
  storage.gcs.bucket: #value
  storage.oci.repository: #value
  storage.oci.repository.insecure: #value (boolean - true/false)
  storage.docdb.url: #value
  storage.grafeas.projectid: #value
  storage.grafeas.noteid: #value
  storage.grafeas.notehint: #value
  builder.id: #value
  signers.x509.fulcio.enabled: #value (boolean - true/false)
  signers.x509.fulcio.address: #value
  signers.x509.fulcio.issuer: #value
  signers.x509.fulcio.provider: #value
  signers.x509.identity.token.file: #value
  signers.x509.tuf.mirror.url: #value
  signers.kms.kmsref: #value
  signers.kms.kmsref.auth.address: #value
  signers.kms.kmsref.auth.token: #value
  signers.kms.kmsref.auth.oidc.path: #value
  signers.kms.kmsref.auth.oidc.role: #value
  signers.kms.kmsref.auth.spire.sock: #value
  signers.kms.kmsref.auth.spire.audience: #value
  transparency.enabled: #value (boolean - true/false)
  transparency.url: #value
