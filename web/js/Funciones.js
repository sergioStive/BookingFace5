/*
 * Funcion para validar una fecha según un intervalo o rango de aceptacion
	Autor: Rodrigo Aranda Fernandez
	V1.0
 */



function validarFecha() {
    var temp = document.getElementById("fecNac").value;
    var y = temp.split("-")
    var fechaSolicitud=new Date(y[0],y[1]-1,y[2]); // se forma la fecha que viene del formulario
    var fechaActual = new Date();   //Fecha actual
    var ftemp = new Date(); // Variable con la fecha actual
     var ftemp2 = new Date();
    var fechaMinima = new Date(ftemp.getTime() + (5 * 24 * 3600 * 1000));   //Sumo 5 dias a la fecha actual para obtener la fecha mínima
    var fechaMaxima = new Date (ftemp2.getTime() + (30 * 24 * 3600 * 1000));  // sumo 30 días a la fecha actual para

   //alert("Actual  : "+fechaActual + "  fecha calendario : "+fechaSolicitud+ "la fecha mínima es : "+fechaMinima);

    if (fechaSolicitud < fechaActual){
        alert ('ESTA SELECCIONANDO UNA FECHA ANTERIOR A LA ACTUAL');
        document.getElementById("fecNac").focus();
    } else if (fechaSolicitud >= fechaActual && fechaSolicitud <fechaMinima){
        alert ('EN ESE TIEMPO NO SE ALCANZA A TENER  EL PEDIDO');
        document.getElementById("fecNac").focus();
    }else if (fechaSolicitud >= fechaMaxima) {
        alert('NO HAEMOS PEDIDOS CON TANTA ANTICIPACION');
        document.getElementById("fecNac").focus();
    }else {
        alert('FECHA VALIDA');
    }

}
