/**
 * @file: ${1:`(file-name-nondirectory buffer-file-name)`}
 *
 *  created on: ${2:`(format-time-string "%e %B %Y")`}
 *      author: Massimo Bianchi <bianchi.massimo@gmail.com>
 */

#ifndef ${3:__`(upcase (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))`_`(upcase (file-name-extension buffer-file-name))`__}
#define $3

$0

#endif /* $3 */

