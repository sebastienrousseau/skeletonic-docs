# Code

![Bannière représentant la bibliothèque Stylus Skeletonic](./assets/skeletonic-stylus-titre.svg)

Skeletonic CSS fournit un style pour les balises de code afin d'afficher l'extrait du code dans le navigateur Web.

## Élément de code HTML

L'élément &lt;code&gt; HTML est utilisé pour définir une partie du code informatique. Le contenu à l'intérieur est affiché avec une police monospace fixe par défaut.

Pour le code en ligne, vous pouvez utiliser l'élément &lt;code&gt;.

```sh
<code>import "skeletonic"void main() {print("Bonjour Skeletonic")}</code>
```

## Bloc de code

L'élément &lt;code&gt; ne préserve pas les espaces et les sauts de ligne. Pour résoudre ce problème, vous pouvez mettre l'élément &lt;code&gt; à l'intérieur d'un élément &lt;pre&gt;:

```sh
<code>
    <pre>
    import "skeletonic"
        void main() {
            print("Bonjour Skeletonic")
        }
    </pre>
</code>               
```

## Couleurs des blocs de code

```sh
<code class="primary padding-1">Primaire</code>                
<code class="secondary padding-1">Secondaire</code>                
<code class="success padding-1">Succès</code>                
<code class="info padding-1">Info</code>                
<code class="warning padding-1">Avertissement</code>                
<code class="error padding-1">Erreur</code>                
```

## Élément HTML var pour les variables

L'élément HTML &lt;var&gt; est utilisé pour définir une variable en programmation ou dans une expression mathématique. Le contenu à l'intérieur est généralement affiché en italique.

```sh
La version Skeletonic CSS: <var>v<var> où v est égal à : 1.0.6
```
