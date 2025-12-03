tflint {
  # Stelle sicher, dass du eine halbwegs aktuelle TFLint-Version nutzt
  required_version = ">= 0.60.0"
}

# Built-in Terraform Language Ruleset (Syntax, deprecated stuff, unused, etc.)
plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

# Azure Ruleset (validiert SKUs, Regionen, etc.)
plugin "azurerm" {
  enabled = true
  # Version gerne anpassen / pinnen auf das, was ihr einsetzt
  version = "0.30.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

# Generelles TFLint-Verhalten
config {
  call_module_type    = "all"          # auch Module prüfen
  force               = false         # nicht mit 0 exit code rausgehen bei Fehlern
  disabled_by_default = false         # alle "recommended" Regeln aktiv
  # optional:
  # format = "compact"                # falls du das Standardformat ändern willst
}

# Enforce snake_case für Terraform-Namen (Ressourcen, Variablen, Outputs, etc.)
rule "terraform_naming_convention" {
  enabled = true
  format  = "snake_case"
}
