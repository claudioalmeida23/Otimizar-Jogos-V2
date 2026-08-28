# 🎮 Otimizador Turbo Gamer v13.00006

Script em **Batch (.bat)** para Windows que centraliza, em um único menu interativo no terminal, um conjunto de rotinas de diagnóstico, otimização de desempenho, limpeza e manutenção voltadas para jogadores.

> ⚠️ **Requer privilégios de Administrador.** O script verifica isso automaticamente e se encerra caso não seja executado como admin.

---

## 📋 Índice

- [Visão geral](#-visão-geral)
- [Funcionalidades](#-funcionalidades)
- [Requisitos](#-requisitos)
- [Como usar](#-como-usar)
- [Detalhamento das opções do menu](#-detalhamento-das-opções-do-menu)
- [Avisos e riscos](#-avisos-e-riscos)
- [Como reverter as alterações](#-como-reverter-as-alterações)
- [Estrutura técnica](#-estrutura-técnica)
- [Autor](#-autor)

---

## 🧭 Visão geral

Ao ser executado, o script:

1. Verifica se está rodando como Administrador (encerra caso contrário).
2. Coleta informações básicas do sistema (SO e quantidade de RAM instalada).
3. Exibe um menu ASCII com **9 opções numeradas + ajuda**, permitindo ao usuário escolher qual rotina executar.

Todas as ações são feitas via combinação de comandos nativos do Windows (`powercfg`, `reg`, `netsh`, `sc`, `wevtutil`, `sfc`, `chkdsk`, etc.) e PowerShell, sem dependências externas.

---

## ✨ Funcionalidades

| # | Opção | O que faz |
|---|-------|-----------|
| 1 | Diagnóstico Detalhado | Executa `systeminfo` e exibe relatório completo do sistema |
| 2 | Otimização Gamer | Ativa plano de energia de desempenho máximo, Game Mode, ajusta prioridade de CPU e limpa DNS |
| 3 | Deep Clean | Limpa arquivos temporários, cache de shaders DirectX, Prefetch, logs de eventos e lixeira |
| 4 | Ajuste Visual | Abre as configurações avançadas de desempenho do Windows (efeitos visuais) |
| 5 | Reiniciar Explorer | Finaliza e reinicia o `explorer.exe` para liberar memória |
| 6 | Modo Equilibrado | Reverte as alterações do plano de energia e prioridade de CPU |
| 7 | Manutenção e Segurança | Submenu com SFC, CHKDSK e MSRT |
| 8 | Latência e Telemetria | Ajusta parâmetros de TCP/IP e desativa serviços de telemetria (DiagTrack, dmwappushservice) |
| 9 | Cache do Windows Update | Limpa a pasta `SoftwareDistribution\Download` |
| A | Ajuda | Exibe explicação de cada opção em uma janela pop-up |
| 0 | Sair | Encerra o script |

---

## 💻 Requisitos

- Windows 10 ou 11
- Execução como **Administrador**
- PowerShell habilitado (usado internamente para caixas de diálogo e ponto de restauração)
- Codificação de terminal compatível com UTF-8 (o script já ajusta isso com `chcp 65001`)

---

## 🚀 Como usar

1. Baixe o arquivo `.bat` do repositório.
2. Clique com o botão direito sobre o arquivo e selecione **"Executar como administrador"**.
3. Aguarde o carregamento do menu principal.
4. Digite o número (ou letra) da opção desejada e pressione `Enter`.
5. Siga as instruções exibidas em tela para cada rotina.

---

## 🔍 Detalhamento das opções do menu

### 1. Diagnóstico Detalhado Completo
Executa o comando `systeminfo`, exibindo dados como versão do sistema, hardware, hotfixes instalados, domínio, entre outros.

### 2. Aplicar Otimização Gamer
- Pergunta se deseja criar um **ponto de restauração** antes de aplicar as mudanças (recomendado).
- Duplica e ativa o plano de energia **Desempenho Máximo**.
- Ativa o **Game Mode** da Xbox Game Bar via registro.
- Ajusta `Win32PrioritySeparation` para priorizar programas em primeiro plano.
- Limpa o cache DNS (`ipconfig /flushdns`).

### 3. Limpeza Deep Clean
Remove:
- Arquivos temporários do usuário e do sistema (`%temp%`, `C:\Windows\Temp`)
- Cache de shaders DirectX
- Arquivos de Prefetch
- Logs de eventos (Setup, System, Application)
- Esvazia a Lixeira

### 4. Ajustar Visual para Desempenho
Abre diretamente a tela **Opções de Desempenho** do Windows, onde o usuário pode escolher manualmente "Ajustar para obter um melhor desempenho".

### 5. Reiniciar Windows Explorer
Finaliza o processo `explorer.exe` e o reinicia, útil para liberar RAM acumulada pela interface gráfica sem precisar reiniciar o PC.

### 6. Ativar Modo Equilibrado (Reverter)
Restaura o plano de energia padrão (`SCHEME_BALANCED`) e o valor original de `Win32PrioritySeparation`.

### 7. Manutenção e Segurança
Submenu com:
- **SFC Scannow** — repara arquivos de sistema corrompidos
- **CHKDSK** — verifica e corrige erros no disco `C:`
- **MSRT** — abre a Ferramenta de Remoção de Software Mal-Intencionado da Microsoft

### 8. Reduzir Latência e Telemetria
- Ajusta parâmetros globais de TCP (`autotuninglevel`, `chimney`)
- Desativa os serviços `DiagTrack` e `dmwappushservice`, associados à coleta de telemetria

### 9. Limpeza de Cache do Windows Update
Para os serviços `wuauserv` e `bits`, apaga a pasta de downloads pendentes de atualização e reinicia os serviços — útil quando o Windows Update trava.

### A. Ajuda
Exibe uma janela (via PowerShell + WPF) com a descrição resumida de todas as opções acima.

---

## ⚠️ Avisos e riscos

- O script realiza **alterações reais no registro do Windows, serviços do sistema e arquivos temporários**. Use por sua conta e risco.
- Recomenda-se **sempre criar um ponto de restauração** antes de aplicar a opção 2 (o script já oferece essa opção).
- A opção **CHKDSK** pode exigir reinicialização do sistema para concluir a verificação, dependendo do estado do disco.
- Desativar serviços de telemetria (opção 8) pode, em raros casos, afetar diagnósticos remotos de suporte da Microsoft.
- O script **não** desinstala programas nem realiza alterações irreversíveis sem aviso prévio.

---

## ↩️ Como reverter as alterações

Use a opção **[6] Ativar Modo Equilibrado** no menu para restaurar:
- Plano de energia padrão do Windows
- Prioridade de CPU original

Caso tenha criado um ponto de restauração (opção 2), também é possível reverter todo o sistema pelo painel **Restauração do Sistema** do Windows.

---

## 🛠️ Estrutura técnica

- Linguagem: **Batch script (.bat)**, com trechos em **PowerShell** para tarefas específicas (ponto de restauração, caixas de diálogo)
- Compatível com terminal `cmd.exe`
- Sem dependências externas ou downloads de terceiros
- Detecção automática de RAM instalada via `wmic computersystem get TotalPhysicalMemory`
- Interface em modo texto (95 colunas x 48 linhas) com arte ASCII

---

## 👤 Autor

**Claudio Almeida.CAAS**
Repositório: [Otimizador_Turbo_GamerV12](https://github.com/claudioalmeida23/Otimizador_Turbo_GamerV12)

---

## 📄 Licença

Este projeto está licenciado sob os termos da **Licença MIT**.

```
MIT License

Copyright (c) 2026 Claudio Almeida.CAAS

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
