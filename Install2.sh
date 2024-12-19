#!/bin/bash

# Detener la ejecución si ocurre un error
set -e

# Verificar si npm está instalado
if ! command -v npm &> /dev/null; then
    echo "npm no está instalado. Por favor, instale Node.js y npm primero."
    exit 1
fi

# Verificar si existe la carpeta node_modules
if [ -d "node_modules" ]; then
    echo "La carpeta 'node_modules' ya existe. Omitiendo descarga e instalación."
else
    echo "Descargando node_modules.tar.gz..."
    
    # Agregar manejo de errores para la descarga
    if ! curl -L -o node_modules.tar.gz https://github.com/elrebelde21/NovaBot_MD/releases/download/1.1.8/node_modules.tar.gz; then
        echo "Error al descargar node_modules.tar.gz"
        exit 1
    fi

    echo "Extrayendo node_modules..."
    # Agregar manejo de errores para la extracción
    if ! tar -xzf node_modules.tar.gz; then
        echo "Error al extraer node_modules.tar.gz"
        rm -f node_modules.tar.gz
        exit 1
    fi

    # Eliminar el archivo comprimido después de extraerlo
    rm -f node_modules.tar.gz
fi

# Verificar si existe package.json
if [ ! -f "package.json" ]; then
    echo "Error: No se encuentra package.json"
    exit 1
fi

echo "Iniciando el bot..."
# Agregar manejo de errores para npm start
if ! npm start; then
    echo "Error al iniciar el bot"
    exit 1
fi
#!/bin/bash
