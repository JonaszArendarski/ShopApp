# 🛒 Internetowy Sklep – Java / JSP / Tomcat / PostgreSQL

Projekt sklepu internetowego stworzony w technologii **Java EE** z wykorzystaniem **JSP**, **Apache Tomcat** oraz **PostgreSQL** jako bazy danych.  
Aplikacja umożliwia przeglądanie produktów, dodawanie ich do koszyka, składanie zamówień oraz zarządzanie nimi w panelu administracyjnym.

---

## 🖼️ Podgląd aplikacji

### 🏠 Ekran główny  
Widok panelu użytkownika z listą produktów oraz dostępem do historii zamówień.  
![Ekran główny](images/HomePage.png)

---

### 🛒 Koszyk użytkownika  
Widok koszyka z możliwością finalizacji zamówienia.  
![Koszyk](images/Cart.png)

---

### 🔧 Panel administratora  
Panel administracyjny umożliwia operacje **CRUD** (dodawanie, edycję i usuwanie produktów oraz zarządzanie zamówieniami).  
![Panel admina](images/admin.png)

---

## 🚀 Funkcjonalności

- 🔍 Przeglądanie listy produktów (wyszukiwanie, filtrowanie)
- 🛍️ Dodawanie produktów do koszyka i składanie zamówień
- 👤 Rejestracja i logowanie użytkowników
- 🧾 Podgląd historii zamówień
- 🛠️ Panel administracyjny (CRUD produktów, zarządzanie zamówieniami)
- 💾 Integracja z bazą danych **PostgreSQL**

---

## ⚙️ Użyte technologie

| Warstwa         | Technologia        |
|-----------------|--------------------|
| **Backend**     | Java EE, JSP       |
| **Frontend**    | HTML5, CSS3        |
| **Serwer**      | Apache Tomcat 10   |
| **Baza danych** | PostgreSQL         |

---

## 🧩 Instalacja i uruchomienie

### 1️⃣ Wymagania

- Zainstalowany **Apache Tomcat** (np. wersja **10.1**)  
- Zainstalowany **PostgreSQL**  
- **Java JDK 17+**  
- Opcjonalnie: środowisko IDE (np. IntelliJ IDEA, Eclipse)

---

### 2️⃣ Instalacja

1. **Sklonuj repozytorium:**
   ```bash
   git clone https://github.com/JonaszArendarski/ShopApp.git
   cd ShopApp

2. Utwórz bazę danych w PostgreSQL
   ```sql
   CREATE DATABASE shopapp;
   
3. Ustaw połaczenie z Bazą Danych   
 W pliku project/DriverManager.java
 ```java
String url = "jdbc:postgresql://twoj_host/shopapp";
String user = "twoja_nazwa_uzytkownika";
String password = "twoje_haslo";
```

4. Utwórz tabele w bazie danych
    Uruchom w aplikacji plik
   ```bash
   DB_Tables/createTables.jsp
   ```
5. Uruchom aplikacje w Tomcacie
   > Skonfiguruj projekt w IDE lub skopiuj pliki do katalogu webapps serwera Tomcat.
   > Uruchom serwer Tomcat 

