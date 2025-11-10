@startuml
entity Vehicule {
  *id_vehicule : INT PK
  immatriculation : VARCHAR(20)
  date_achat : DATE
  kilometrage : INT
  statut : VARCHAR(20)
  id_categorie : INT FK
  id_site : INT FK
}

entity Categorie {
  *id_categorie : INT PK
  nom : VARCHAR(50)
}

entity Site {
  *id_site : INT PK
  nom : VARCHAR(50)
  adresse : VARCHAR(100)
}

entity Conducteur {
  *id_conducteur : INT PK
  nom : VARCHAR(50)
  prenom : VARCHAR(50)
  permis : VARCHAR(20)
}

entity AffectationConducteurVehicule {
  *id_affect : INT PK
  date_debut : DATE
  date_fin : DATE
  id_vehicule : INT FK
  id_conducteur : INT FK
}

entity Mission {
  *id_mission : INT PK
  type_mission : VARCHAR(50)
  description : VARCHAR(255)
}

entity Trajet {
  *id_trajet : INT PK
  date_heure_depart : DATETIME
  date_heure_arrivee : DATETIME
  cout : FLOAT
  id_vehicule : INT FK
  id_conducteur : INT FK
  id_mission : INT FK
}

entity Incident {
  *id_incident : INT PK
  date_incident : DATE
  description : VARCHAR(255)
  cause : VARCHAR(255)
  impact_financier : FLOAT
  id_vehicule : INT FK
}

entity Intervention {
  *id_intervention : INT PK
  date_intervention : DATE
  type_intervention : VARCHAR(50)
  cout : FLOAT
  id_incident : INT FK
  id_vehicule : INT FK
  id_technicien : INT FK
  id_fournisseur : INT FK NULL
}

entity Technicien {
  *id_technicien : INT PK
  nom : VARCHAR(50)
  interne : BOOLEAN
}

entity Fournisseur {
  *id_fournisseur : INT PK
  nom : VARCHAR(50)
  adresse : VARCHAR(100)
}

entity Piece {
  *id_piece : INT PK
  nom : VARCHAR(50)
  quantite_stock : INT
}

entity UtilisationPiece {
  *id_utilisation : INT PK
  quantite : INT
  id_intervention : INT FK
  id_piece : INT FK
}

entity Assurance {
  *id_assurance : INT PK
  date_debut : DATE
  date_fin : DATE
  assureur : VARCHAR(50)
  id_vehicule : INT FK
}

entity ControleTechnique {
  *id_ct : INT PK
  date_ct : DATE
  resultat : VARCHAR(50)
  id_vehicule : INT FK
}

entity Contrat {
  *id_contrat : INT PK
  type_contrat : VARCHAR(50)
  date_debut : DATE
  date_fin : DATE
  id_vehicule : INT FK
}

@enduml
