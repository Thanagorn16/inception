## 🎮 Controls

Since this project is related to Docker and system configuration (not a game or interactive program), "Controls" refers to available scripts or command usage for managing the services.

### 🛠️ Makefile Commands

| Command             | Description                             |
|---------------------|-----------------------------------------|
| `make`              | Builds all Docker images and starts containers |
| `make down`         | Stops and removes all containers        |
| `make clean`        | Cleans up Docker volumes and images     |
| `make rebuild`      | Rebuilds containers from scratch        |

> These commands assume you are in the root project directory.

### 📂 Service Containers

| Service     | Description                            |
|-------------|----------------------------------------|
| NGINX       | Acts as a reverse proxy and SSL terminator |
| WordPress   | CMS container                          |
| MariaDB     | Database for WordPress                 |
| Redis       | Caching layer                          |
| Adminer     | Database management UI                 |
| FTP         | File transfer setup                    |

### ⚠️ Notes
- Environment variables are managed in `.env`.
- Ensure Docker and Docker Compose are installed.
- Ports may be exposed on `localhost`.

