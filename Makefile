usage:
	@echo
	@echo 'usage:'
	@echo
	@echo '  tidy           tidy up go.mod'
	@echo '  mod-update     update dependencies'
	@echo '  mod-reset      reset dependencies to last commited state'
	@echo '  mod-clean      clear module cache'
	@echo

tidy:
	go mod tidy
	go mod vendor

mod-update:
	go get -v -u -t -d ./...
	go mod tidy 
	go mod vendor

mod-reset:
	git checkout -- go.mod
	go mod tidy
	go mod vendor

mod-clean:
	go clean -modcache