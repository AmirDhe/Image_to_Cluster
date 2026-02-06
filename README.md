# Atelier : De l'Image au Cluster (DevOps)

Ce projet automatise le cycle de vie complet d'une application Nginx personnalisée :
1.  **Build** de l'image Docker avec **Packer**.
2.  **Infrastructure** : Cluster Kubernetes léger (**K3d**).
3.  **Déploiement** : Orchestration via **Ansible**.

## Architecture

* **Packer** : Construit une image basée sur Nginx en y injectant un `index.html` personnalisé.
* **K3d** : Héberge l'application (1 Master, 2 Agents).
* **Ansible** : Pilote Kubernetes pour créer le Déploiement et le Service.

## Prérequis

Ce projet est conçu pour tourner dans un **GitHub Codespace**.
Les outils suivants sont nécessaires (et installés via le script de setup) :
* Packer
* Ansible & collection `kubernetes.core`
* K3d
* Kubectl

## Guide de démarrage rapide

Tout le processus est automatisé via un `Makefile`.

### 1. Lancer l'automatisation complète
Dans le terminal, exécutez simplement :

```bash
make all
```

Cette commande va séquentiellement :
* Installer les dépendances Ansible.
* Construire l'image Docker avec Packer.
* Importer l'image dans le cluster K3d.
* Déployer les manifestes Kubernetes via Ansible.

### 2. Accéder à l'application
Une fois le déploiement terminé, faites un port-forward pour accéder au site web :

```bash
kubectl port-forward svc/nginx-service 8082:80
```

Ouvrez votre navigateur sur `http://localhost:8082`.

## Structure du projet

* `nginx.pkr.hcl` : Configuration Packer pour l'image Docker.
* `playbook.yml` : Playbook Ansible pour le déploiement K8s.
* `Makefile` : Orchestrateur des commandes (Entrypoint).
* `index.html` : Code source de l'application.

## Auteur
Réalisé dans le cadre de l'atelier DevOps.
