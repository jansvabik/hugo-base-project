default:

up:
	hugo server -D

component: scripts/add-component.sh
	bash scripts/add-component.sh $(name)