
# README  `actividad3.service`

Este documento describe el proceso de instalación y configuración del servicio `actividad3.service`, el cual es un servicio simple de `systemd` la funcion es imprimir "Hello world" y la fecha actual cada vez que este se ejecuta.

## Pre-requisitos

Crear archivos usando el comando sudo 
en `/etc/systemd/system/` para tener servicios con `systemd`.


### Paso 1: 

1. **Crear script**: Crear la carpeta donde se desea realizar la tarea `/home/javier/Escritorio/Semestre2024/Seminario`.

2. **Crear el Script**: Crear archivo`actividad.sh` con el siguiente contenido

```bash
#!/bin/bash
echo "Hello world"
echo "Fecha actual: $(date)"
```

3. **Hacer el Script Ejecutable**: Dar permisos de ejecución a  el script con el siguiente comando:

```bash/home/javier/Escritorio/Semestre2024/Seminario/actividad3.sh
```

### Paso 2: Crear el Archivo de Servicio de `systemd`

1. **Archivo de Servicio**: Crear un nuevo archivo en `/etc/systemd/system/` con el nombre de `actividad3.service`. utilizar el comando `sudo nano`.

```bash
sudo nano /etc/systemd/system/actividad3.service
```

2. **Archivo de Servicio**: El contenido debe ser `saludo_fecha.service`:

```ini
[Unit]
Description=Imprimer saludo y la fecha 

[Service]
Type=simple
ExecStart=/home/javier/Escritorio/Semestre2024/Seminario/actividad3.sh

[Install]
WantedBy=multi-user.target
```

3. **Guardar cambios**: Guardar cambios.

### Paso 3: Habilitar he Iniciar el Servicio

1. **Recargar `systemd`**: Para que `systemd` reconozca el nuevo servicio, recarga el daemon de `systemd`:

```bash
sudo systemctl daemon-reload
```

2. **Habilitar el Servicio**: Para que el servicio se inicie automáticamente en el arranque del sistema, habilita el servicio:

```bash
sudo systemctl enable actividad3.service
```

3. **Iniciar el Servicio**: Para iniciar el servicio manualmente sin reiniciar:

```bash
sudo systemctl start actividad3.service
```

### Paso 4: Verificación final 

Verificar si funciona correctamente:

```bash
sudo systemctl status saludo_fecha.service
```

Ver la salida del script:

```bash
journalctl -u saludo_fecha.service
```

