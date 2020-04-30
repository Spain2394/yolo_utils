all:
	echo try: 'make clean', or 'make update'

clean:
	find . -name '._*' -delete
	find . -name '*#' -delete
