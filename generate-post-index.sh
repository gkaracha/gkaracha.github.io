#!/usr/bin/env bash

POSTS=( )

for f in c/thoughts/*.content.html; do
  nopath=${f##*/}
  name=${nopath%.content.html}
  # POSTS+=("$name")
  POSTS=("$name" "${POSTS[@]}") # in reverse
done

touch c/thoughtlist.html
> c/thoughtlist.html
# #############################################################################
echo '<!-- GENERATED BY the ./generate-post-index.sh SCRIPT, DO NOT EDIT BY HAND! -->' >> c/thoughtlist.html
echo "<h4>All posts</h4>"                                                              >> c/thoughtlist.html
echo "<ul class=\"nav nav-pills nav-stacked\">"                                        >> c/thoughtlist.html
# #############################################################################
for post in "${POSTS[@]}"; do
  echo "  <li><a target=\"_self\" class=\"external\" title=\"$post\" href=\"thoughts/$post.html\">$post</a></li>" >> c/thoughtlist.html
done
# #############################################################################
echo '</ul>'                                                                           >> c/thoughtlist.html
# #############################################################################

touch c/nested-thoughtlist.html
> c/nested-thoughtlist.html
# #############################################################################
echo '<!-- GENERATED BY the ./generate-post-index.sh SCRIPT, DO NOT EDIT BY HAND! -->' >> c/nested-thoughtlist.html
echo "<h4>All posts</h4>"                                                              >> c/nested-thoughtlist.html
echo "<ul class=\"nav nav-pills nav-stacked\">"                                        >> c/nested-thoughtlist.html
# #############################################################################
for post in "${POSTS[@]}"; do
  echo "  <li><a target=\"_self\" class=\"external\" title=\"$post\" href=\"$post.html\">$post</a></li>" >> c/nested-thoughtlist.html
done
# #############################################################################
echo '</ul>'                                                                           >> c/nested-thoughtlist.html
# #############################################################################