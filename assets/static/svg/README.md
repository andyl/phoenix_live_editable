# SVG Processing

We use SVG icons in PLE forms for an 'OK' and 'Cancel' button.

We just need a couple of icons for each CSS Framework.  We download the SVG
icons to our repo, then inline the icons into the executable during the
compilation process.

| CSS Framework | SVG Image  | Source              |
|---------------|------------|---------------------|
| Bootstrap4    | Bootstrap* | Bootstrap Website   |
| Milligram     | Milligram* | Icon8 Windows Metro |

We use [Phoenix Inline Svg][philis] to ingest the images.

[philis]: https://hexdocs.pm/phoenix_inline_svg/PhoenixInlineSvg.Helpers.html#content
