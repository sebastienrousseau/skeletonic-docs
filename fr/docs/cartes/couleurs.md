# Couleurs de la carte

![Bannière représentant la bibliothèque Stylus Skeletonic](../assets/skeletonic-stylus-titre.svg)

Les cartes peuvent être utilisées pour afficher des messages spécifiques aux utilisateurs. Vous pouvez utiliser la classe .warning pour afficher une carte d'avertissement jaune ou, si vous devez afficher un message d'erreur à vos utilisateurs, vous pouvez utiliser la classe .error pour afficher une carte d'erreur rouge.

=== "Aperçu"
    Couleurs

=== "Code"
    ```html
    <section class="cards flex-12 grid-flex">
    <div class="card primary flex-2 padding-1">
        <div class="card-content text-left">
            <h4>Primaire</h4>
            <p>Ça ne servira à rien, repris Prélude. J’ai en effet coupé toutes les communications vers l’extérieur.</p>
            <p><button class="primary center size-full-width">Bouton 4</button></p>
        </div>
    </div>
    <div class="card secondary flex-2 padding-1">
        <div class="card-content text-left">
            <h4>Secondaire</h4>
            <p>Ça ne servira à rien, repris Prélude. J’ai en effet coupé toutes les communications vers l’extérieur.</p>
            <button class="secondary center size-full-width">Bouton 4</button>
        </div>
    </div>
    <div class="card success flex-2 padding-1">
        <div class="card-content text-left">
            <h4>Success</h4>
            <p>Ça ne servira à rien, repris Prélude. J’ai en effet coupé toutes les communications vers l’extérieur.</p>
            <button class="success center size-full-width">Bouton 4</button>
        </div>
    </div>
    <div class="card info flex-2 padding-1">
        <div class="card-content text-left">
            <h4>Info</h4>
            <p>Ça ne servira à rien, repris Prélude. J’ai en effet coupé toutes les communications vers l’extérieur.</p>
            <button class="info center size-full-width">Bouton 4</button>
        </div>
    </div>
    <div class="card warning flex-2 padding-1">
        <div class="card-content text-left">
            <h4>Avertissement</h4>
            <p>Ça ne servira à rien, repris Prélude. J’ai en effet coupé toutes les communications vers l’extérieur.</p>
            <button class="warning center size-full-width">Bouton 4</button>
        </div>
    </div>
    <div class="card error flex-2 padding-1">
        <div class="card-content text-left">
            <h4>Erreur </h4>
            <p>Ça ne servira à rien, repris Prélude. J’ai en effet coupé toutes les communications vers l’extérieur.</p>
            <button class="error center size-full-width">Bouton 5</button>
        </div>
    </div>
    </section>
    ```
