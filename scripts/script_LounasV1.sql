-- =========================================
-- DATABASE : FleetControl
-- PostgreSQL SQL
-- =========================================

-- ========================
-- TABLE : Categorie
-- ========================
CREATE TABLE Categorie (
    id_categorie SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

-- ========================
-- TABLE : Site
-- ========================
CREATE TABLE Site (
    id_site SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    adresse VARCHAR(100)
);

-- ========================
-- TABLE : Vehicule
-- ========================
CREATE TABLE Vehicule (
    id_vehicule SERIAL PRIMARY KEY,
    immatriculation VARCHAR(20) NOT NULL,
    date_achat DATE,
    kilometrage INT,
    statut VARCHAR(20),
    id_categorie INT NOT NULL,
    id_site INT NOT NULL,
    FOREIGN KEY (id_categorie) REFERENCES Categorie(id_categorie),
    FOREIGN KEY (id_site) REFERENCES Site(id_site)
);

-- ========================
-- TABLE : Conducteur
-- ========================
CREATE TABLE Conducteur (
    id_conducteur SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    permis VARCHAR(20)
);

-- ============================================
-- TABLE : AffectationConducteurVehicule
-- ============================================
CREATE TABLE AffectationConducteurVehicule (
    id_affect SERIAL PRIMARY KEY,
    date_debut DATE NOT NULL,
    date_fin DATE,
    id_vehicule INT NOT NULL,
    id_conducteur INT NOT NULL,
    FOREIGN KEY (id_vehicule) REFERENCES Vehicule(id_vehicule),
    FOREIGN KEY (id_conducteur) REFERENCES Conducteur(id_conducteur)
);

-- ========================
-- TABLE : Mission
-- ========================
CREATE TABLE Mission (
    id_mission SERIAL PRIMARY KEY,
    type_mission VARCHAR(50),
    description VARCHAR(255)
);

-- ========================
-- TABLE : Trajet
-- ========================
CREATE TABLE Trajet (
    id_trajet SERIAL PRIMARY KEY,
    date_heure_depart TIMESTAMP,
    date_heure_arrivee TIMESTAMP,
    cout FLOAT,
    id_vehicule INT NOT NULL,
    id_conducteur INT NOT NULL,
    id_mission INT NOT NULL,
    id_incident INT,
    FOREIGN KEY (id_vehicule) REFERENCES Vehicule(id_vehicule),
    FOREIGN KEY (id_conducteur) REFERENCES Conducteur(id_conducteur),
    FOREIGN KEY (id_mission) REFERENCES Mission(id_mission)
);

-- ========================
-- TABLE : Technicien
-- ========================
CREATE TABLE Technicien (
    id_technicien SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    interne BOOLEAN
);

-- ========================
-- TABLE : Fournisseur
-- ========================
CREATE TABLE Fournisseur (
    id_fournisseur SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    adresse VARCHAR(100)
);

-- ========================
-- TABLE : Intervention
-- ========================
CREATE TABLE Intervention (
    id_intervention SERIAL PRIMARY KEY,
    date_intervention DATE,
    type_intervention VARCHAR(50),
    cout FLOAT,
    id_technicien INT NOT NULL,
    id_fournisseur INT,
    FOREIGN KEY (id_technicien) REFERENCES Technicien(id_technicien),
    FOREIGN KEY (id_fournisseur) REFERENCES Fournisseur(id_fournisseur)
);

-- ========================
-- TABLE : Incident
-- ========================
CREATE TABLE Incident (
    id_incident SERIAL PRIMARY KEY,
    date_incident DATE,
    description VARCHAR(255),
    id_intervention INT NOT NULL,
    FOREIGN KEY (id_intervention) REFERENCES Intervention(id_intervention)
);



-- ========================
-- TABLE : Piece
-- ========================
CREATE TABLE Piece (
    id_piece SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    quantite_stock INT
);

-- ============================================
-- TABLE : UtilisationPiece (N-N)
-- ============================================
CREATE TABLE UtilisationPiece (
    id_utilisation SERIAL PRIMARY KEY,
    quantite INT NOT NULL,
    id_intervention INT NOT NULL,
    id_piece INT NOT NULL,
    FOREIGN KEY (id_intervention) REFERENCES Intervention(id_intervention),
    FOREIGN KEY (id_piece) REFERENCES Piece(id_piece)
);

-- ========================
-- TABLE : Assurance
-- ========================
CREATE TABLE Assurance (
    id_assurance SERIAL PRIMARY KEY,
    date_debut DATE,
    date_fin DATE,
    assureur VARCHAR(50),
    id_vehicule INT NOT NULL,
    FOREIGN KEY (id_vehicule) REFERENCES Vehicule(id_vehicule)
);

-- ================================
-- TABLE : ControleTechnique
-- ================================
CREATE TABLE ControleTechnique (
    id_ct SERIAL PRIMARY KEY,
    date_ct DATE,
    resultat VARCHAR(50),
    id_vehicule INT NOT NULL,
    FOREIGN KEY (id_vehicule) REFERENCES Vehicule(id_vehicule)
);

-- ========================
-- TABLE : Contrat
-- ========================
CREATE TABLE Contrat (
    id_contrat SERIAL PRIMARY KEY,
    type_contrat VARCHAR(50),
    date_debut DATE,
    date_fin DATE,
    id_vehicule INT NOT NULL,
    FOREIGN KEY (id_vehicule) REFERENCES Vehicule(id_vehicule)
);
