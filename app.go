package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/{name}", Hello).Methods("GET", "POST", "PUT")

	http.Handle("/", r)
	fmt.Println("Starting up on 8090")
	log.Fatal(http.ListenAndServe(":8090", nil))
}

func Hello(w http.ResponseWriter, req *http.Request) {
	vars := mux.Vars(req)
	name := vars["name"]
	fmt.Fprintln(w, "Hello world!")
	fmt.Fprintln(w, name+" is in da house!")
}
