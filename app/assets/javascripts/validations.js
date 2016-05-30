$(document).on("page:change",function(){

    $("#log-form").attr("onsubmit","return f1();");
    $("#create-form").attr("onsubmit","return f2();");
    $("#user-form").attr("onsubmit","return f3();");
    $("#edit-form").attr("onsubmit","return f4();");
    $("#pass-form").attr("onsubmit","return f5();");
    $("#passUser-form").attr("onsubmit","return f6();");
    $("#article-form").attr("onsubmit","return f7();");
    $("#articleEdit-form").attr("onsubmit","return f8();");




    $("#username-input").attr("oninput","CheckUsername()");
    $("#username2-input").attr("oninput","CheckUsername2()");
    $("#password-input").attr("oninput","CheckPassword()");
    $("#password2-input").attr("oninput","CheckPassword2()");
    $("#nombre-input").attr("oninput","CheckNombre()");
    $("#apellido-input").attr("oninput","CheckApellido()");
    $("#email-input").attr("oninput","CheckEmail()");
    $("#confirmation-input").attr("oninput","CheckConfirmation()");
    $("#titulo-input").attr("oninput","CheckTitulo()");
    $("#precio-input").attr("oninput","CheckPrecio()");
    $("#imagen-input").attr("oninput","CheckImagen()");
    $("#precio2-input").attr("oninput","CheckPrecio2()");



});


