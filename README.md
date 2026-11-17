# Typst template

Template I use for Typst files. Template is in `conf.typ`.

To use:

```typst
#import "conf.typ": conf

#set document(title: [This is the title.], author: ("Eric Guo"))

#show: doc => conf(doc)
```

See `example.typ` for details.
