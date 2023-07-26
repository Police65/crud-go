package main

import (
	"fmt"
	"net/http"
	"text/template"
)

var plantillas = template.Must(template.ParseGlob("Plantillas/*")) // ---------> Esto es una variable global

func main() {
	fmt.Println("Hola Mundo")
	http.HandleFunc("/", Inicio) // -------> Inicio es una funcion que hay que llamar
	fmt.Println("Servidor Corriendo")
	http.ListenAndServe(":8080", nil) // -------> El 8080 es el puerto y va entre comillas.
}

func Inicio(w http.ResponseWriter, r *http.Request) { // La W es la Request del cliente, y r es la respuesta del servidor
	//fmt.Fprintf(w, "Hola Mundo")
	plantillas.ExecuteTemplate(w, "inicio", nil)
}
