**Проектная работа по курсу Devops практики и инструменты.**
Общее описание:
	Проект описывает процессы развертывания инфраструктуры и запуска приложения - Интернет магазин пельменей "Пельмешки без спешки".
Репозиторий содержит код, который позволяет развернуть инфраструктуру в yandex cloud и запустить приложение. 
Репозиторий состоит из:
```
 |- backend        
 |- frontend       
 |- infrastructure
     |- helm       
        |- gitlab
        |- gitlab-agent
        |- grafana
        |- loki
	    |- project-otus
        |- prometheus
        |- tirkster
     |- kubernetes
        |- backend
        |- frontend
     |- terraform
        |- project-images

```
Cостав :
	1. backend - исходный код бэкэнда на языке Go, Dockerfile для контейниризации приложения, файл backend_build.yml, с описанием этапов CI/CD процессов;
	2. forntend -  исходный код фронтенда на языке nodejs, Dockerfile для контейниризации приложения, файл frontend_build.yml, c описанием этапов CI/CD процессов;
	3. infrastructure/helm - helm-charts для приложения: gitlab, grafana, prometheus и др.;
	4. infrastructure/kubernetes - манифесты для запуска публикации приложения в кластере kubernetes;
 	5. infrastructure/terraform - файлы конфигурации для разворачивания инфраструктуры в yandex cloud;

Разворачивание инфраструктуры кластера:

```
cd terraform
terraform apply -auto-approve
```
Получаем credentials для подключения к кластеру.
```
yc managed-kubernetes cluster get-credentials --external --id catc6f01rj72nl38ispm --force

```
Установка ingress контроллера:
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx && \
helm repo update && \
helm install ingress-nginx ingress-nginx/ingress-nginx
```

Установка менеджера сертификатов:
```
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.3/cert-manager.crds.yaml
```
Разворачивание приложения:
```
cd infrastructure/kubernetes/
kubectl apply -f backend/
kubectl apply -f frontend/
```

Разворачиваем мониторинг:
Grafana.
```
helm upgrade --install grafana ./grafana --atomic
```
Prometheus.
```
helm upgrade --install --values prometheus/prometheus-values.yaml prometheus prometheus-community/prometheus
```
Loki:
```
helm upgrade --install loki ./loki --atomic
```
Прописываем для всех А записей в cloud DNS адрес балансировщика для доступа к домену и поддоменам.


Приложение доступно по адресу https://project-otus.ru
![[Pasted image 20240524135533.png]]
**Сбора метрик кластера.**  https://prometheus.project-otus.ru
	![[Pasted image 20240524135629.png]]
**Мониторинга параметров работы кластера.** https://grafana.project-otus.ru

![[Pasted image 20240524152204.png]]

**Сбор логов с кластера.**
Развернут сервис loki. Логи хранятся в s3 хранилище yandex cloud
![[Pasted image 20240528004616.png]]

CI/CD (Gitlab).
Поднять локальный репозиторий gitlab.

```

```
