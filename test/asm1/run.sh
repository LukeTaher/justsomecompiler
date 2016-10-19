#!/bin/bash

rm -f asm1.log

for test in test*
do
	rm -f "$test.out"
	../../some_lang.native -v "$test" &> "$test.out"
	cmp -s "$test.out" "expected/$test.exp"
	if [ $? -eq 0 ]; then
		printf "✅  Passed $test\n"
	else
		printf "❗  Failed $test\n"
		printf "===== Failed $test =====\n\n" >> asm1.log
		printf "===== Input:\n" >> asm1.log
		cat "$test" >> asm1.log
		printf "===== Expected:\n" >> asm1.log
		cat "expected/$test.exp" >> asm1.log
		printf "\n===== Output:\n" >> asm1.log
		cat "$test.out" >> asm1.log
		printf "\n===== Error:\n" >> asm1.log
		cmp "$test.out" "expected/$test.exp" >> asm1.log
		printf "\n\n" >> asm1.log
	fi
done

rm -f *.out
