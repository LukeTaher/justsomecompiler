#!/bin/bash

rm -f asm5.log

# printf "> Running asm5 interpretation tests\n\n"
for test in test*
do
	rm -f "$test.out"
	../../../some_lang.native -x86 "$test" &> "assembly/$test.s"
	gcc "assembly/$test.s" -o "executables/$test"
	./"executables/$test" &> "$test.out"
	cmp -s "$test.out" "expected/$test.exp"
	if [ $? -eq 0 ]; then
		printf "✅  Passed $test\n"
	else
		printf "❗  Failed $test\n"
		printf "===== Failed $test =====\n\n" >> asm5.log
		printf "===== Input:\n" >> asm5.log
		cat "$test" >> asm5.log
		printf "===== Expected:\n" >> asm5.log
		cat "expected/$test.exp" >> asm5.log
		printf "\n===== Output:\n" >> asm5.log
		cat "$test.out" >> asm5.log
		printf "\n===== Error:\n" >> asm5.log
		cmp "$test.out" "expected/$test.exp" >> asm5.log
		printf "\n\n" >> asm5.log
	fi
done

rm -f *.out
