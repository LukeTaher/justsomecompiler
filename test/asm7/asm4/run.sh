#!/bin/bash

rm -f asm4.log

# printf "\n> Running asm4 optimisation tests\n\n"
cd ../asm4
for test in test*
do
	rm -f "$test.out"

	input=""
	if [ -f "input/$test.in" ]; then
	    input="$(cat 'input/'$test.in)"
	fi
	../../../some_lang.native -x86 "$test" &> "assembly/$test.s"
	as "assembly/$test.s" -o "$test.o"
	ld -lc -macosx_version_min "10.11" "$test.o" -o "executables/$test" 2> /dev/null
	rm -f "$test.o"
	printf "$input" | ./"executables/$test" &> "$test.out"
	cmp -s "$test.out" "expected/$test.exp"
	if [ $? -eq 0 ]; then
		printf "✅  Passed $test\n"
	else
		printf "❗  Failed $test\n"
		printf "===== Failed $test =====\n\n" >> asm4.log
		printf "===== Input:\n" >> asm4.log
		cat "$test" >> asm4.log
		printf "===== Expected:\n" >> asm4.log
		cat "expected/$test.exp" >> asm4.log
		printf "\n===== Output:\n" >> asm4.log
		cat "$test.out" >> asm4.log
		printf "\n===== Error:\n" >> asm4.log
		cmp "$test.out" "expected/$test.exp" >> asm4.log
		printf "\n\n" >> asm4.log
	fi
done

rm -f *.out
