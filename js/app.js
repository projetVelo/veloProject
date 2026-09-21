/* ==========================================================================
   Vélo Kombi - scripts du site
   1. Menu mobile
   2. Année dans le pied de page
   3. Liste des prestations, chargée depuis data/services.json
   4. Formulaire de contact (démonstration, aucun envoi)
   ========================================================================== */

(function () {
  "use strict";

  /* 1. Menu mobile ------------------------------------------------------- */

  var burger = document.getElementById("burger");
  var nav = document.getElementById("nav");

  if (burger && nav) {
    burger.addEventListener("click", function () {
      var ouvert = nav.classList.toggle("is-open");
      burger.setAttribute("aria-expanded", String(ouvert));
    });
  }

  /* 2. Année dans le pied de page ---------------------------------------- */

  var annee = document.getElementById("annee");

  if (annee) {
    annee.textContent = new Date().getFullYear();
  }

  /* 3. Liste des prestations --------------------------------------------- */

  var liste = document.getElementById("liste-services");

  function formaterPrix(valeur) {
    if (valeur === 0) {
      return "Gratuit";
    }
    // Utilitaire fourni par vendor/mini-utils.min.js, avec repli local.
    if (window.VK && typeof window.VK.formatEuro === "function") {
      return window.VK.formatEuro(valeur);
    }
    return valeur + " " + String.fromCharCode(8364);
  }

  function construireCarte(service) {
    var li = document.createElement("li");
    li.className = "card";

    var titre = document.createElement("h3");
    titre.textContent = service.nom;

    var texte = document.createElement("p");
    texte.textContent = service.description;

    var meta = document.createElement("div");
    meta.className = "card-meta";

    var prix = document.createElement("span");
    prix.className = "card-prix";
    prix.textContent = formaterPrix(service.prix);

    var duree = document.createElement("span");
    duree.className = "card-duree";
    duree.textContent = service.duree;

    meta.appendChild(prix);
    meta.appendChild(duree);

    li.appendChild(titre);
    li.appendChild(texte);
    li.appendChild(meta);

    return li;
  }

  function afficherServices(services) {
    liste.innerHTML = "";
    services.forEach(function (service) {
      liste.appendChild(construireCarte(service));
    });
  }

  function afficherErreur(message) {
    liste.innerHTML = "";
    var li = document.createElement("li");
    li.className = "card card-empty";
    li.textContent = message;
    liste.appendChild(li);
  }

  if (liste) {
    fetch("data/services.json")
      .then(function (reponse) {
        if (!reponse.ok) {
          throw new Error("Réponse " + reponse.status);
        }
        return reponse.json();
      })
      .then(function (donnees) {
        afficherServices(donnees.services);
      })
      .catch(function () {
        afficherErreur(
          "Les prestations ne peuvent pas être chargées. Ouvrez le site avec un serveur local."
        );
      });
  }

  /* 4. Formulaire de contact --------------------------------------------- */

  var form = document.getElementById("form-contact");
  var retour = document.getElementById("form-retour");

  if (form && retour) {
    form.addEventListener("submit", function (evenement) {
      evenement.preventDefault();

      var nom = form.elements.nom.value.trim();
      var courriel = form.elements.courriel.value.trim();

      if (nom === "" || courriel === "") {
        retour.textContent = "Merci de renseigner votre nom et votre courriel.";
        retour.hidden = false;
        return;
      }

      retour.textContent =
        "Demande enregistrée pour " + nom + ". Ceci est une démonstration, aucun message n'a été envoyé.";
      retour.hidden = false;
      form.reset();
    });
  }
})();