function CheckUsername() {
    var field, message;
    field = void 0;
    message = void 0;
    field = document.getElementById('username-input').value;
    if (field.length < 3 || field.length > 20) {
      message = 'Debe ingresar nombre de usuario entre 3 y 20 caracteres';
      document.getElementById('message-user').innerHTML = message;
      document.getElementById('username-input').style.border = '2px solid red';
      return false;
    } else {
      document.getElementById('message-user').innerHTML = '';
      document.getElementById('username-input').style.border = '2px solid green';
      return true;
    }
  }

  function CheckUsername2() {
    var field, message;
    field = void 0;
    message = void 0;
    field = document.getElementById('username2-input').value;
    if (field.length < 3 || field.length > 20) {
      message = 'Debe ingresar nombre de usuario entre 3 y 20 caracteres';
      document.getElementById('message-user2').innerHTML = message;
      document.getElementById('username2-input').style.border = '2px solid red';
      return false;
    } else {
      document.getElementById('message-user2').innerHTML = '';
      document.getElementById('username2-input').style.border = '2px solid green';
      return true;
    }
  }
  
  function CheckPassword() {
    var field, message;
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

    function CheckPassword2() {
    var field, message;
    field = void 0;
    message = void 0;
    field = document.getElementById('password2-input').value;
    if (field.length < 6 || field.length > 20) {
      message = 'Debe ingresar clave entre 6 y 20 caracteres';
      document.getElementById('message-pass2').innerHTML = message;
      document.getElementById('password2-input').style.border = '2px solid red';
      return false;
    } else {
      document.getElementById('message-pass2').innerHTML = '';
      document.getElementById('password2-input').style.border = '2px solid green';
      return true;
    }
  }

  function CheckNombre() {
    var field, message;
    field = void 0;
    message = void 0;
    field = document.getElementById('nombre-input').value;
    if (!field) {
      message = 'Debe ingresar un nombre.';
      document.getElementById('message-nombre').innerHTML = message;
      document.getElementById('nombre-input').style.border = '2px solid red';
      return false;
    } else {
      document.getElementById('message-nombre').innerHTML = '';
      document.getElementById('nombre-input').style.border = '2px solid green';
      return true;
    }    
  }

    function CheckApellido() {
    var field, message;
    field = void 0;
    message = void 0;
    field = document.getElementById('apellido-input').value;
    if (!field) {
      message = 'Debe ingresar un apellido.';
      document.getElementById('message-apellido').innerHTML = message;
      document.getElementById('apellido-input').style.border = '2px solid red';
      return false;
    } else {
      document.getElementById('message-apellido').innerHTML = '';
      document.getElementById('apellido-input').style.border = '2px solid green';
      return true;
    }    
  }

    function CheckEmail() {
    var field, message;
    field = void 0;
    message = void 0;
    field = document.getElementById('email-input').value;
    if (!field) {
      message = 'Debe ingresar un correo electrónico.';
      document.getElementById('message-email').innerHTML = message;
      document.getElementById('email-input').style.border = '2px solid red';
      return false;
    } 
    else if (!validateEmail(field)){
      message = "Debe ingresar un correo electrónico de la forma 'ejemplo@ej.cl'.";
      document.getElementById('message-email').innerHTML = message;
      document.getElementById('email-input').style.border = '2px solid red';
      return false;
    }
    else {
      document.getElementById('message-email').innerHTML = '';
      document.getElementById('email-input').style.border = '2px solid green';
      return true;
    }    
  }

  function validateEmail(email) 
  {
      var re = /\S+@\S+\.\S+/;
      return re.test(email);
  }

    function CheckConfirmation() {
    var field1, field2, message;
    field = void 0;
    message = void 0;
    field1 = document.getElementById('password-input').value;
    field2 = document.getElementById('confirmation-input').value;
    if (field1==field2) {
      document.getElementById('message-confirmation').innerHTML = '';
      document.getElementById('confirmation-input').style.border = '2px solid green';
      return true;
    } else {
      message = 'Claves no coinciden.';
      document.getElementById('message-confirmation').innerHTML = message;
      document.getElementById('confirmation-input').style.border = '2px solid red';
      return false;

    }    
  }


  function CheckTitulo() {
    var field, message;
    field = void 0;
    message = void 0;
    field = document.getElementById('titulo-input').value;
    if (!field) {
      message = 'Debe ingresar un titulo.';
      document.getElementById('message-titulo').innerHTML = message;
      document.getElementById('titulo-input').style.border = '2px solid red';
      return false;
    } else {
      document.getElementById('message-titulo').innerHTML = '';
      document.getElementById('titulo-input').style.border = '2px solid green';
      return true;
    }    
  }

  function CheckPrecio() {
    var field, message;
    field = void 0;
    message = void 0;
    field = document.getElementById('precio-input').value;
    if (!field) {
      message = 'Debe ingresar un precio.';
      document.getElementById('message-precio').innerHTML = message;
      document.getElementById('precio-input').style.border = '2px solid red';
      return false;
    } else if (isInt(field)) {
      document.getElementById('message-precio').innerHTML = '';
      document.getElementById('precio-input').style.border = '2px solid green';
      return true;
    }
    else {
      message = 'Debe ser un numero entero el precio.';
      document.getElementById('message-precio').innerHTML = message;
      document.getElementById('precio-input').style.border = '2px solid red';
      return false;
    }    
  }

    function CheckPrecio2() {
    var field, message;
    field = void 0;
    message = void 0;
    field = document.getElementById('precio2-input').value;
    if (field)
    {
      if (isInt(field)) {
        document.getElementById('message-precio2').innerHTML = '';
        document.getElementById('precio2-input').style.border = '2px solid green';
        return true;
      }
      else
      {
        message = 'Debe ser un numero entero el precio.';
        document.getElementById('message-precio2').innerHTML = message;
        document.getElementById('precio2-input').style.border = '2px solid red';
        return false;
      }
    } 
    else {
      document.getElementById('message-precio2').innerHTML = '';
      document.getElementById('precio2-input').style.border = '2px solid lightgray';

      return true;
    }    
  }

  function isInt(n) {
    if (!isNaN(parseFloat(n)) && isFinite(n)){
      return n % 1 === 0;
    }
    else{
      return false;
    }
  }

  function CheckImagen() {
    var field, message;
    field = void 0;
    message = void 0;
    field = document.getElementById('imagen-input').value;
    if (field == "") {
      message = 'Debe ingresar una imagen.';
      document.getElementById('message-imagen').innerHTML = message;
      document.getElementById('imagen-input').style.border = '2px solid red';
      return false;
    } else {
      document.getElementById('message-imagen').innerHTML = '';
      document.getElementById('imagen-input').style.border = '2px solid green';
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

  function f2() {
    if (CheckUsername() && CheckPassword() && CheckApellido() && CheckEmail && CheckNombre() && CheckConfirmation()) {
      return true;
    } else {
      return false;
    }
  }

  function f3() {
    if (CheckUsername()) {
      return true;
    } else {
      return false;
    }
  }

  function f4() {
    if (CheckUsername()  && CheckApellido() && CheckEmail && CheckNombre() && CheckUsername2 ){
      return true;
    } else {
      return false;
    }
  }

  function f5() {
    if (CheckUsername()  && CheckPassword() && CheckConfirmation ()){
      return true;
    } else {
      return false;
    }
  }

  function f6() {
    if (CheckPassword2()  && CheckPassword() && CheckConfirmation ()){
      return true;
    } else {
      return false;
    }
  }

  function f7() {
    if (CheckTitulo()  && CheckPrecio() && CheckImagen()){
      return true;
    } else {
      return false;
    }
  }

    function f8() {
    if (CheckPrecio2()){
      return true;
    } else {
      return false;
    }
  }



