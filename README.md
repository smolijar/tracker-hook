<div align="center">

<img src="https://media1.tenor.com/images/4a5dcfcd22b47759b5e5729d48abc92c/tenor.gif?itemid=5532602" />

# Tracker hook

[![forthebadge](https://forthebadge.com/images/badges/fuck-it-ship-it.svg)](https://travis-ci.com/grissius/tracker-hook/builds)
[![forthebadge](https://forthebadge.com/images/badges/built-with-science.svg)](https://en.wikipedia.org/wiki/Science)
[![forthebadge](https://forthebadge.com/images/badges/powered-by-electricity.svg)](https://www.starwars.com/databank/force-lightning)
[![forthebadge](https://forthebadge.com/images/badges/uses-badges.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/contains-cat-gifs.svg)](https://cataas.com/)

Add issue tracker references to your commits automatically!
</div>


## Install

1. Add hook `curl -o .git/hooks/prepare-commit-msg https://raw.githubusercontent.com/grissius/tracker-hook/master/hook.sh`
2. Make it executable `chmod +x .git/hooks/prepare-commit-msg`

## How to use

1. Use `kebab-case` branches with issue id in the first word with optional folder prefixes, e.g.
    - `feat/550-add-missing-id` -> `#550`
    - `42` -> `#42`
    - `backup/fix/666-root-of-all-evol` -> `#666`
    - `foo/bar` -> `#bar`

2. When hook is installed issue reference will be prefilled in commit message trailer via prepare-commit-msg git hook.


## License

This project is licensed under [MIT](./LICENSE).
