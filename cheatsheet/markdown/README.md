# Markdown

*[Источник](https://www.markdownguide.org)*

[Назад к перечню шпаргалок][back]

### Heading

```markdown
# H1
## H2
### H3
#### H4
##### H5
###### H6

H1
=
H2
-
```

# H1

## H2

### H3

#### H4

##### H5

###### H6

H1
=

H2
-

### Heading ID

```markdown
### My Heading {#heading-id}
```

### My Heading {#heading-id}

### Bold

```markdown
**bold text**
__bold text__
```

**bold text**\
__bold text__

### Italic

```markdown
*italicized text*
_italicized text_
```

*italicized text*\
_italicized text_

### Strikethrough

```markdown
~~The world is flat.~~
```

~~The world is flat.~~

### Highlight

```markdown
I need to highlight these ==very important words==.
```

I need to highlight these ==very important words==.

### Subscript

```markdown
H~2~O
```

H~2~O

### Superscript

```markdown
X^2^
```

X^2^

### Emphasis

```markdown
This text is ***really important***.
This text is ___really important___.
This text is __*really important*__.
This text is **_really important_**.
This is really***very***important text.
```

This text is ***really important***.\
This text is ___really important___.\
This text is __*really important*__.\
This text is **_really important_**.\
This is really***very***important text.

### Blockquote

```markdown
> blockquote
```

> blockquote

```markdown
> Dorothy followed her through many of the beautiful rooms in her castle.
>
> The Witch bade her clean the pots and kettles and sweep the floor and keep the fire fed with wood.
```

> Dorothy followed her through many of the beautiful rooms in her castle.
>
> The Witch bade her clean the pots and kettles and sweep the floor and keep the fire fed with wood.

```markdown
> Dorothy followed her through many of the beautiful rooms in her castle.
>
>> The Witch bade her clean the pots and kettles and sweep the floor and keep the fire fed with wood.
```

> Dorothy followed her through many of the beautiful rooms in her castle.
>
>> The Witch bade her clean the pots and kettles and sweep the floor and keep the fire fed with wood.

```markdown
> #### The quarterly results look great!
>
> - Revenue was off the chart.
> - Profits were higher than ever.
>
>
>  *Everything* is going according to **plan**.
```

> #### The quarterly results look great!
>
> - Revenue was off the chart.
> - Profits were higher than ever.
>
>
>  *Everything* is going according to **plan**.

### Ordered List

```markdown
1. First item
2. Second item
3. Third item
1. First item
1. Second item
8. Third item
3. Third item
    1. Indented item
    2. Indented item
4. Fourth item
```

1. First item
2. Second item
3. Third item
1. First item
1. Second item
8. Third item
3. Third item
    1. Indented item
    2. Indented item
4. Fourth item

### Unordered List

```markdown
- First item
- Second item
- Third item
    - Indented item
    - Indented item
- Fourth item
* First item
* Second item
+ First item
+ Second item

- 1968\. A great year!
- I think 1969 was second best.
```

- First item
- Second item
- Third item
    - Indented item
    - Indented item
- Fourth item

* First item
* Second item

+ First item
+ Second item

- 1968\. A great year!
- I think 1969 was second best.

### Definition List

```markdown
First Term
: This is the definition of the first term.

Second Term
: This is one definition of the second term.
: This is another definition of the second term.
```

First Term
: This is the definition of the first term.

Second Term
: This is one definition of the second term.
: This is another definition of the second term.

### Task List

```markdown
- [x] Write the press release
- [ ] Update the website
- [ ] Contact the media
```

- [x] Write the press release
- [ ] Update the website
- [ ] Contact the media

### Code

`code`

``Use `code` in your Markdown file.``

```
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
```

```json
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
```

    <html>
        <head>
        </head>
    </html>

### Horizontal Rule

```markdown
***
---
___
```

***
---
___

### Link

```markdown
[Markdown Guide](https://www.markdownguide.org)
```

[Markdown Guide](https://www.markdownguide.org)

### Link with Titles

```markdown
My favorite search engine is [Duck Duck Go](https://duckduckgo.com "The best search engine for privacy").
```

My favorite search engine is [Duck Duck Go](https://duckduckgo.com "The best search engine for privacy").

### URL and Email

```markdown
<https://www.markdownguide.org>
<fake@example.com>
```

<https://www.markdownguide.org>\
<fake@example.com>

### Formatting Links

```markdown
I love supporting the **[EFF](https://eff.org)**.
This is the *[Markdown Guide](https://www.markdownguide.org)*.
See the section on [`code`](#code).
```

I love supporting the **[EFF](https://eff.org)**.\
This is the *[Markdown Guide](https://www.markdownguide.org)*.\
See the section on [`code`](#code).

### Reference-style Links

```markdown
[hobbit-hole][1]

[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle
[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle "Hobbit lifestyles"
[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle 'Hobbit lifestyles'
[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle (Hobbit lifestyles)
[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> "Hobbit lifestyles"
[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> 'Hobbit lifestyles'
[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> (Hobbit lifestyles)
```

[hobbit-hole][1]

[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle

[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle "Hobbit lifestyles"

[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle 'Hobbit lifestyles'

[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle (Hobbit lifestyles)

[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> "Hobbit lifestyles"

[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> 'Hobbit lifestyles'

[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> (Hobbit lifestyles)

**An Example Putting the Parts Together:**

```markdown
In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy
smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a [hobbit-hole][1], and that
means comfort.

[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> "Hobbit lifestyles"
```

In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy
smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a [hobbit-hole][1], and that
means comfort.

[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> "Hobbit lifestyles"

### Linking to Heading ID

```markdown
[My Heading](#heading-id)
[My Heading](https://teratron.github.io/cheatsheet/markdown/#heading-id)
```

[My Heading](#heading-id)\
[My Heading](https://teratron.github.io/cheatsheet/markdown/#heading-id)

### Footnote

```markdown
Here's a simple footnote,[^1] and here's a longer one.[^note]

[^1]: This is the first footnote.

[^note]: Here's one with multiple paragraphs and code.

    Indent paragraphs to include them in the footnote.

    `{ my code }`

    Add as many paragraphs as you like.
```

Here's a simple footnote,[^1] and here's a longer one.[^note]

[^1]: This is the first footnote.

[^note]: Here's one with multiple paragraphs and code.

    Indent paragraphs to include them in the footnote.

    `{ my code }`

    Add as many paragraphs as you like.

### Image

```markdown
![alt text](https://www.markdownguide.org/assets/images/tux.png)
```

![alt text](https://www.markdownguide.org/assets/images/tux.png)

### Image with Title

```markdown
![The San Juan Mountains are beautiful!](https://www.markdownguide.org/assets/images/tux.png "San Juan Mountains")
```

![The San Juan Mountains are beautiful!](https://www.markdownguide.org/assets/images/tux.png "San Juan Mountains")

### Linking Image

```markdown
[![An old rock in the desert](https://www.markdownguide.org/assets/images/tux.png "New Mexico by Beau Rogers")](https://www.flickr.com/photos/beaurogers/31833779864)
```

[![An old rock in the desert](https://www.markdownguide.org/assets/images/tux.png "New Mexico by Beau Rogers")](https://www.flickr.com/photos/beaurogers/31833779864)

### Table

```markdown
| Syntax | Description |
| --- | --- |
| Header | Title |
| Paragraph | Text |

| Syntax      | Description |
| ----------- | ----------- |
| Header      | Title       |
| Paragraph   | Text        |

| Syntax      | Description | Test Text     |
| :---        |    :----:   |          ---: |
| Header      | Title       | Here's this   |
| Paragraph   | Text        | And more      |
```

| Syntax | Description |
| --- | --- |
| Header | Title |
| Paragraph | Text |

| Syntax      | Description |
| ----------- | ----------- |
| Header      | Title       |
| Paragraph   | Text        |

| Syntax      | Description | Test Text     |
| :---        |    :----:   |          ---: |
| Header      | Title       | Here's this   |
| Paragraph   | Text        | And more      |

### Emoji

```markdown
Gone camping! :tent: Be back soon.
That is so funny! :joy:
```

Gone camping! :tent: Be back soon.\
That is so funny! :joy:

*See also [Emojipedia](https://https://emojipedia.org/.org)*

### Escaping Characters

```markdown
\* Without the backslash, this would be a bullet in an unordered list.

| Character    | Name |
|-----------|------|
| \ | backslash |
| ` | backtick |
| * | asterisk |
| _ | underscore |
| { } | curly braces |
| [ ] | brackets |
| < > | angle brackets |
| ( ) | parentheses |
| # | pound sign |
| + | plus sign |
| - | minus sign (hyphen) |
| . | dot |
| ! | exclamation mark |
| &#124; | pipe |
```

\* Without the backslash, this would be a bullet in an unordered list.

| Character    | Name |
|-----------|------|
| \ | backslash |
| ` | backtick |
| * | asterisk |
| _ | underscore |
| { } | curly braces |
| [ ] | brackets |
| < > | angle brackets |
| ( ) | parentheses |
| # | pound sign |
| + | plus sign |
| - | minus sign (hyphen) |
| . | dot |
| ! | exclamation mark |
| &#124; | pipe |

[Назад к перечню шпаргалок][back]

[back]: <../.> "Назад к перечню шпаргалок"
