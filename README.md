<div align="center">

<img src="https://media1.tenor.com/images/4a5dcfcd22b47759b5e5729d48abc92c/tenor.gif?itemid=5532602" />

# Tracker hook

[![build](https://forthebadge.com/images/badges/fuck-it-ship-it.svg)](https://travis-ci.com/grissius/tracker-hook/builds)
[![science](https://forthebadge.com/images/badges/built-with-science.svg)](https://en.wikipedia.org/wiki/Science)
[![force](https://forthebadge.com/images/badges/powered-by-electricity.svg)](https://www.starwars.com/databank/force-lightning)
[![forthebadge](https://forthebadge.com/images/badges/uses-badges.svg)](https://forthebadge.com)
[![cataas](https://forthebadge.com/images/badges/contains-cat-gifs.svg)](https://cataas.com/)

Add issue tracker references to your commits automatically!

</div>

## About

A `prepare-commit-msg` Git hook to automatically add issue reference to commits, if referenced in branch.
Tries to detect current feature's tracker reference from the current Git branch.
If successful, prepares the reference in the commit message's trailers.

![](https://i.imgur.com/L4BasUu.gif)

## Install

```bash
# in a git repository
curl -sL https://raw.githubusercontent.com/grissius/tracker-hook/master/scripts/install.sh | bash
```

Alternatively (1) download [hook](https://raw.githubusercontent.com/grissius/tracker-hook/master/lib/hook.sh) manually and save it as `.git/hooks/prepare-commit-msg` of selected repository and (2) make it executable.

## How to use

Once installed benefit from consistent branch naming and have issue ids prefilled in your commit messages, the hook gets triggered before each commit automatically.
If no issue is parsed, hook will perform no action and you won't even know its there.

See the following examples:

| Branch name                       | Extracted id |
| --------------------------------- | ------------ |
| `feat/123-add-foo`                | `#123`       |
| `backup/fix/6666-fix-foo`         | `#6666`      |
| `123-ein-zwo`                     | `#123`       |
| `fix/456-add-2-functions`         | `#456`       |
| `feat/550-add-missing-id`         | `#550`       |
| `42`                              | `#42`        |
| `backup/fix/666-root-of-all-evol` | `#666`       |
| `GH-2`                            | `#GH-2`      |
| `folder/#GH-456`                  | `#GH-456`    |
| `jm/#42`                          | `#42`        |
| `tracker:#21`                     | `#21`        |
| `master`                          | -            |
| `feature/foobar-baz`              | -            |
| `foo/bar`                         | -            |

## Q&A

**Why do you think its good?**
Try to work on a dynamic project that drags on for months and years and is contributed by several authors. At one point you will be asked to _Add spoon_. When you do, you realize it was there and someone removed it. So you `git blame` the file and find that someone has indeed. If you're lucky, the message will say `Remove a spoon`. At that point it would be priceless the know why it happened and have a broader context that might not have been relevant for the source code change at the time of the change but is relevant in project perspective 6 months later. And you might just find it in your issue tracker. So be kind to your future self and colleagues and learn the habit of linking your commits, you will not regret.

**What are git trailers and why use it for references?**
Git [trailers](https://git-scm.com/docs/git-interpret-trailers) are key-value metadata serialized in Git text message. It is parsable, standardized and perfect place for machine managed information, like generated issue tracker reference.

**Why do you use key `Related`?**
I tried to follow [existing conventions](https://git.wiki.kernel.org/index.php/CommitMessageConventions), and came up with `Bug`, `Closes`, `Closes-Bug`, `Partial-Bug` or `Related-Bug`. Because it is applied automatically, I wanted to go as general as possible. Since only few commits will actually resolve the issue, the best match is `Related-Bug`, but since not all _issues_ are _bugs_, I decided to drop the `bug` and tada!

**How can I reference two issues? Should I use `Related: #1, #2`?**
No, prefer duplicate-key records. Here is an example from [git-interpret-trailers docs](https://git-scm.com/docs/git-interpret-trailers#_examples).
```
subject

message

Signed-off-by: Alice <alice@example.com>
Signed-off-by: Bob <bob@example.com>
```

`git-interpret-trailers` can handle duplicates and parses all values, it also introduces duplicate keys when writing different pairs with same key. And you don't have to worry about parsing the delimiters yourself.

```bash
# Bad
Related: #1, #2
```
```bash
# Good
Related: #1
Related: #2
```

## License

This project is licensed under [MIT](./LICENSE).
