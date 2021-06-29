# Types of cards

![Bannière représentant la bibliothèque Stylus Skeletonic](../assets/skeletonic-stylus-titre.svg)

This table shows the types of cards available to you:

| Card type          | Description                                |
| ------------- | ----------------------------------------------- |
| [Adaptive](adaptative.md)         | This card is highly customizable card that can contain any combination of text, speech, images, buttons, and input fields.  |
| [Hero](hero.md)   | This card typically contains a single large image, one or more buttons, and a small amount of text. |
| [List](liste.md)             | This card is a scrolling list of items.  |
| [Thumbnail](vignette.md)             | This card typically contains a single thumbnail image, some short text, and one or more buttons. |

## Common properties for all cards

### Inline card images

The card can contain an inline image by including a link to the publicly available image. For performance purposes, it is highly recommended you host the image on a public content-delivery network (CDN).
Images are scaled up or down in size while maintaining the aspect ratio to cover the image area. Images are then cropped from center to achieve the appropriate aspect ratio for the card.

### Buttons

Buttons are shown stacked at the bottom of the card. Button text is always on a single line and is truncated if the text exceeds the button width. Any additional buttons beyond the maximum number supported by the card are not shown.

### Card formatting

You can add rich text formatting to your cards using either Markdown or HTML, depending on the card type.

Cards support formatting in the text property only, not in the title or subtitle properties. Formatting can be specified using a subset of XML (HTML) formatting, or Markdown depending on card type. For current and future development Adaptive cards using Markdown formatting is recommended.

Formatting support differs between different card types, and rendering of the card can differ slightly between the desktop and the mobile Teams clients, as well as Teams in the desktop browser.

You can include an inline image with any Teams card. Images an be formatted as .png, .jpg, or .gif files and must not exceed 1024 ×1024 px or 1 MB.
