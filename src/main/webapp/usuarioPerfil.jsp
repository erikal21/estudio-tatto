<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Perfil de ${usuario.nome}</title>
  <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&display=swap" rel="stylesheet" />
 <style>
   * { margin: 0; padding: 0; box-sizing: border-box; }

   body {
     font-family: "Oswald", sans-serif;
     background-color: #000;
     color: white;
     min-height: 100vh;
     line-height: 1.5;
   }

   .container {
     max-width: 800px;
     margin: 0 auto;
     padding: 2rem 1rem;
     display: flex;
     flex-direction: column;
     min-height: 100vh;
     position: relative;
   }

   .profile-header {
     display: flex;
     justify-content: space-between;
     align-items: center;
     margin-bottom: 3rem;
     width: 100%;
   }

   .profile-header h1 {
     font-size: 2.5rem;
     font-weight: bold;
     letter-spacing: 0.05em;
     color: red;
     text-transform: uppercase;
   }

   .avatar {
     width: 4rem;
     height: 4rem;
     border: 2px solid red;
     border-radius: 50%;
     display: flex;
     align-items: center;
     justify-content: center;
     background-color: #000;
   }

   .user-icon {
     color: red;
   }

   .profile-info {
     max-width: 800px;
     margin: 0 auto;
     width: 100%;
     display: grid;
     grid-template-columns: repeat(2, 1fr);
     gap: 2rem;
   }

   .info-row {
     display: flex;
     align-items: center;
     justify-content: space-between;
     padding: 1rem 0;
     border-bottom: 2px solid red;
     transition: all 0.3s ease;
     animation: fadeIn 0.3s ease-out forwards;
   }

   .info-row:hover {
     border-color: #ff3333;
   }

   .info-content {
     display: flex;
     align-items: center;
     gap: 1rem;
   }

   .label {
     font-size: 1.2rem;
     color: white;
     text-transform: uppercase;
   }

   .icon {
     color: red;
     display: flex;
     align-items: center;
   }

   .toggle-password {
     background: none;
     border: none;
     cursor: pointer;
     color: red;
     padding: 0.5rem;
     transition: color 0.3s ease;
   }

   .toggle-password:hover {
     color: #ff3333;
   }

   .nav-button {
     padding: 0.75rem 2rem;
     font-size: 1rem;
     color: white;
     background: transparent;
     border: 2px solid black;
     cursor: pointer;
     transition: all 0.3s ease;
     text-transform: uppercase;
     font-family: "Oswald", sans-serif;
     letter-spacing: 1px;
     border-radius: 5px;
   }

   .nav-button:hover {
     background-color: red;
     color: white;
   }

   footer {
     text-align: center;
     padding: 1rem 0;
     color: #666;
     font-size: 0.875rem;
     margin-top: auto;
     text-transform: uppercase;
     letter-spacing: 1px;
     grid-column: 1 / -1;
   }

.action-buttons {
  display: flex;
  justify-content: center; /* Centraliza no meio horizontal */
  gap: 1rem;
  margin-top: 2rem;
}


.custom-action-button {
  background-color: black;
  border: 2px solid red;
  color: white;
  padding: 0.75rem 2rem;
  font-size: 1rem;
  cursor: pointer;
  text-transform: uppercase;
  font-family: "Oswald", sans-serif;
  letter-spacing: 1px;
  border-radius: 5px;
  text-decoration: none;
  transition: all 0.3s ease;
}
.modal {
    position: fixed;
    z-index: 1000;
    left: 0; top: 0;
    width: 100%; height: 100%;
    background-color: rgba(0,0,0,0.5);
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .modal-content {
    background-color: #111;
    padding: 20px;
    border-radius: 8px;
    text-align: center;
    color: white;
    width: 300px;
  }

  .close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
  }

  .modal-btn {
    background-color: red;
    border: none;
    color: white;
    padding: 12px 24px;
    margin: 10px 5px 0 5px;
    font-family: "Oswald", sans-serif;
    font-size: 1rem;
    cursor: pointer;
    border-radius: 5px;
    text-transform: uppercase;
    transition: background-color 0.3s ease;
  }

  .modal-btn:hover {
    background-color: #ff3333;
  }

.custom-action-button:hover {
  background-color: black;
  border-color: black;
}

   .back-button {
    position: absolute;
    top: 105px;
    right: 1000px;
    }
        .back-button a {
    text-decoration: none;
    color: red;
    font-size: 18px;
    }
    .back-button a:hover {
    text-decoration: underline;
    }
    .back-button a::before {
    content: "← ";
    }

   @keyframes fadeIn {
     from { opacity: 0; transform: translateY(10px); }
     to { opacity: 1; transform: translateY(0); }
   }

   @media (max-width: 640px) {
     .profile-header h1 { font-size: 2rem; }
     .avatar { width: 3.5rem; height: 3.5rem; }
     .label { font-size: 1rem; }
     .profile-info { grid-template-columns: 1fr; gap: 1rem; }
   }
 </style>

