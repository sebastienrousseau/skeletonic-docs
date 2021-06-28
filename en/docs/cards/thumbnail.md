# Image Card

=== "Preview"
    In the same way, we can add an image to our card element.

=== "Markup"
    ```sh
    <section class="cards flex-12">
        <div class="card flex-4">
            <picture>
    <img src="./assets/images/backgrounds/patrick-tomasso-472279.jpg"
        alt="Photo by Patrick Tomasso on Unsplash" class="rdt">
            </picture>
            <div class="card-content text-left">
    <h4>Top image</h4>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    <p><button class="info center size-full-width">Button 1</button></p>
            </div>
        </div>
        <div class="card flex-4">
            <div class="card-content text-left">
    <h4>Center padding</h4>
    <picture>
        <img src="./assets/images/backgrounds/fernando-reyes-241702.jpg"
            alt="Photo by Fernando Reyes on Unsplash"
            class="img-responsive rd" />
    </picture>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    <p><button class="info center size-full-width">Button 3</button></p>
            </div>
        </div>
        <div class="card flex-4">
            <div class="card-content text-left">
    <h4>Bottom image</h4>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    <p><button class="info center size-full-width">Button 2</button></p>
            </div>
            <picture>
    <img src="./assets/images/backgrounds/marion-michele-457471.jpg"
        alt="Photo by Marion Michele on Unsplash" class="rdb">
            </picture>
        </div>
    </section>
    ```
