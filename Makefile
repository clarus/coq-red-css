all:
	docker build --tag=coq-red-css .
	docker run coq-red-css >style.min.css
