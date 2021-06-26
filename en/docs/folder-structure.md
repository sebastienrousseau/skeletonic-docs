# Folder Structure

Now that you've created, built, and run your first Skeletonic website or application, let's take a moment to familiarize yourself with the Skeletonic Stylus Library's folder structure.

## Sources

Within the download folder you'll find all the Stylus source files, compiled and minified CSS bundles as well as [CSS sourcemaps](https://developers.google.com/web/tools/chrome-devtools/javascript/source-maps) grouped into a *dist* folder.

### dist

Below is the typical folder structure for the Skeletonic Stylus Library package.

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

The sections below explain each part of the folder structure in more detail.

#### css

This folder contains the processed CSS files needed to style your web site or application.

#### images

This folder contains the documentation images (README.md files).

#### stylus

 This folder contains all the Stylus source files (.styl) organized in subfolders for better file organization and code scalability.
