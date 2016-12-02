#!/bin/bash

rm -f asm3.log

# printf "> Running asm3 evaluation tests\n\n"
for test in test*
do
	rm -f "$test.out"
	../../../some_lang.native -x86 "$test" &> "assembly/$test.s"
	as "assembly/$test.s" -o "$test.o"
	ld -lc -macosx_version_min "10.11" "$test.o" -o "executables/$test" 2> /dev/null
	rm -f "$test.o"
	./"executables/$test" &> "$test.out"
	cmp -s "$test.out" "expected/$test.exp"
	if [ $? -eq 0 ]; then
		printf "✅  Passed $test\n"
	else
		printf "❗  Failed $test\n"
		printf "===== Failed $test =====\n\n" >> asm3.log
		printf "===== Input:\n" >> asm3.log
		cat "$test" >> asm3.log
		printf "===== Expected:\n" >> asm3.log
		cat "expected/$test.exp" >> asm3.log
		printf "\n===== Output:\n" >> asm3.log
		cat "$test.out" >> asm3.log
		printf "\n===== Error:\n" >> asm3.log
		cmp "$test.out" "expected/$test.exp" >> asm3.log
		printf "\n\n" >> asm3.log
	fi
done

rm -f *.out
