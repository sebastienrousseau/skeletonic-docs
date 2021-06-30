# Types de cartes

![Bannière représentant la bibliothèque Stylus Skeletonic](../assets/skeletonic-stylus-titre.svg)

Ce tableau présente les types de cartes disponibles :

| Types de cartes          | Description                                |
| ------------- | ----------------------------------------------- |
| [Adaptative](adaptative.md) | Cette carte est une carte hautement personnalisable qui peut contenir n'importe quelle combinaison de texte, de discours, d'images, de boutons et de champs de saisie.|
| [Hero](hero.md) | Cette carte contient généralement une seule grande image, un ou plusieurs boutons et une petite quantité de texte.|
| [Liste](liste.md) | Cette carte est une liste déroulante d'éléments.|
| [Thumbnail](vignette.md) | Cette carte contient généralement une seule image miniature, du texte court et un ou plusieurs boutons.|

## Propriétés communes à toutes les cartes

### Images de cartes en ligne

La carte peut contenir une image en ligne en incluant un lien vers l'image accessible au public. Pour des raisons de performances, il est fortement recommandé d'héberger l'image sur un réseau public de diffusion de contenu (CDN).

Les images sont agrandies ou réduites en taille tout en conservant le rapport hauteur/largeur pour couvrir la zone de l'image. Les images sont ensuite recadrées à partir du centre pour obtenir le rapport hauteur/largeur approprié pour la carte.

### Boutons

Les boutons sont affichés empilés au bas de la carte. Le texte du bouton est toujours sur une seule ligne et est tronqué si le texte dépasse la largeur du bouton. Les boutons supplémentaires au-delà du nombre maximum pris en charge par la carte ne sont pas affichés.

### Formatage de la carte

Vous pouvez ajouter un formatage de texte enrichi à vos cartes à l'aide de Markdown ou de HTML, selon le type de carte.

Les cartes prennent en charge le formatage dans la propriété de texte uniquement, pas dans les propriétés de titre ou de sous-titre. Le formatage peut être spécifié à l'aide d'un sous-ensemble de formatage XML (HTML) ou Markdown selon le type de carte. Pour le développement actuel et futur, les cartes adaptatives utilisant le formatage Markdown sont recommandées.

La prise en charge du formatage diffère entre les différents types de cartes, et le rendu de la carte peut différer légèrement entre les clients Teams de bureau et mobiles, ainsi que Teams dans le navigateur de bureau.

Vous pouvez inclure une image en ligne avec n'importe quelle carte Teams. Les images doivent être au format .png, .jpg ou .gif et ne doivent pas dépasser 1024 × 1024 px ou 1 Mo.
