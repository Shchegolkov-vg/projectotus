package app

import (
	"encoding/json"
	"net/http"
)

func (i *Instance) WhoAmIController(w http.ResponseWriter, r *http.Request) {
	type user struct {
		ID        int64  `json:"id"`
		FirstName string `json:"first_name"`
		LastName  string `json:"last_name"`
		Email     string `json:"email"`
	}

	w.Header().Set("Content-Type", "application/json")
	_ = json.NewEncoder(w).
		Encode(user{
			ID:        1,
			FirstName: "Владимир",
			LastName:  "Щегольков",
			Email:     "voovik59@gmail.com",
		})
}
