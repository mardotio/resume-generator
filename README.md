# Resume Generator
---

## Overview

This is a small ruby script that uses a template to fomat _yaml_ data into a resume. The resume is formatted using HTML and SCSS.

## Prereqs

- SASS
  - This is a CSS precompiler, and it is used to format the generated HTML.
- Ruby

## Usage

In order for the script to work, you will first need to create a file in the root directory of the project called `resume.yaml`. This file should contain your name, contact information,
and any other information that you want in your resume. Below are the keywords that are expected in the yaml file.

|Key|Class|Required|Description|
|---|-----|--------|-----------|
|`name`|String|True|Your name|
|`contact`|Array|True|Any contact information (i.e. phone, email)|
|`profile`|String|False|A small paragraph that describes you|
|Any other key|Array|False|These will become the headers for your other resume sections (i.e. education -> Education, projects_&_experience -> Projects & Experience|

Each array element under the headers you create is expected to be a hash. All of the array elements under those sections will become a new row under that header. Below are the expected
key values for each array element under your headers.

|Key|Class|Required|Description|
|---|-----|--------|-----------|
|`title`|String|False|Main point for that row, will have slightly larger font than the rest of the values|
|`description`|String|True|Description for that section (i.e. dates), will be displayed to the left of that section|
|`location`|String|False|Will be displayed right under the title, will be in italics|
|`data`|Array|True|Any other info, such as accomplishments,  each array element will be a new bullet|

## Generating Resume

Once you have created the `resume.yaml` file at the root of the project, you can run the following command from the root of the project:

```
ruby scripts/generate_resume.rb
```

Running this command will generate a file called `resume.html` at the root of the project. Now you can simply open this in a browser, and print it (__make sure than the printed page has no margins, as the HTML generated will have its own margins set__).


## Compatibility

The HTML generated has only been tested in Chrome and Safari.
