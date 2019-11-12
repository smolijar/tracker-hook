shunit2:
	curl -o shunit2 https://raw.githubusercontent.com/kward/shunit2/master/shunit2
test: shunit2
	bash ./lib/test.sh
clean:
	rm -rf shunit2