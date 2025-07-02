import sys
import os
from glob import glob
import subprocess
import shutil

def coletar_arquivo(nome_arquivo):
    if not os.path.isfile(nome_arquivo):
        return f"# [ERROR] File not found: {nome_arquivo}\n\n"

    resultado = f"```{nome_arquivo}\n"
    with open(nome_arquivo, "r", encoding="utf-8", errors="replace") as f:
        resultado += f.read()
    resultado += "\n```\n\n"
    return resultado

def copiar_para_clipboard(texto):
    if shutil.which("wl-copy"):
        subprocess.run(["wl-copy"], input=texto.encode("utf-8"))
        print("[Content copied to clipboard using wl-copy]")
    elif shutil.which("xclip"):
        subprocess.run(["xclip", "-selection", "clipboard"], input=texto.encode("utf-8"))
        print("[Content copied to clipboard using xclip]")
    elif shutil.which("xsel"):
        subprocess.run(["xsel", "--clipboard", "--input"], input=texto.encode("utf-8"))
        print("[Content copied to clipboard using xsel]")
    else:
        print("[No clipboard utility found (xclip, xsel, or wl-copy). Copy skipped.]")

if __name__ == "__main__":
    arquivos = sys.argv[1:]
    if not arquivos:
        print("Usage: catlist file1 [file2 ...]")
        sys.exit(1)

    saida_completa = ""
    for nome in arquivos:
        for caminho in sorted(glob(nome)):
            saida_completa += coletar_arquivo(caminho)

    print(saida_completa)
    copiar_para_clipboard(saida_completa)
