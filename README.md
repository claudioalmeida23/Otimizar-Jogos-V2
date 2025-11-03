═══════════════════════════════════════════════════════════════════════
     ⚡ OTIMIZADOR DE JOGOS V5-Por Claudio Almeida (Nick gamer: Anarokk) ⚡
═══════════════════════════════════════════════════════════════════════

📅 Versão: 2.0  |  Compatível com: Windows 10 / 11 (32 e 64 bits)
📁 Arquivo principal: Otimizar_Jogos_V2.bat
🧠 Finalidade: Melhorar desempenho e corrigir erros do Windows
🎮 Ideal para: Legend of Ymir • Blood Strike • Warzone • Valorant • etc

───────────────────────────────────────────────────────────────────────
🔧 FUNÇÕES DO SCRIPT
───────────────────────────────────────────────────────────────────────
1️⃣  Verificação e correção de arquivos do sistema (SFC)
2️⃣  Reparo completo da imagem do Windows (DISM)
3️⃣  Checagem e correção de erros no disco D:
4️⃣  Ajuste de permissões completas no disco D:
5️⃣  Reinício de serviços essenciais do sistema
6️⃣  Limpeza de arquivos temporários, cache e Prefetch
7️⃣  Otimização de rede (DNS, Winsock e Firewall reset)
8️⃣  Limpeza de cache gráfico (DirectX, NVIDIA, AMD, Intel)
9️⃣  Ativação do plano de energia de máximo desempenho

───────────────────────────────────────────────────────────────────────
⚙️ COMO USAR
───────────────────────────────────────────────────────────────────────
1️⃣  Clique com o botão direito no arquivo → "Executar como Administrador"
2️⃣  Aguarde (leva de 10 a 25 minutos, depende do PC)
3️⃣  Quando aparecer ✅ OTIMIZAÇÃO COMPLETA → Reinicie o computador
4️⃣  Jogue tranquilo: o sistema estará limpo, rápido e otimizado.

───────────────────────────────────────────────────────────────────────
⚠️ AVISOS IMPORTANTES
───────────────────────────────────────────────────────────────────────
⚠️  Não feche o CMD enquanto o script estiver rodando.
⚠️  Alguns reparos pedem reinicialização — aceite se solicitado.
⚠️  Execute este script 1x por mês ou após instalar novos jogos.
⚠️  Pode haver lentidão temporária durante a execução (normal).

───────────────────────────────────────────────────────────────────────
💡 DICAS DE DESEMPENHO
───────────────────────────────────────────────────────────────────────
✅ Instale os componentes abaixo (links oficiais da Microsoft):
   • Visual C++ 2015–2022 (x64): https://aka.ms/vs/17/release/vc_redist.x64.exe
   • Visual C++ 2015–2022 (x86): https://aka.ms/vs/17/release/vc_redist.x86.exe
   • .NET Framework 4.8: https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48
   • DirectX Junho 2010: https://www.microsoft.com/en-us/download/details.aspx?id=8109

✅ Mantenha os drivers de vídeo atualizados (NVIDIA, AMD, Intel).
✅ Feche programas pesados antes de iniciar o jogo.
✅ Ative o plano de energia “Máximo Desempenho” nas Configurações.

───────────────────────────────────────────────────────────────────────
🧩 DETALHES TÉCNICOS
───────────────────────────────────────────────────────────────────────
• Limpeza automática de cache gráfico e temporários do Windows
• Liberação de permissões completas no disco D:
• Reset de IP, DNS e Firewall
• Correção de DLLs corrompidas e falhas do DirectX
• Ativação do modo de desempenho extremo (powercfg)

───────────────────────────────────────────────────────────────────────
🚀 PRÓXIMA VERSÃO (V3)
───────────────────────────────────────────────────────────────────────
🔹 Medição automática de FPS antes/depois da otimização  
🔹 Relatório TXT com desempenho e temperatura  
🔹 Limpeza de cache da Xbox Store e Windows Store  
🔹 Monitor de ping e estabilidade de rede  

───────────────────────────────────────────────────────────────────────
🕹️ CRÉDITOS
───────────────────────────────────────────────────────────────────────
👤 Desenvolvido por: Claudio Almeida  
🌐 Projeto pessoal de otimização e manutenção de jogos no Windows.  
💬 "Desempenho é liberdade – e liberdade é FPS!"  

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


