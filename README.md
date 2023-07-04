# Helm-ingress-configmap
Zadanie Helm/k8s/docker/nginx

 

Stwórz konfigurację produkcyjną dla prostej strony internetowej z wykorzystaniem bazowego obrazu Nginxa - Dockerfile, a następnie utwórz dla niego definicję deploymentu, używając Helma, trzymając się założeń:

1.konfiguracja HealthChecka:
-powinien odłączyć aplikację z przyjmowania połączeń przychodzących, jeżeli nie jest dostępna przez 30s
-restart aplikacji, jeżeli nie odpowiada przez 60s

2.aplikacja będzie na bieżąco rozwijana przez programistów, stąd najważniejsze wartości konfiguracyjne do HealthChecka powinny być w łatwy sposób konfigurowalne przez plik values.yaml

3.konfiguracja Ingressa:
-klasa: ingress-main
-domena: hello.XXX.XXX z obsługą https, certyfikat generowany przez Let’s encyrpt cluster-issuer

4.obsługa CORS'ów na requesty GET, PUT, POST, DELETE, OPTIONS

5.do PODa powinny zostać wstrzyknięte następujące zmienne środowiskowe
-KUBERNETES_POD_IP - dynamicznie zaciągany adres IP Poda
-HTTP_PROXY, 
-JSON_LOGS, 
-ENV, 
-APP_HOST, 
-APP_PORT - ręcznie wpisywane wartości w values.yaml, można również założyć, że w przyszłości będą dodawane nowe zmienne środowiskowe

6.Uwzględnić HA oraz bezpieczeństwo.

7.Oczekuje jedynie pliku Dockerfile oraz katalogu z Helm chartem.


- niezbędne to tego zadania będzie instalacja cert-managera i ingress-controlera
- certyfikaty moga być self-signed jak ktoś chce domene to moge podpiąć swoja z Cloudflare 


PART.2.
1.Wasz nginx powinien miec domyślny endpoint albo wystawione cokolwiek aby do tego uderzyć.
2.Jeżeli nie masz, to dostarcz configmapę do charta, dzięki której skonfigurujesz server nginx
3.Ogranicz dopuszczalne request body do 5Mb
4.Zweryfikuj rezultat punktu 3.
5.Dopuść w komunikacji jedynie protokoły TLSv1.2, TLSv1.3
6.Dopuść najaktualniejsze ciphersy
7.Wyłącz defaultowe ciphersy
8.Jaki będzie efekt punktów 6 i 7?
9.Zmodyfikuj domyślne timeouty nignx. Które i w jakim celu zmodyfikowałeś?
10.Zbuduj takiego curla aby uzyskać najwięcej informacji o konfiguracji ngninx
11.Ukryj informacje o używanej wersji servera nginx itp
12.Skonfiguruj przekierowanie HTTP na HTTPS. Zweryfikuj.
13.Skonfiguruj limit ilości równoczesnych połączeń do Nginx. Zweryfikuj.
14.Skonfiguruj białą listę adresów IP, które mają dostęp do Nginx. Zweryfikuj.
15.Skonfiguruj niestandardowe nagłówki HTTP, które mają być przekazywane do backendowych usług, takie jak X-Forwarded-For czy X-Forwarded-Proto.