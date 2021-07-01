EMACS=emacs

all: compile README.org

README.org: multitran.el
	$(EMACS) -Q -batch -L ../ellit-org.el -l ellit-org --eval '(let ((debug-on-error t)) (ellit-org-export "multitran.el" "README.org"))'

compile: multitran.elc

multitran.elc: multitran.el
	$(EMACS) -Q --batch -f batch-byte-compile multitran.el

clean:
	@rm -vf multitran.elc

.PHONY: clean
