# Code

![Bannière représentant la bibliothèque Stylus Skeletonic](../assets/skeletonic-stylus-titre.svg)

Skeletonic CSS provides styling for inline code tags to display code snippet into the web browser.

<!-- Code -->
<section class="grid-flex text-left">    
    <div class="flex-12" markdown="1">

### {{ page.title }}
{{ page.description }}

#### HTML Code Element

The HTML &lt;code&gt; element  is used to define a piece of computer code. The content inside is displayed in the browser's default monospace font.

For inline code, you can use the &lt;code&gt; element.

<code class="padding-1">&lt;code&gt;import "skeletonic"void main() {print("Hello Skeletonic")}&lt;/code&gt;</code>

#### Code block

The &lt;code&gt; element does not preserve extra whitespace and line-breaks.To fix this, you can put the &lt;code&gt; element inside a &lt;pre&gt; element:

<code class="padding-1">
    <pre>
&lt;code&gt;&#10;    &lt;pre&gt;&#10;    import &quot;skeletonic&quot;&#10;        void main() {&#10;            print(&quot;Hello Skeletonic&quot;)&#10;        }&#10;    &lt;/pre&gt;&#10;&lt;/code&gt;                    
    </pre>
</code>                

#### Code block colours

<code class="primary padding-1">Primary</code>                
<code class="secondary padding-1">Secondary</code>                
<code class="success padding-1">Success</code>                
<code class="info padding-1">Info</code>                
<code class="warning padding-1">Warning</code>                
<code class="error padding-1">Error</code>                

#### HTML var Element for variables

The HTML &lt;var&gt; element is used to define a variable in programming or in a mathematical expression. The content inside is typically displayed in italic.
                
<code class="padding-1">Skeletonic CSS Version: &lt;var&gt;v&lt;var&gt; where v is equal to: {{site.version}}</code>                
    
</div>
</section>
<!-- End Code -->