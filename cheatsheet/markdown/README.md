# Markdown

[The Markdown Guide](https://www.markdownguide.org)

[Назад к перечню шпаргалок][back]

### Heading

# H1

## H2

### H3

#### H4

##### H5

###### H6

H1
==
H2
--

### Heading ID

##### My Great Heading {#custom-id}

```html
<!-- The HTML looks like this: -->
<h5 id="custom-id">My Great Heading</h5>
```

### Bold

**bold text**\
__bold text__

### Italic

*italicized text*\
_italicized text_

### Strikethrough

~~The world is flat.~~

### Highlight

I need to highlight these ==very important words==.

### Subscript

H~2~O

### Superscript

X^2^

### Emphasis

This text is ***really important***.\
This text is ___really important___.\
This text is __*really important*__.\
This text is **_really important_**.\
This is really***very***important text.

### Blockquote

> blockquote

> Dorothy followed her through many of the beautiful rooms in her castle.
>
> The Witch bade her clean the pots and kettles and sweep the floor and keep the fire fed with wood.

> Dorothy followed her through many of the beautiful rooms in her castle.
>
>> The Witch bade her clean the pots and kettles and sweep the floor and keep the fire fed with wood.

> #### The quarterly results look great!
>
> - Revenue was off the chart.
> - Profits were higher than ever.
>
>
>  *Everything* is going according to **plan**.

### Ordered List

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

- First item
- Second item
- Third item
    - Indented item
    - Indented item
- Fourth item

* First item
* Second item
* Third item
+ First item
+ Second item
+ Third item

- 1968\. A great year!
- I think 1969 was second best.

### Definition List

First Term
: This is the definition of the first term.

Second Term
: This is one definition of the second term.
: This is another definition of the second term.

### Task List

-[x] Write the press release
-[ ] Update the website
-[ ] Contact the media

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

***
---
___

### Link

[Markdown Guide](https://www.markdownguide.org)

### Link with Titles

My favorite search engine is [Duck Duck Go](https://duckduckgo.com "The best search engine for privacy").

### URL and Email

<https://www.markdownguide.org>\
<fake@example.com>

### Formatting Links

I love supporting the **[EFF](https://eff.org)**.\
This is the *[Markdown Guide](https://www.markdownguide.org)*.\
See the section on [`code`](#code).

### Reference-style Links

[hobbit-hole][1]\
[hobbit-hole] [1]

[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle

[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle "Hobbit lifestyles"

[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle 'Hobbit lifestyles'

[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle (Hobbit lifestyles)

[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> "Hobbit lifestyles"

[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> 'Hobbit lifestyles'

[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> (Hobbit lifestyles)

**An Example Putting the Parts Together:**

In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy
smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a [hobbit-hole][1], and that
means comfort.

[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> "Hobbit lifestyles"

### Linking to Heading IDs

[Heading ID](#heading-id)\
[Heading ID](https://www.markdownguide.org/extended-syntax#heading-id)

### Image

![alt text](https://www.markdownguide.org/assets/images/tux.png)

### Image with Title

![The San Juan Mountains are beautiful!](https://www.markdownguide.org/assets/images/tux.png "San Juan Mountains")

### Linking Image

[![An old rock in the desert](https://www.markdownguide.org/assets/images/tux.png "New Mexico by Beau Rogers")](https://www.flickr.com/photos/beaurogers/31833779864)

### Table

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

Gone camping! [:tent:] Be back soon.\
That is so funny! [:joy:]

*See also [Emojipedia](https://https://emojipedia.org/.org)*

### Escaping Characters

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

### Footnote

Here's a simple footnote,[^1] and here's a longer one.[^note]

---

[^1]: This is the first footnote.

[^note]: Here's one with multiple paragraphs and code.

    Indent paragraphs to include them in the footnote.

    `{ my code }`

    Add as many paragraphs as you like.

[Назад к перечню шпаргалок][back]

[back]: <https://teratron.github.io/cheatsheet/> "Назад к перечню шпаргалок"
