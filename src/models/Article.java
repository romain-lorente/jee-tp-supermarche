package models;

import java.util.HashMap;
import java.util.Map;

public class Article {
    public static final int[] TVA = new int[] {550, 2000};

    protected long codeBarre;
    protected String reference;
    protected String libelle;
    protected int prixHT;
    protected int tauxTVA;

    public Article(long codeBarre, String reference, String libelle, int prixHT, int tauxTVA) {
        this.codeBarre = codeBarre;
        this.reference = reference;
        this.libelle = libelle;
        this.prixHT = prixHT;
        this.tauxTVA = tauxTVA;
    }

    public long getCodeBarre() {
        return codeBarre;
    }

    public void setCodeBarre(long codeBarre) {
        this.codeBarre = codeBarre;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public int getPrixHT() {
        return prixHT;
    }

    public void setPrixHT(int prixHT) {
        this.prixHT = prixHT;
    }

    public int getTauxTVA() { return TVA[this.tauxTVA]; }

    public void setTauxTVA(int tauxTVA) {
        this.tauxTVA = tauxTVA;
    }
}
