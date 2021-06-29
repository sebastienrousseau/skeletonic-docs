# Structure des dossiers

![Bannière représentant la bibliothèque Stylus Skeletonic](./assets/skeletonic-stylus-titre.svg)

Maintenant que vous avez créé, construit et exécuté votre premier site Web ou application Skeletonic, prenons un moment pour vous familiariser avec la structure des dossiers de la bibliothèque Stylus Skeletonic.

## Sources

Dans le dossier de téléchargement, vous trouverez tous les fichiers sources au format Stylus, des fichiers de feuilles de style (CSS) compilés et minifiés ainsi que les [sources maps CSS](https://developers.google.com/web/tools/chrome-devtools/javascript/source-maps) regroupées dans un dossier *dist*.

### dist

Vous trouverez ci-dessous la structure des dossiers typique du paquet de la bibliothèque Stylus Skeletonic.

```sh
skeletonic-1.0.6 
dist
├── README.md
├── css
│   ├── skeletonic-animations.css
│   ├── skeletonic-animations.css.map
│   ├── skeletonic-animations.min.css
│   ├── skeletonic-colors.css
│   ├── skeletonic-colors.css.map
│   ├── skeletonic-colors.min.css
│   ├── skeletonic-fonts.css
│   ├── skeletonic-fonts.css.map
│   ├── skeletonic-fonts.min.css
│   ├── skeletonic-hebrew-fonts.css
│   ├── skeletonic-hebrew-fonts.css.map
│   ├── skeletonic-hebrew-fonts.min.css
│   ├── skeletonic.css
│   ├── skeletonic.css.map
│   └── skeletonic.min.css
├── filesize-report.txt
├── images
│   ├── button-primary.svg
│   ├── button-secondary.svg
│   ├── skeletonic-stylus-readme.svg
│   └── skeletonic-stylus.svg
├── package.json
└── stylus
    ├── README.md
    ├── animations
    │   ├── README.md
    │   ├── _contents.styl
    │   ├── bounce.styl
    │   ├── chameleon.styl
    │   ├── fade-in.styl
    │   ├── fade-out.styl
    │   ├── flash.styl
    │   ├── pop-in.styl
    │   ├── pulse.styl
    │   ├── rotation.styl
    │   ├── shake.styl
    │   ├── vanish-in.styl
    │   ├── vanish-out.styl
    │   ├── wobble.styl
    │   └── zoom-in.styl
    ├── base
    │   ├── README.md
    │   ├── _contents.styl
    │   ├── helpers.styl
    │   └── reset.styl
    ├── components
    │   ├── README.md
    │   ├── _contents.styl
    │   ├── card.styl
    │   ├── header.styl
    │   └── navbar.styl
    ├── configurations
    │   ├── README.md
    │   ├── _contents.styl
    │   ├── colors.styl
    │   └── variables.styl
    ├── debugging
    │   ├── base64
    │   └── images
    ├── elements
    │   ├── README.md
    │   ├── _contents.styl
    │   ├── button.styl
    │   ├── clipboard.styl
    │   ├── code.styl
    │   ├── divider.styl
    │   ├── fieldset.styl
    │   ├── form.styl
    │   ├── image.styl
    │   ├── label.styl
    │   ├── link-effects.styl
    │   ├── link.styl
    │   ├── list.styl
    │   ├── margin.styl
    │   ├── padding.styl
    │   └── table.styl
    ├── fonts
    │   ├── README.md
    │   ├── _contents.styl
    │   ├── open-sans-hebrew.styl
    │   └── open-sans.styl
    ├── layout
    │   ├── README.md
    │   ├── _contents.styl
    │   ├── container.styl
    │   ├── grid.styl
    │   └── media-queries.styl
    ├── palettes
    │   ├── README.md
    │   ├── _contents.styl
    │   ├── material.styl
    │   ├── tachyons.styl
    │   └── websafe.styl
    ├── skeletonic.styl
    └── utilities
        ├── README.md
        ├── _contents.styl
        └── mixins.styl
15 directories, 85 files
```

Les sections ci-dessous expliquent plus en détail chaque partie de la structure des dossiers.

#### css

Ce dossier contient les fichiers CSS traités nécessaires pour styliser votre site Web ou votre application.

#### images

Ce dossier contient les images de la documentation (les fichiers README.md).

#### stylus

 Ce dossier contient tous les fichiers sources Stylus (.styl) organisés en sous-dossiers pour améliorer la lisibilité, le classement et la maintenabilité du code source.
