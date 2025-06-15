# k8s-kurs

Kubernetes ve Docker teknolojilerini adım adım öğrenmek için hazırlanmış uygulamalı bir eğitim deposudur. Her klasör, belirli bir konuya veya Kubernetes bileşenine odaklanır ve ilgili YAML dosyaları, örnek uygulamalar ve açıklamalar içerir.

## İçerik Başlıkları

- **01-Kubernetes'e Giriş:** Temel kurulum, ortam hazırlığı ve ilk adımlar.
- **02-Docker ve K8S'e İlk Adım:** Docker ile uygulama çalıştırma, Kind ile Kubernetes cluster kurulumu.
- **03-Pods: Kubernetes’te Konteyner Çalıştırma:** Pod tanımları, loglama, port yönlendirme, label ve annotation kullanımı.
- **04-Replications & Controllers:** ReplicationController, ReplicaSet, DaemonSet, Job ve CronJob örnekleri.
- **05-Services:** Servis türleri ve servis tanımlamaları.
- **06-Volumes:** Volume ve PersistentVolume kullanımı.
- **07-ConfigMaps & Secrets:** Konfigürasyon ve gizli veri yönetimi.
- **08-Pod Metadatasına Erişim:** Pod metadata ve API erişimi.
- **09-Deployments:** Deployment nesnesi ve rollout işlemleri.
- **10-StatefulSets:** StatefulSet ile durumlu uygulama yönetimi.
- **11-Kubernetes Internals:** Kubernetes iç yapısı ve kontrol düzlemi.
- **12-Kubernetes API Server Güvenliği:** ServiceAccount, RBAC ve güvenlik uygulamaları.
- **13-Node ve Network Güvenliği:** Node güvenliği, SecurityContext ve ağ ayarları.
- **14-Pod Kaynak Yönetimi:** ResourceQuota, LimitRange, kaynak talepleri ve sınırları.
- **15-Autoscaling:** Horizontal Pod Autoscaler (HPA) ile otomatik ölçekleme.
- **16-Advanced Scheduling:** Affinity, Taints & Tolerations, gelişmiş scheduling örnekleri.

## Klasör Yapısı

```
k8s-kurs/
  01-Kubernetes'e Giriş/
  02-Docker ve K8S'e İlk Adım/
  03-Pods: Kubernetes’te Konteyner Çalıştırma/
  04-Replications & Controllers/
  05-Services/
  06-Volumes/
  07-ConfigMaps & Secrets/
  08-Pod Metadatasına Erişim/
  09-Deployments/
  10-StatefulSets/
  11-Kubernetes Internals/
  12-Kubernetes API Server Güvenliği/
  13-Node ve Network Güvenliği/
  14-Pod Kaynak Yönetimi/
  15-Autoscaling/
  16-Advanced Scheduling/
```

## Kullanım

1. **Ortamı Hazırlayın:**  
   Gerekli araçları kurmak için [01-Kubernetes'e Giriş/README.MD](01-Kubernetes'e%20Giriş/README.MD) dosyasındaki adımları takip edin.

2. **Klasörleri İnceleyin:**  
   Her klasörde ilgili konuya ait örnek YAML dosyalarını ve açıklamaları bulabilirsiniz.

3. **Uygulamaları Çalıştırın:**  
   Örnekleri uygulamak için terminalde ilgili YAML dosyalarını `kubectl apply -f dosya.yaml` komutuyla deploy edebilirsiniz.

4. **Temizleme:**  
   Denemelerinizden sonra ortamı temizlemek için genellikle klasörlerin sonunda yer alan "Clear environment" komutlarını kullanabilirsiniz.

## Katkı

Katkıda bulunmak için pull request gönderebilir veya issue açabilirsiniz.
