/*
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <https://unlicense.org/>
*/

#let conf(
    doc
) = {

let date_string = [令和#(datetime.today().year() - 2018)年#(datetime.today().month())月#(datetime.today().day())日]

set text(
    font: ("New Computer Modern", "Shippori Mincho") 
)

set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 2.5cm),
    header: context { 
        if here().page() != 1 {  
            smallcaps(text(font: "Latin Modern Roman Caps")[
                    #document.title #h(1fr) #document.author.join(", ", last: " and ")
 #h(1fr) #date_string
            ])
            line(length: 100%, stroke: 0.3pt)
        }  
    },

    footer: context {
        line(length: 100%, stroke: 0.3pt)
        align(center)[#here().page()]
    }
)

set par(
  justify: true,
)

set heading(numbering: (..nums) => nums
    .pos()
    .map(str)
    .join(".") + h(1em),)

show heading: set block(above: 2em, below: 2em)

context {
    grid(
        columns: (1fr, 1fr),
        smallcaps(text(font: "Latin Modern Roman Caps", size: 2em, document.title)),
        align(right, smallcaps(text(font: "Latin Modern Roman Caps")[#document.author.join(", ", last: " and ")
 \ #date_string]))
    );
    line(length: 100%, stroke: 0.3pt)
}

doc

}

