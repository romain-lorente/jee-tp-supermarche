$(".ajout-panier").click(function (e) {
    let button = e.currentTarget;
    let boutiqueCodeBarre = button.attributes["boutique-codebarre"].value;

    $.post({
        url: '/tp_supermarche_war_exploded/ajout_au_panier',
        data: {
            codeBarre: boutiqueCodeBarre
        },
        success: function(data) {
            alert(data);
        }
    });
});

$(".ajout-panier-form").submit(function (e) {
    e.preventDefault();

    $.post({
        url: '/tp_supermarche_war_exploded/ajout_au_panier',
        data: {
            codeBarre: e.currentTarget.elements.codeBarre.value
        },
        success: function(data) {
            alert(data);
            location.reload();
        },
        statusCode: {
            404: function(data) {
                alert(data.responseText);
            }
        }
    });
});