</head>
<body>
<div class="container">
<div class="back-button">
        <a href="list-tatuadores"></a>
    </div>

  <header class="profile-header">
    <h1>Perfil <span> </span>${usuario.nome}</h1>

    <div class="avatar">
      <img src="${usuario.imagemPerfil != null ? usuario.imagemPerfil : 'imagens/default-user.png'}" alt="Foto do usuário" style="width:100%; height:100%; border-radius:50%;" />

    </div>

<a href="logout" class="nav-button">SAIR</a>

  </header>

<main class="profile-info">
  <div class="info-row">
    <span class="label">Nome:</span><span>${usuario.nome}</span>
  </div>
  <div class="info-row">
    <span class="label">Email:</span><span>${usuario.email}</span>
  </div>
  <div class="info-row">
    <span class="label">Telefone:</span><span>${usuario.telefone}</span>
  </div>
  <div class="info-row">
    <span class="label">Endereço:</span><span>${usuario.endereco}</span>
  </div>
  <div class="info-row">
    <span class="label">Tipo Usuário:</span><span>${usuario.tipoUsuario}</span>
  </div>
<div class="info-row">
  <span class="label">Senha:</span>
  <span id="senha" data-senha="${usuario.senha}">••••••••</span>
  <button class="toggle-password" onclick="togglePassword()">
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
      viewBox="0 0 24 24" fill="none" stroke="currentColor"
      stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
      class="eye-icon" id="eyeIcon">
      <path id="eyePath1" d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"></path>
      <circle id="eyePath2" cx="12" cy="12" r="3"></circle>
    </svg>
  </button>
</div>

</main>


<div class="action-buttons">
  <a href="cadastro.jsp?id=${usuario.id}&nome=${usuario.nome}&email=${usuario.email}&senha=${usuario.senha}&telefone=${usuario.telefone}&endereco=${usuario.endereco}&imagemPerfil=${usuario.imagemPerfil}&tipo_usuario=${usuario.tipoUsuario}" class="nav-button custom-action-button">
    Alterar conta
  </a>

  <form action="/delete-usuario" method="post" style="display: inline;">
    <input type="hidden" name="id" value="${usuario.id}">
    <button type="submit" class="nav-button custom-action-button">Excluir conta</button>
  </form>

  <c:if test="${usuario.tipoUsuario == 'tatuador'}">
    <button id="openModalBtn" class="nav-button custom-action-button">ANÚNCIO</button>
  </c:if>


  <div id="myModal" class="modal" style="display:none;">
    <div class="modal-content">
      <span class="close">&times;</span>
      <h2>Escolha uma opção</h2>
      <button id="verAnuncioBtn" class="modal-btn">Ver Anúncio</button>
      <button id="criarAnuncioBtn" class="modal-btn">Criar Anúncio</button>
    </div>
  </div>

</div>


  <footer>
    <p>&copy; 2025</p>
  </footer>
</div>

<script>

const modal = document.getElementById("myModal");
  const openBtn = document.getElementById("openModalBtn");
  const closeBtn = document.querySelector(".close");
  const verBtn = document.getElementById("verAnuncioBtn");
  const criarBtn = document.getElementById("criarAnuncioBtn");

  openBtn.onclick = () => {
    modal.style.display = "flex";
  };

  closeBtn.onclick = () => {
    modal.style.display = "none";
  };

  window.onclick = (event) => {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  };

  criarBtn.onclick = () => {
    window.location.href = "artistaCadastro.jsp?id=${id.usuario}";
  };

  verBtn.onclick = () => {
    window.location.href = "list-perfil?id=${usuario.id}";
  };

  let showingPassword = false;

  function togglePassword() {
    const senhaSpan = document.getElementById("senha");
    const eyeIcon = document.getElementById("eyeIcon");
    const senhaReal = senhaSpan.getAttribute("data-senha");

    if (showingPassword) {
      senhaSpan.textContent = "••••••••";
      eyeIcon.innerHTML = `
        <path d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"></path>
        <circle cx="12" cy="12" r="3"></circle>
      `;
    } else {
      senhaSpan.textContent = senhaReal;
      eyeIcon.innerHTML = `
        <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8
          a18.45 18.45 0 0 1 5.06-5.94" />
        <path d="M1 1l22 22" />
      `;
    }

    showingPassword = !showingPassword;
  }
</script>


</body>
</html>