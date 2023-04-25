.PHONY: all
all:
	false

.PHONY: bootstrap
bootstrap:
	rails generate model Cell mcc:integer mnc:integer lac:integer cid:integer longitude:float latitude:float --force
	rails db:migrate
	rails g controller api/v1/Cells --force

.PHONY: db
db:
	bin/rails db:seed:replant
