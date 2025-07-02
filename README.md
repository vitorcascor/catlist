# Catlist

Exibe o conteúdo de arquivos no terminal com destaque do nome de cada arquivo e copia a saída para o clipboard (se disponível).

---

## Dependências

- Python 3.6+
- Utilitário de clipboard: `wl-copy`, `xclip` ou `xsel`

### Instalação das dependências no Linux

| Distribuição | Comando de instalação                             |
|--------------|--------------------------------------------------|
| Ubuntu/Debian| `sudo apt install python3 wl-clipboard xclip xsel` |
| Arch Linux   | `sudo pacman -S python wl-clipboard xclip xsel` |
| Fedora       | `sudo dnf install python3 wl-clipboard xclip xsel` |

---

## Instalação do Catlist

1. Dê permissão e rode o script de instalação:

```bash
chmod +x install.sh
./install.sh
