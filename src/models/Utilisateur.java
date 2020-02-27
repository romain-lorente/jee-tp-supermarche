package models;

public class Utilisateur {
    protected String nom;
    protected String mdp;

    public Utilisateur(String nom, String mdp) {
        this.nom = nom;
        this.mdp = mdp;
    }

    public String getNom() {
        return nom;
    }

    public String getMdp() {
        return mdp;
    }
}
