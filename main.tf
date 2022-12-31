provider "google" {
  project = "desync-shared-devops-prod-Iac"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yaml")}"
}

resource "google_folder" "Financeiro" {
  display_name = "Financeiro"
  parent       = "organizations/674618817316"  #[ insira o numero da sua org]
}

resource "google_folder" "SalesForce" {
  display_name = "SalesForce"
  parent       = google_folder.Financeiro.name
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.SalesForce.name
}


resource "google_project" "desync-salesforce-prod" {
  name       = "SalesForce-Dev"
  project_id = "barberosa2-salesforce-dev"
  folder_id  = google_folder.Producao.name
  auto_create_network=false
  billing_account = "018973-A8340F-83D8E5"

}

resource "google_folder" "ContaAzul" {
  display_name = "ContaAzul"
  parent       = google_folder.Financeiro.name
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.ContaAzul.name
}

resource "google_project" "desync-conta_azul-prod" {
  name       = "SalesForce-Dev"
  project_id = "barberosa2-salesforce-dev"
  folder_id  = google_folder.Producao.name
  auto_create_network=false
  billing_account = "018973-A8340F-83D8E5"
  
  }