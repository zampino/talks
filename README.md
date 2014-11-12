# Yet another angular slides engine with remote control

With some of my favourites tools:

- angular
- EventSource (SSE)
- sprockets (coffee + hamlc + scss)
- jekyll

## Usage
To add a new talk, put a file `my_talk.hamlc`
in `_assets/slides`. It just has to contain some `%slide`:

```haml
%slide.title{title: 'my first slide'}
  %h1 How I found happiness

%slide{title: 'through'}
  %p Through Stress and Coffee
```

also configure your talk in the `_assets/javascript/talks/index.coffee` file.
```
Talks.Index = [
  id: 'my_talk'
  title: 'My Talk'
  name: 'My nice Talk'
  description: 'a longer description of the topic'
]
```

## Build
Perform a _prebuild_ with non github-safe
plugins like jekyll-assets and some custom haml processing:
```
$> jekyll serve --watch --config=_config.yml,_prebuild.yml
```
The static site is ready to be pushed to gh-pages, github
will do the rest.

## Remote Control

When you start a talk copy the 5-character code
on the bottom right of the screen.
Vistit `/talks/remote` on an other device's browser and enter the code.

## Browser reloads
If you want your talk to survive a browser reload
simply put an empty page
`my_talk.md` with a yaml front-matter like:
```
---
layout: talk
---
```
at the root of your source.

## License
Copyright © 2014 Andrea Amantini.
This is free software, and may be redistributed under the terms specified in the [LICENSE](https://github.com/zampino/talks/blob/master/LICENSE) file.
