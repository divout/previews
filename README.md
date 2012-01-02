# previews
Read user reviews of linux packages.

**Author:**  Ivan K.

[Source on Github](https://github.com/divout/previews)
[![Build Status](https://secure.travis-ci.org/divout/previews.png)](http://travis-ci.org/divout/previews)
## Installation:
    gem install previews
## Usage:
```
previews PACKAGE [options]

Options:
    -d, --sort-date DIRECTION        Sort reviews by date. DIRECTION could be DESC or ASC
    -t, --sort-rating DIRECTION      Sort reviews by rating. DIRECTION could be DESC or ASC
    -u, --sort-usefulness DIRECTION  Sort reviews by usefulness. DIRECTION could be DESC or ASC
                                     Default is DESC
    -s, --[no-]less                  Set `less` for displaying reviews. By default it is true
    -l, --lang LANGUAGE              Set language of reviews. Default is en
    -r, --release RELEASE            Set the release for package. Default is oneiric
    -f, --fields A,B,C               Set the fields you want to display.
                                     Available fields: origin, rating, app_name, language, reviewer_username, reviewer_displayname, summary, review_text, version, date_created, package_name, distroseries
    -h, --help                       Show this message
```
## Example:
    previews vlc --sort-rating asc --lang es
