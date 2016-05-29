
  function CheckUsername() {
    var field, message;
    field = void 0;
    message = void 0;
    field = void 0;
    message = void 0;
    field = document.getElementById('username-input').value;
    if (field.length < 3 || field.length > 20) {
      message = 'Debe ingresar usuario entre 3 y 20 caracteres';
      document.getElementById('message-user').innerHTML = message;
      document.getElementById('username-input').style.border = '2px solid red';
      return false;
    } else {
      document.getElementById('message-user').innerHTML = '';
      document.getElementById('username-input').style.border = '2px solid green';
      return true;
    }
  }
  
  function CheckPassword() {
    var field, message;
    field = void 0;
    message = void 0;
    field = void 0;
    message = void 0;
    field = document.getElementById('password-input').value;
    if (field.length < 6 || field.length > 20) {
      message = 'Debe ingresar clave entre 6 y 20 caracteres';
      document.getElementById('message-pass').innerHTML = message;
      document.getElementById('password-input').style.border = '2px solid red';
      return false;
    } else {
      document.getElementById('message-pass').innerHTML = '';
      document.getElementById('password-input').style.border = '2px solid green';
      return true;
    }
  }

  function f1() {
    if (CheckUsername() && CheckPassword()) {
      return true;
    } else {
      return false;
    }
  }


