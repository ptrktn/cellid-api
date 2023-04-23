.PHONY: all
all:
	false

.PHONY: db
db:
	rails generate model Cell mcc:integer mnc:integer lac:integer cid:integer longitude:float latitude:float --force
	rails db:migrate
	rails g controller api/v1/Cells --force
