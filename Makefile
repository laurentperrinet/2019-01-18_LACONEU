default: github

SRC=2019-01-18_LACONEU

edit:
	atom $(SRC).py

html:
	python3 $(SRC).py index.html

page:
	python3 $(SRC).py
	cat /tmp/wiki.txt |pbcopy
	open https://invibe.net/cgi-bin/index.cgi/Presentations/$(SRC)?action=edit

github: html
	git commit --dry-run -am 'Test' | grep -q -v 'nothing to commit' && git commit -am' updating slides'
	git push
	open https://laurentperrinet.github.io/$(SRC)
