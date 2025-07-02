#!/bin/bash

SCRIPT_NAME="catlist.py"
BINARY_NAME="catlist"
FINAL_PATH="/usr/local/bin/$BINARY_NAME"

# Verifica se o script existe
if [ ! -f "$SCRIPT_NAME" ]; then
  echo "Error: $SCRIPT_NAME not found in the current directory."
  exit 1
fi

# Verifica se python3 está disponível
if ! command -v python3 &> /dev/null; then
  echo "Error: python3 not found in PATH."
  exit 1
fi

# Verifica se pip está disponível
if command -v pip3 &> /dev/null; then
  PIP_CMD="pip3"
elif command -v pip &> /dev/null; then
  PIP_CMD="pip"
else
  echo "Error: pip not found."
  exit 1
fi

# Verifica se pyinstaller está instalado
if ! command -v pyinstaller &> /dev/null; then
  echo "PyInstaller not found. Installing..."
  $PIP_CMD install pyinstaller
fi

# Cria o binário com PyInstaller
echo "Generating binary with PyInstaller..."
pyinstaller --onefile --name "$BINARY_NAME" "$SCRIPT_NAME"

# Verifica se binário foi criado
if [ ! -f "dist/$BINARY_NAME" ]; then
  echo "Error: binary not created."
  exit 1
fi

# Copia o binário para /usr/local/bin
echo "Copying binary to $FINAL_PATH..."
sudo cp "dist/$BINARY_NAME" "$FINAL_PATH"
sudo chmod +x "$FINAL_PATH"

# Limpa arquivos do PyInstaller
echo "Cleaning up..."
rm -rf build dist __pycache__ "$BINARY_NAME.spec"

echo "Installation complete! You can now run 'catlist' from anywhere."
