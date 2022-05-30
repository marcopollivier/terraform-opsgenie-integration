terraform {
  required_providers {
    opsgenie = {
      source = "opsgenie/opsgenie"
      version = "0.6.5"
    }
  }
}

# Configure the Opsgenie Provider
provider "opsgenie" {
  api_key = ""
  # api_url = "api.eu.opsgenie.com" #default is api.opsgenie.com
  api_url = "api.opsgenie.com" 
}

# Create a user
resource "opsgenie_user" "marco_ollivier" {
  username  = "mollivier.dev@gmail.com"
  full_name = "Marco Ollivier Dev"
  role      = "User"
  locale    = "pt_BR"
  timezone  = "America/Sao_Paulo"
}

resource "opsgenie_user" "marco_ollivier_dev" {
  username  = "marcopollivier@gmail.com"
  full_name = "Marco Ollivier"
  role      = "User"
  locale    = "pt_BR"
  timezone  = "America/Sao_Paulo"
}

resource "opsgenie_team" "time_da_sala" {
  name        = "Time da Sala"
  description = "Esse time está sendo criado via terraform"

  member {
    id   = "${opsgenie_user.marco_ollivier_dev.id}"
    role = "admin"
  }

  member {
    id   = "${opsgenie_user.marco_ollivier.id}"
    role = "user"
  }
}
