#!/bin/bash

printf "\n===== ♻  Cleaning & Compiling ♻  =====\n\n"
make clean -C../ && make -C../
rm -f test.log

for test in asm*
do
	printf "\n===== ⚙  Running %s test script ⚙  =====\n\n" $test
	cd $test
	./run.sh
	cd ../
	if [ -f "$test/$test.log" ]; then
		printf "======= Failed $test tests =======\n\n" >> test.log
		cat "$test/$test.log" >> test.log
		printf "\n\n" >> test.log
		rm -f "$test/$test.log"
	fi
done

if [ -f test.log ]; then
		printf "\n===== ❌  Testing complete  ❌ =====\n\n"
		printf "❗  Tests failed - see test/test.log for more\n\n"
else
		printf "\n===== 👏  Testing complete 👏  =====\n\n"
		printf "✅  All tests passed\n\n"
fi