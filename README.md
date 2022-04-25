# Todo APP

To do app copied over from [daggers main repo](https://github.com/dagger/dagger/tree/main/pkg/universe.dagger.io/examples/todoapp)

[Dagger documentation website](https://docs.dagger.io/)


## Objectives

- [x] Adjust todoapp so that the entire steps to install, test & build via Yarn are reusable
- [x] Import this into todoapps CI 
- [ ] Make a Azure DevOps Pipeline to run Dagger to create a container image (for argo deployment)
- [x] Make a Github Actions Pipeline to run Dagger to deploy to netlify
- [ ] Spin up a K8s cluster with ArgoCD, this repo configured via terraform


## Other things that might be cool to add 

 - [ ] dependency scanning - don't allow any new vulnerabilities to be introduced by failing the pipeline (via snyk commands)
