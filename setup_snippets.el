(provide 'setup_snippets)

;; autoinsert C/C++ header
(define-auto-insert
  (cons "\\.\\([Hh]\\|hh\\|hpp\\)\\'" "Basic C/C++ header")
  '(nil
     "/**\n"
     " * @file: " (file-name-nondirectory buffer-file-name) "\n"
     " *\n"
     " *  created on: " (format-time-string "%e %B %Y") "\n"
     " *      author: Massimo Bianchi <bianchi.massimo@gmail.com>\n"
     " */\n"
     "\n\n"
    (let* ((noext (substring buffer-file-name 0 (match-beginning 0)))
           (nopath (file-name-nondirectory noext))
           (ident (concat "__" (upcase nopath) "_" (upcase (file-name-extension buffer-file-name)) "__")))
      (concat "#ifndef " ident "\n"
              "#define " ident  "\n\n\n"
              "\n\n#endif /* " ident " */\n"))
    ))

;; auto insert C/C++
(define-auto-insert
  (cons "\\.\\([Cc]\\|cc\\|cpp\\)\\'" "Basic C++ implementation")
  '(nil
    "/**\n"
    " * @file: " (file-name-nondirectory buffer-file-name) "\n"
    " *\n"
    " *  created on: " (format-time-string "%e %B %Y") "\n"
    " *      author: Massimo Bianchi <bianchi.massimo@gmail.com>\n"
    " */\n"
    "\n\n"
    ))
