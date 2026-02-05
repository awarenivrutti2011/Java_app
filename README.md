# StepUp Project – End‑to‑End DevOps Documentation (GitHub Reference)

This document is a **complete future reference** for the StepUp Java application covering **Git, Jenkins, Docker, Kubernetes, Helm, and MySQL**. It is written so you (or an interviewer) can **reproduce everything from scratch**.

---

## 1. Project Overview

**Application**: Java Web App (Tomcat WAR – `Java_app.war`)
**CI/CD**: Jenkins Pipeline
**Containerization**: Docker
**Orchestration**: Kubernetes (Minikube)
**Package Manager**: Helm
**Database**: MySQL (StatefulSet)

---

## 2. GitHub Repository Structure

```text
Java_app/
├── Dockerfile
├── Jenkinsfile
├── pom.xml
├── src/
│   └── main/
│       └── webapp/
├── helm/
│   └── stepup-chart/
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
│           ├── app-configmap.yaml
│           ├── app-secret.yaml
│           ├── app-deployment.yaml
│           ├── app-service.yaml
│           ├── mysql-secret.yaml
│           ├── mysql-configmap.yaml
│           ├── mysql-service.yaml
│           └── mysql-statefulset.yaml
```

---

## 3. Git Commands (Daily Reference)

### Clone Repository

```bash
git clone https://github.com/awarenivrutti2011/Java_app.git
cd Java_app
```

### Check Status

```bash
git status
```

### Add & Commit Changes

```bash
git add .
git commit -m "message"
```

### Push to GitHub

```bash
git push origin main
```

### Pull Latest Changes

```bash
git pull origin main
```

---

## 4. Docker

### Build Docker Image

```bash
docker build -t awarenivrutti11/stepup-app:v2 .
```

### Login to Docker Hub

```bash
docker login
```

### Push Image

```bash
docker push awarenivrutti11/stepup-app:v2
```

### Verify Image

```bash
docker images | grep stepup
```

---

## 5. Kubernetes – Basic Commands

### Check Cluster

```bash
kubectl get nodes
kubectl cluster-info
```

### Namespace

```bash
kubectl get ns
kubectl create ns stepup
```

### Pods / Services

```bash
kubectl get pods -n stepup
kubectl get svc -n stepup
```

### Logs & Exec

```bash
kubectl logs <pod> -n stepup
kubectl exec -it <pod> -n stepup -- bash
```

---

## 6. Helm

### Verify Helm

```bash
helm version
```

### Lint Chart

```bash
helm lint helm/stepup-chart
```

### Install / Upgrade

```bash
helm upgrade --install stepup helm/stepup-chart \
  --namespace stepup \
  --create-namespace \
  --set app.image=awarenivrutti11/stepup-app \
  --set app.tag=v2
```

### Dry Run

```bash
helm upgrade --install stepup helm/stepup-chart \
  --namespace stepup \
  --dry-run
```

### List Releases

```bash
helm list -n stepup
```

### Rollback

```bash
helm rollback stepup 1 -n stepup
```

### Uninstall

```bash
helm uninstall stepup -n stepup
```

---

## 7. Jenkins Pipeline (Execution Flow)

1. Checkout code from GitHub
2. Build WAR using Maven
3. Build Docker image
4. Push image to Docker Hub
5. Helm lint & dry-run
6. Helm deploy to Kubernetes

---

## 8. MySQL (Inside Kubernetes)

### Connect to MySQL Pod

```bash
kubectl exec -it mysql-0 -n stepup -- mysql -u stepup -p
```

### Select Database

```sql
USE stepupdb;
```

### Create Tables

```sql
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE,
  email VARCHAR(100),
  password VARCHAR(100),
  role VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Insert Data

```sql
INSERT INTO users (username,email,password,role)
VALUES ('admin','admin@stepup.com','admin123','ADMIN');
```

### Update Example

```sql
UPDATE users SET username='itadmin' WHERE role='ADMIN';
```

---

## 9. Application Access (IMPORTANT)

### Get Minikube IP

```bash
minikube ip
```

### Access URL

```text
http://<minikube-ip>:30007/Java_app
```

Example:

```text
http://192.168.49.2:30007/Java_app
```

---

## 10. Common Issues & Fixes

### Helm Namespace Error

**Cause**: Namespace created outside Helm
**Fix**: Remove namespace.yaml from Helm and let Helm manage it.

### 404 on Tomcat

**Cause**: WAR context path
**Fix**: Use `/Java_app` or deploy as `ROOT.war`.

### Jenkins Port Conflict

**Cause**: Jenkins uses 8080
**Fix**: Use NodePort 30007.

---

## 11. Interview‑Ready One‑Liners

* Deployment → Stateless apps
* StatefulSet → Databases
* ConfigMap → Non‑secret config
* Secret → Sensitive data
* Service → Stable networking
* Helm → Versioned, repeatable deployments

---

## 12. Final Summary

This project demonstrates:

✔ GitHub workflow
✔ Jenkins CI/CD
✔ Docker image lifecycle
✔ Kubernetes (Deployment, Service, StatefulSet)
✔ Helm packaging & deployment
✔ MySQL integration

This is **L3 DevOps / Application Support / SRE level documentation**.

---

