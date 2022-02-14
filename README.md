# Laboratorio de Processing
### Realizar un servidor con las variables que necistaremos
<a href="http://localhost:8080/"><img alt="Processing" src="https://img.shields.io/badge/Endpoint%20(GET)-http://localhost:8080/-F9014C?style=plastic"></a>

```javascript
app.get('/temperatura',  function(req, res){
    data=  Math.random() * (60 - 15) + 15
    
    res.send(JSON.stringify(data));
});


app.get('/humedad',  function(req, res){
    data= Math.random() * (100 - 1) + 1
    
    res.send(JSON.stringify(data));
});

app.get('/velocidad',  function(req, res){
    data= Math.random() * (100 - 1) + 1
    
    res.send(JSON.stringify(data));
});
```
<a href="https://processing.org/examples/simpleparticlesystem.html"><img alt="Processing" src="https://img.shields.io/badge/Code-Processing-F9F501?style=plastic&logo=processingfoundation"></a>

> Utilizando java creamos las clases
> - Particula
> - Sistema Particulas
> - Principal