Итоговый проект по курсу Devops практики и инструменты OTUS

Запуск проекта:
1. в директории infrastructure/terraform выполнить terraform apply -auto-approve
2. Дождаться создания инфраструктуры в yandex cloud.
3. Получить credrntial кластера kubernetes для работы с ним (yc managed-kubernetes cluster get-credentials --id <id_кластера> --external)
4. Установка ingresses-controller
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx
5. Деплой приложения в кластер:
в директории infrastructure/kubernetes выполнить.
kubectl apply -f backend/
kubectl apply -f frontend/

Мониторинг:
Установка Grafana.
helm upgrade --install prometheus prometheus/

Установка prometheus.
helm upgrade --install grafana helm/grafana/
