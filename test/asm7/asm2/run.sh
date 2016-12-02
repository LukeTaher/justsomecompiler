#!/bin/bash

rm -f asm2.log

# printf "> Running compatible asm1 tests\n\n"
for test in legacy*
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
		printf "===== Failed $test =====\n\n" >> asm2.log
		printf "===== Input:\n" >> asm2.log
		cat "$test" >> asm2.log
		printf "===== Expected:\n" >> asm2.log
		cat "expected/$test.exp" >> asm2.log
		printf "\n===== Output:\n" >> asm2.log
		cat "$test.out" >> asm2.log
		printf "\n===== Error:\n" >> asm2.log
		cmp "$test.out" "expected/$test.exp" >> asm2.log
		printf "\n\n" >> asm2.log
	fi
done

# printf "\n> Running asm2 evaluation tests\n\n"
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
		printf "===== Failed $test =====\n\n" >> asm2.log
		printf "===== Input:\n" >> asm2.log
		cat "$test" >> asm2.log
		printf "===== Expected:\n" >> asm2.log
		cat "expected/$test.exp" >> asm2.log
		printf "\n===== Output:\n" >> asm2.log
		cat "$test.out" >> asm2.log
		printf "\n===== Error:\n" >> asm2.log
		cmp "$test.out" "expected/$test.exp" >> asm2.log
		printf "\n\n" >> asm2.log
	fi
done

rm -f *.out
