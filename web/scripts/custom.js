$(".ajout-panier").click(function (e) {
    let button = e.currentTarget;
    let boutiqueCodeBarre = button.attributes["boutique-codebarre"].value;

    $.post({
        url: '/tp_supermarche_war_exploded/ajout_au_panier',
        data: {
            codeBarre: boutiqueCodeBarre
        },
        success: function(data) {
            alert("Ajouté au panier avec succé.")
        },
        statusCode: {
            499: function(data) {
                alert(data.responseText);
            }
        }
    })
});