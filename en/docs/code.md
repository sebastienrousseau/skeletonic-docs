# Code

Skeletonic CSS provides styling for inline code tags to display code snippet into the web browser.

## HTML Code Element

The HTML &lt;code&gt; element  is used to define a piece of computer code. The content inside is displayed in the browser's default monospace font.

For inline code, you can use the &lt;code&gt; element.

```sh
<code>import "skeletonic"void main() {print("Hello Skeletonic")}</code>
```

## Code block

The &lt;code&gt; element does not preserve extra whitespace and line-breaks.To fix this, you can put the &lt;code&gt; element inside a &lt;pre&gt; element:

```sh
<code>
    <pre>
    import "skeletonic"
        void main() {
            print("Hello Skeletonic")
        }
    </pre>
</code>               
```

## Code block colours

```sh
<code class="primary padding-1">Primary</code>                
<code class="secondary padding-1">Secondary</code>                
<code class="success padding-1">Success</code>                
<code class="info padding-1">Info</code>                
<code class="warning padding-1">Warning</code>                
<code class="error padding-1">Error</code>                
```

## HTML var Element for variables

The HTML &lt;var&gt; element is used to define a variable in programming or in a mathematical expression. The content inside is typically displayed in italic.

```sh
Skeletonic CSS Version: <var>v<var> where v is equal to: 1.0.6
```
