# svg-fix-textposition

This script merges the text position in a `<tspan>` tag with the position in its parent `<text>` tag.

## Example

The input may look like this:
```xml
<text class="SVGTextShape" id="text1811" x="0.43503895" y="-0.17538777">
    <tspan class="TextParagraph" id="tspan1811" font-family="Arial, sans-serif" font-size="173px" font-weight="400">
        <tspan class="TextPosition" id="tspan1810" x="131.27504" y="70.65461">
            <tspan fill="#000000" stroke="none" id="tspan1809">
                The text to show
            </tspan>
        </tspan>
    </tspan>
</text>
```

When editing the text in Inkscape, the `<tspan>` tag with class TextPosition is removed and the coordinate of the text is as such modified to (0.43503895, -0.17538777). To avoid this we need to add the coordinate of the `<tspan>` tag to the coordinate in the `<text>` tag and remove the `<tspan>` tag, resulting in:

```xml
<text class="SVGTextShape" id="text1811" x="131.71007895" y="70.47922223">
    <tspan class="TextParagraph" id="tspan1811" font-family="Arial, sans-serif" font-size="173px" font-weight="400">
        <tspan fill="#000000" stroke="none" id="tspan1809">
            The text to show
        </tspan>
    </tspan>
</text>
```

## Usage

You need a working copy of libxslt on your machine, it will probably work with every other XSLT processor as well.

Clone this repository and run:
`xsltproc -o output.svg fix_textposition.xslt input.svg`

## References

The issue came up a few times on stackoverflow:
- https://stackoverflow.com/questions/69717420/inkscape-pdf-import-tspan-element-attributes
- https://graphicdesign.stackexchange.com/questions/54977/inkscape-loses-text-coordinates-when-exporting-for-latex

