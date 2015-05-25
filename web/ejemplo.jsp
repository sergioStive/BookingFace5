<!DOCTYPE html>
<html>
<head>
<title>Pro-level</title>
<meta charset="utf-8">
<link rel="shortcut icon" href="imagenes/favicon.ico">
<link href="css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.9.1.js"></script>
<script src="css/bootstrap/js/bootstrap.min.js"></script>
<style>
    span:hover{
        cursor:pointer
    }
</style>
</head>
<body>
    <div class="container">
    <button type="button" class="btn btn-primary"
             data-toggle="popover" data-placement="bottom" title="titulo" data-content="contenido">Click</button>
    
    
    <button type="button" class="btn btn-lg btn-danger" data-toggle="popover" 
            title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">
        Click to toggle popover</button>
        
        
        
        <span class="glyphicon glyphicon-apple" data-toggle="popover" 
            title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">
        </span>
        
<h1 data-toggle="popover" 
title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?"
 data-placement="top">Modifica Fechas Y Horas</h1>
    </div>
<script>                           
$('[data-toggle="popover"]').popover(
                {
                    trigger: 'click',
                    html: true,
                    delay: 500,
                }
            );
</script>
</body>
</html>
