# 🚀 Otimizador de Jogos - V6 TURBO Por Claudio Almeida

> 🧭 **Versão com menu interativo + log automático**  
> 🧹 Limpeza, 🔧 reparo, 🌐 otimização de rede e 🔋 modo de alto desempenho — tudo em um só script!  
> 💾 100% seguro e compatível com Windows 10/11.

---

## ⚙️ Funções principais

| Função | Descrição |
|--------|------------|
| 🧹 **Limpeza de sistema** | Remove arquivos temporários, caches do Windows, DirectX e NVIDIA |
| 🔧 **Reparo do sistema** | Executa `SFC /scannow` e `DISM` para corrigir erros |
| 🌐 **Otimização de rede** | Reseta Winsock, IP e firewall, limpando DNS e conexões |
| ⚙️ **Reinício de serviços** | Reinicia `BITS`, `Wuauserv` e `Cryptsvc` |
| 🔋 **Modo alto desempenho** | Ativa plano de energia máximo para jogos |
| 💽 **Verificação de discos** | Executa CHKDSK em modo leitura (sem travar) |
| 📁 **Gera relatório automático** | Salva log completo em `Relatorio_Otimizacao.txt` |

---

## 🧭 Menu interativo




═══════════════════════════════════════════════════════════════════════

## Aviso de Segurança — Leia antes de executar

Este repositório contém scripts de otimização e manutenção para Windows (.bat). **Importante**:

- **O que o script faz (exemplos):**
  - Executa `chkdsk`, `sfc /scannow`, `DISM /Online /Cleanup-Image /RestoreHealth`.
  - Reinicia serviços do Windows e limpa caches temporários.
  - **Altera propriedade/permissões** de arquivos e pastas (`takeown`, `icacls`).

- **Por que antivírus/Windows Defender pode alertar:**
  - Comandos que tomam posse de arquivos (`takeown`) ou concedem permissões amplas (`icacls ... Everyone:F`) são técnicas também usadas por malware para dominar arquivos do usuário. Portanto, a proteção “Acesso controlado a pastas” ou o antivírus podem bloquear a execução ou exibir avisos. Isso **não significa automaticamente** que o script é malicioso — é uma medida preventiva do sistema.

- **Riscos e recomendações:**
  - Comandos que concedem permissões amplas reduzem a segurança do sistema. **Evite** `icacls ... Everyone:F` a menos que você saiba exatamente o que faz.
  - Faça backup dos seus dados antes de executar qualquer script que altere permissões ou faça reparos de disco.
  - Leia o conteúdo do `.bat` linha a linha. Não execute scripts de fontes não confiáveis.

- **Se você confia no script e precisa executá-lo:**
  - Execute o prompt de comando como Administrador.
  - Se receber bloqueio do Windows Defender (Acesso controlado a pastas), siga o caminho nas configurações do Windows para **permitir o app** — **somente** se tiver certeza da procedência do script.
  - Melhor prática: remova as linhas que concedem permissões globais (ex.: `icacls ... Everyone:F`) e mantenha apenas operações seguras (CHKDSK, SFC, DISM, limpeza de temporários).

- **Sugestão do autor:**  
  - Este repositório é fornecido **"como está"** para uso educacional/pessoal. Não há intenção maliciosa. Se desejar, entre em contato via Issues para pedir uma versão que **não altere permissões** e minimize avisos do antivírus.


