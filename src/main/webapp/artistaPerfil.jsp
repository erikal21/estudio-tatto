<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Perfil do Usuário</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f3f3f3;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        .container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #310c77;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #4a139f;
        }
        .error {
            color: red;
            font-size: 12px;
        }
        .back-icon {
            position: absolute;
            top: 10px;
            left: 10px;
            text-decoration: none;
            font-size: 24px;
            color: #310c77;
            font-weight: bold;
        }
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: none; /* Impede redimensionamento */
        }

        input[type="file"] {
            width: 100%;
        }
    </style>
</head>
<body>


 <div class="container">
     <a href="index.html" class="back-icon">
         &#x21A9;
     </a>
     <h2>Perfil do Artista</h2>
     <form method="post" action="UpdateProfileServlet">
         <div class="form-group">
             <label for="name">Nome</label>
             <input type="text" id="name" name="name" value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>" required>
         </div>
         <div class="form-group">
             <label for="email">E-mail</label>
             <input type="email" id="email" name="email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" required>
             <% if (request.getAttribute("emailError") != null) { %>
                 <div class="error"><%= request.getAttribute("emailError") %></div>
             <% } %>
         </div>
         <div class="form-group">
             <label for="password">Senha</label>
             <input type="password" id="password" name="password" required>
         </div>
         <div class="form-group">
             <label for="phone">Telefone (opcional)</label>
             <input type="tel" id="phone" name="phone" value="<%= request.getAttribute("phone") != null ? request.getAttribute("phone") : "" %>">
         </div>
         <div class="form-group">
             <label for="address">Endereço (opcional)</label>
             <input type="text" id="address" name="address" value="<%= request.getAttribute("address") != null ? request.getAttribute("address") : "" %>">
         </div>
         <div class="form-group">
             <label for="profilePhoto">Foto de Perfil</label>
             <input type="file" id="profilePhoto" name="profilePhoto" accept="image/*">
         </div>
         <div class="form-group">
             <label for="artistDescription">Apresentação profissional</label>
             <textarea id="artistDescription" name="artistDescription" placeholder="Descrição do artista" rows="5"></textarea>
         </div>
         <div class="form-group">
             <label for="profilePhotos">Artes</label>
             <input type="file" id="profilePhotos" name="profilePhotos" accept="image/*" multiple>
         </div>
         <div class="form-group">
             <button type="submit">Salvar Alterações</button>
         </div>
     </form>
 </div>

</body>
</html>
